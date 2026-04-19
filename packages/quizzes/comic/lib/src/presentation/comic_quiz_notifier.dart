import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../domain/comic_quiz_config.dart';
import 'comic_quiz_state.dart';
import 'comic_quiz_type.dart';

final comicQuizProvider = NotifierProvider.autoDispose
    .family<ComicQuizNotifier, ComicQuizState, ComicQuizType>(
      ComicQuizNotifier.new,
    );

class ComicQuizNotifier
    extends AutoDisposeFamilyNotifier<ComicQuizState, ComicQuizType> {
  Timer? _timer;

  static String _quizId(ComicQuizType type) => switch (type) {
    ComicQuizType.quiz1 => 'comic_quiz1',
    ComicQuizType.quiz2 => 'comic_quiz2',
    ComicQuizType.quiz3 => 'comic_quiz3',
    ComicQuizType.quiz4 => 'comic_quiz4',
  };

  static int _initialPageIndex(ComicQuizType type) => switch (type) {
    ComicQuizType.quiz1 => ComicQuizConfig.quiz1InitialPage,
    _ => 0,
  };

  @override
  ComicQuizState build(ComicQuizType arg) {
    ref.onDispose(() => _timer?.cancel());
    return ComicQuizState.initial(
      timeLimitSeconds: ComicQuizConfig.timeLimitSeconds,
      initialPageIndex: _initialPageIndex(arg),
    );
  }

  void startQuiz() {
    if (state.status != QuizStatus.idle) return;
    // clock.now() を使用（DateTime.now() は禁止）
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      remainingSeconds: ComicQuizConfig.timeLimitSeconds,
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId(arg));
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
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
    if (state.status != QuizStatus.playing) return;
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;
    state = state.copyWith(
      status: QuizStatus.timeUp,
      remainingSeconds: 0,
      elapsedMs: elapsed,
    );
    // await をまたぐ前に ref.read・state 値をスナップショット
    final quizId = _quizId(arg);
    final score = state.score;
    final failureCount = state.failureCount;
    final analyticsService = ref.read(analyticsServiceProvider);
    final quizResultRepository = ref.read(quizResultRepositoryProvider);
    try {
      await _saveResult(
        isCleared: false,
        elapsedMs: elapsed,
        quizId: quizId,
        score: score,
        failureCount: failureCount,
        analyticsService: analyticsService,
        quizResultRepository: quizResultRepository,
      );
    } catch (error, stackTrace) {
      appLogger.e(
        'Failed to save quiz result on time up',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> giveUp() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;
    state = state.copyWith(
      status: QuizStatus.giveUp,
      remainingSeconds: 0,
      elapsedMs: elapsed,
    );
    // await をまたぐ前に ref.read・state 値をスナップショット
    final quizId = _quizId(arg);
    final score = state.score;
    final failureCount = state.failureCount;
    final analyticsService = ref.read(analyticsServiceProvider);
    final quizResultRepository = ref.read(quizResultRepositoryProvider);
    unawaited(analyticsService.logQuizGivenUp(quizId: quizId));
    try {
      await _saveResult(
        isCleared: false,
        elapsedMs: elapsed,
        quizId: quizId,
        score: score,
        failureCount: failureCount,
        analyticsService: analyticsService,
        quizResultRepository: quizResultRepository,
      );
    } catch (error, stackTrace) {
      appLogger.e(
        'Failed to save quiz result on give up',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  void retry() {
    _timer?.cancel();
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: _quizId(arg));
    state = ComicQuizState.initial(
      timeLimitSeconds: ComicQuizConfig.timeLimitSeconds,
      initialPageIndex: _initialPageIndex(arg),
    );
  }

  // ─── MangaApp アクション ─────────────────────────────────────────

  /// ページを移動する（日本語漫画は右開きのため reverse: true での実際のインデックス）
  void goToPage(int index) {
    if (state.status != QuizStatus.playing) return;
    final clamped = index.clamp(0, ComicQuizConfig.totalPages - 1);
    if (state.mangaApp.currentPageIndex == clamped) return;
    state = state.copyWith(
      mangaApp: state.mangaApp.copyWith(currentPageIndex: clamped),
    );
    _checkClearCondition();
  }

  /// メニューの表示/非表示を切り替える
  void toggleMenu() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      mangaApp: state.mangaApp.copyWith(
        isMenuVisible: !state.mangaApp.isMenuVisible,
      ),
    );
    _checkClearCondition();
  }

  /// 応援ボタンをタップする
  void incrementLikes() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      mangaApp: state.mangaApp.copyWith(
        likeCount: state.mangaApp.likeCount + 1,
      ),
    );
    _checkClearCondition();
  }

  /// 拡大率を更新する（InteractiveViewer の TransformationController から取得）
  void updateScale(double scale) {
    if (state.status != QuizStatus.playing) return;
    if (state.mangaApp.currentScale == scale) return;
    state = state.copyWith(
      mangaApp: state.mangaApp.copyWith(currentScale: scale),
    );
    _checkClearCondition();
  }

  void _checkClearCondition() {
    if (state.status != QuizStatus.playing) return;
    final cleared = switch (arg) {
      ComicQuizType.quiz1 =>
        state.mangaApp.currentPageIndex == ComicQuizConfig.quiz1TargetPage,
      ComicQuizType.quiz2 =>
        state.mangaApp.currentScale >= ComicQuizConfig.quiz2ScaleThreshold,
      ComicQuizType.quiz3 => state.mangaApp.isMenuVisible,
      ComicQuizType.quiz4 =>
        state.mangaApp.likeCount >= ComicQuizConfig.quiz4LikeTarget,
    };
    if (cleared) _onCleared();
  }

  void _onCleared() {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;
    state = state.copyWith(
      status: QuizStatus.correct,
      elapsedMs: elapsed,
    );
    // await をまたぐ前に ref.read の結果を取得しておく
    // （autoDispose Provider で await 中に dispose されると ref.read が例外になるため）
    _saveResultAsync(elapsedMs: elapsed);
  }

  void _saveResultAsync({required int elapsedMs}) {
    // await をまたぐ前に ref.read・state 値をスナップショット
    final quizId = _quizId(arg);
    final score = state.score;
    final failureCount = state.failureCount;
    final analyticsService = ref.read(analyticsServiceProvider);
    final quizResultRepository = ref.read(quizResultRepositoryProvider);
    unawaited(
      () async {
        try {
          await hapticFeedback.playSuccessFeedback();
          await _saveResult(
            isCleared: true,
            elapsedMs: elapsedMs,
            quizId: quizId,
            score: score,
            failureCount: failureCount,
            analyticsService: analyticsService,
            quizResultRepository: quizResultRepository,
          );
        } catch (error, stackTrace) {
          appLogger.e(
            'Failed to save quiz result on cleared',
            error: error,
            stackTrace: stackTrace,
          );
        }
      }(),
    );
  }

  Future<void> _saveResult({
    required bool isCleared,
    required int elapsedMs,
    required String quizId,
    required int score,
    required int failureCount,
    required AnalyticsService analyticsService,
    required QuizResultRepository quizResultRepository,
  }) async {
    if (isCleared) {
      await analyticsService.logQuizCompleted(
        quizId: quizId,
        score: score,
        failureCount: failureCount,
        clearTimeMs: elapsedMs,
      );
    }
    await quizResultRepository.saveBestRecord(
      quizId: quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? score : 0,
      failureCount: failureCount,
    );
    await quizResultRepository.logPlay(
      quizId: quizId,
      isCleared: isCleared,
      score: isCleared ? score : 0,
      failureCount: failureCount,
    );
  }
}
