import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/src/domain/entities/news_article.dart';
import 'package:news/src/domain/news_catalog.dart';
import 'package:news/src/domain/news_quiz_config.dart';
import 'package:news/src/infrastructure/news_quiz_repository_provider.dart';
import 'package:news/src/presentation/news_app_state.dart';
import 'package:news/src/presentation/news_quiz_state.dart';
import 'package:news/src/presentation/news_quiz_type.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

/// ニュースクイズの統合 Provider。
///
/// [NewsQuizType] を family 引数に渡すことで Quiz1〜4 のどれかを指定する。
/// ```dart
/// ref.watch(newsQuizProvider(NewsQuizType.refresh))
/// ref.read(newsQuizProvider(NewsQuizType.refresh).notifier).refreshNews()
/// ```
final newsQuizProvider = NotifierProvider.autoDispose
    .family<NewsQuizNotifier, NewsQuizState, NewsQuizType>(
  NewsQuizNotifier.new,
);

/// ニュースクイズ共通の Notifier。
///
/// Quiz1〜4 のすべての挙動を1つにまとめ、クイズ種別 ([arg]) によって
/// クリア条件を切り替える。
class NewsQuizNotifier
    extends AutoDisposeFamilyNotifier<NewsQuizState, NewsQuizType> {
  Timer? _timer;

  /// クイズ種別に対応する永続化ID
  String get _quizId => switch (arg) {
        NewsQuizType.refresh => 'news_quiz1',
        NewsQuizType.category => 'news_quiz2',
        NewsQuizType.fontSize => 'news_quiz3',
        NewsQuizType.hideArticle => 'news_quiz4',
      };

  @override
  NewsQuizState build(NewsQuizType arg) {
    ref.onDispose(() => _timer?.cancel());
    return NewsQuizState.initial(initialArticles: NewsCatalog.articles());
  }

  // ─────────────────────────────────────────────
  // 共通アクション
  // ─────────────────────────────────────────────

  void startQuiz() {
    _timer?.cancel();
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      remainingSeconds: NewsQuizConfig.timeLimitSeconds,
      newsApp: NewsAppState.initial(initialArticles: NewsCatalog.articles()),
      isRefreshing: false,
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  Future<void> giveUp() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();
    final elapsed = _elapsed;
    state = state.copyWith(status: QuizStatus.giveUp, elapsedMs: elapsed);
    unawaited(
      ref.read(analyticsServiceProvider).logQuizGivenUp(quizId: _quizId),
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (error, stackTrace) {
      appLogger.e(
        '[NewsQuizNotifier] giveUp: _saveResult failed',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  void retry() {
    if (state.status == QuizStatus.playing) return;
    _timer?.cancel();
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: _quizId);
    state = NewsQuizState.initial(
      initialArticles: NewsCatalog.articles(),
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    _startTimer();
  }

  // ─────────────────────────────────────────────
  // Quiz1: Pull to Refresh
  // ─────────────────────────────────────────────

  /// ニュースを更新する。
  ///
  /// Quiz1の場合: クリア処理は await の前に完結させる。
  /// autoDispose により dispose 後に ref.read すると例外になるため、
  /// await を含む _saveResult を先に完了させてから haptic を再生する。
  ///
  /// その他のクイズ: ローディング演出のみ（クリア条件でないため）。
  Future<void> refreshNews() async {
    if (state.status != QuizStatus.playing) return;

    if (arg == NewsQuizType.refresh) {
      // Quiz1: クリア判定 → state更新 → 永続化 → haptic の順で処理する
      _timer?.cancel();
      final elapsed = _elapsed;
      state = state.copyWith(
        status: QuizStatus.correct,
        elapsedMs: elapsed,
        isRefreshing: true,
      );
      try {
        await _saveResult(isCleared: true, elapsedMs: elapsed);
      } catch (error, stackTrace) {
        appLogger.e(
          '[NewsQuizNotifier] refreshNews: _saveResult failed',
          error: error,
          stackTrace: stackTrace,
        );
      } finally {
        await hapticFeedback.playSuccessFeedback();
      }
      return;
    }

    // その他のクイズ: Pull to Refresh 演出のみ（ref.read は不要）
    state = state.copyWith(isRefreshing: true);
    await Future<void>.delayed(const Duration(milliseconds: 800));
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(isRefreshing: false);
  }

  // ─────────────────────────────────────────────
  // Quiz2: カテゴリ切替
  // ─────────────────────────────────────────────

  /// カテゴリを切り替える
  void changeCategory(NewsCategory category) {
    if (state.status != QuizStatus.playing) return;
    if (state.newsApp.currentCategory == category) return; // 冪等ガード
    state = state.copyWith(
      newsApp: state.newsApp.copyWith(currentCategory: category),
    );
    if (arg == NewsQuizType.category && category == NewsCategory.sports) {
      _onClear();
    }
  }

  // ─────────────────────────────────────────────
  // Quiz3: 文字サイズ変更
  // ─────────────────────────────────────────────

  /// 記事の文字サイズを変更する
  void changeFontSize(ArticleFontSize newSize) {
    if (state.status != QuizStatus.playing) return;
    if (state.newsApp.fontSize == newSize) return; // 冪等ガード
    state = state.copyWith(
      newsApp: state.newsApp.copyWith(fontSize: newSize),
    );
    if (arg == NewsQuizType.fontSize && newSize == ArticleFontSize.large) {
      _onClear();
    }
  }

  // ─────────────────────────────────────────────
  // Quiz4: 記事の非表示
  // ─────────────────────────────────────────────

  /// 指定IDの記事を非表示にする
  void hideArticle(String id) {
    if (state.status != QuizStatus.playing) return;
    final already = state.newsApp.articles.any((a) => a.id == id && a.isHidden);
    if (already) return;
    final updated = state.newsApp.articles
        .map((a) => a.id == id ? a.copyWith(isHidden: true) : a)
        .toList();
    state = state.copyWith(
      newsApp: state.newsApp.copyWith(articles: updated),
    );
    if (arg == NewsQuizType.hideArticle &&
        id == NewsQuizConfig.quiz4TargetArticleId) {
      _onClear();
    }
  }

  // ─────────────────────────────────────────────
  // Private helpers
  // ─────────────────────────────────────────────

  int get _elapsed => state.startedAt != null
      ? clock.now().difference(state.startedAt!).inMilliseconds
      : 0;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.status != QuizStatus.playing) {
        _timer?.cancel();
        return;
      }
      final remaining = state.remainingSeconds - 1;
      if (remaining <= 0) {
        _timer?.cancel();
        _onTimeUp();
      } else {
        state = state.copyWith(remainingSeconds: remaining);
      }
    });
  }

  Future<void> _onTimeUp() async {
    final elapsed = _elapsed;
    state = state.copyWith(status: QuizStatus.timeUp, elapsedMs: elapsed);
    unawaited(
      ref.read(analyticsServiceProvider).logQuizGivenUp(quizId: _quizId),
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (error, stackTrace) {
      appLogger.e(
        '[NewsQuizNotifier] _onTimeUp: _saveResult failed',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// クリア処理（Quiz2〜4用）
  ///
  /// autoDispose により dispose 後に ref.read すると例外になるため、
  /// 永続化処理を先に完了させてから haptic を再生する。
  Future<void> _onClear() async {
    _timer?.cancel();
    final elapsed = _elapsed;
    state = state.copyWith(status: QuizStatus.correct, elapsedMs: elapsed);
    try {
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } catch (error, stackTrace) {
      appLogger.e(
        '[NewsQuizNotifier] _onClear: _saveResult failed',
        error: error,
        stackTrace: stackTrace,
      );
    } finally {
      await hapticFeedback.playSuccessFeedback();
    }
  }

  Future<void> _saveResult({
    required bool isCleared,
    required int elapsedMs,
  }) async {
    if (isCleared) {
      await ref.read(analyticsServiceProvider).logQuizCompleted(
            quizId: _quizId,
            score: state.score,
            failureCount: state.failureCount,
            clearTimeMs: elapsedMs,
          );
    }
    final repo = ref.read(newsQuizRepositoryProvider);
    await repo.saveResult(
      quizId: _quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
  }
}
