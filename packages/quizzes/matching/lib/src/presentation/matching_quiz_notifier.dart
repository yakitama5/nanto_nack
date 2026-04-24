import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matching/src/domain/matching_catalog.dart';
import 'package:matching/src/domain/matching_quiz_config.dart';
import 'package:matching/src/infrastructure/matching_quiz_repository.dart';
import 'package:matching/src/infrastructure/matching_quiz_repository_provider.dart';
import 'package:matching/src/presentation/matching_app_state.dart';
import 'package:matching/src/presentation/matching_quiz_state.dart';
import 'package:matching/src/presentation/matching_quiz_type.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

/// マッチングクイズの統合 Provider。
///
/// [MatchingQuizType] を family 引数に渡すことで Quiz1〜4 のどれかを指定する。
/// ```dart
/// ref.watch(matchingQuizProvider(MatchingQuizType.swipeRight))
/// ref.read(matchingQuizProvider(MatchingQuizType.swipeRight).notifier).swipeRight(id)
/// ```
final matchingQuizProvider = NotifierProvider.autoDispose
    .family<MatchingQuizNotifier, MatchingQuizState, MatchingQuizType>(
  MatchingQuizNotifier.new,
);

/// マッチングクイズ共通の Notifier。
///
/// Quiz1〜4 のすべての挙動を1つにまとめ、クイズ種別 ([arg]) によって
/// クリア条件を切り替える。
class MatchingQuizNotifier
    extends AutoDisposeFamilyNotifier<MatchingQuizState, MatchingQuizType> {
  Timer? _timer;

  /// クイズ種別に対応する永続化ID
  String get _quizId => switch (arg) {
        MatchingQuizType.swipeRight => 'matching_quiz1',
        MatchingQuizType.swipeLeft => 'matching_quiz2',
        MatchingQuizType.viewPhoto => 'matching_quiz3',
        MatchingQuizType.superLike => 'matching_quiz4',
      };

  @override
  MatchingQuizState build(MatchingQuizType arg) {
    ref.onDispose(() => _timer?.cancel());
    return MatchingQuizState.initial(initialProfiles: MatchingCatalog.profiles);
  }

  // ─────────────────────────────────────────────
  // 共通アクション
  // ─────────────────────────────────────────────

  void startQuiz() {
    _timer?.cancel();
    state = state.copyWith(
      status: QuizStatus.playing,
      // clock.now() を使用してテスト時に差し替え可能にする
      startedAt: clock.now(),
      remainingSeconds: MatchingQuizConfig.timeLimitSeconds,
      matchingApp: MatchingAppState.initial(
        initialProfiles: MatchingCatalog.profiles,
      ),
    );
    unawaited(
      ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId),
    );
    _startTimer();
  }

  Future<void> giveUp() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();
    final elapsed = _elapsed;
    final analyticsService = ref.read(analyticsServiceProvider);
    final repo = ref.read(matchingQuizRepositoryProvider);
    state = state.copyWith(status: QuizStatus.giveUp, elapsedMs: elapsed);
    unawaited(analyticsService.logQuizGivenUp(quizId: _quizId));
    try {
      await _saveResult(
        isCleared: false,
        elapsedMs: elapsed,
        analyticsService: analyticsService,
        repo: repo,
      );
    } catch (error, stackTrace) {
      appLogger.e(
        '[MatchingQuizNotifier] giveUp: _saveResult failed',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  void retry() {
    if (state.status == QuizStatus.playing) return;
    _timer?.cancel();
    unawaited(
      ref.read(analyticsServiceProvider).logQuizRetried(quizId: _quizId),
    );
    state = MatchingQuizState.initial(
      initialProfiles: MatchingCatalog.profiles,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      remainingSeconds: MatchingQuizConfig.timeLimitSeconds,
    );
    _startTimer();
  }

  // ─────────────────────────────────────────────
  // Quiz1: 右スワイプでいいね
  // ─────────────────────────────────────────────

  /// 指定IDのプロフィールに「いいね」する。
  ///
  /// Quiz1 のクリア条件: swipeRight が実行された瞬間にクリア。
  void swipeRight(String id) {
    if (state.status != QuizStatus.playing) return;
    if (arg == MatchingQuizType.swipeRight) {
      unawaited(_onClear());
    }
  }

  // ─────────────────────────────────────────────
  // Quiz2: 左スワイプでスキップ
  // ─────────────────────────────────────────────

  /// 指定IDのプロフィールを「スキップ」する。
  ///
  /// Quiz2 のクリア条件: swipeLeft が実行された瞬間にクリア。
  void swipeLeft(String id) {
    if (state.status != QuizStatus.playing) return;
    if (arg == MatchingQuizType.swipeLeft) {
      unawaited(_onClear());
    }
  }

  // ─────────────────────────────────────────────
  // Quiz4: 上スワイプで超いいね
  // ─────────────────────────────────────────────

  /// 指定IDのプロフィールに「超いいね」する。
  ///
  /// Quiz4 のクリア条件: swipeUp が実行された瞬間にクリア。
  void swipeUp(String id) {
    if (state.status != QuizStatus.playing) return;
    if (arg == MatchingQuizType.superLike) {
      unawaited(_onClear());
    }
  }

  // ─────────────────────────────────────────────
  // Quiz3: 写真の切り替え
  // ─────────────────────────────────────────────

  /// 現在表示中のプロフィールの次の写真へ切り替える。
  ///
  /// Quiz3 のクリア条件: currentImageIndex が 1 以上になった瞬間にクリア。
  void nextImage() {
    if (state.status != QuizStatus.playing) return;
    final profiles = state.matchingApp.profiles;
    if (profiles.isEmpty) return;
    final currentProfile = profiles[state.matchingApp.currentCardIndex];
    final nextIndex = state.matchingApp.currentImageIndex + 1;
    if (nextIndex >= currentProfile.emojis.length) return; // 最後の絵文字の場合は何もしない
    state = state.copyWith(
      matchingApp: state.matchingApp.copyWith(currentImageIndex: nextIndex),
    );
    if (arg == MatchingQuizType.viewPhoto && nextIndex >= 1) {
      unawaited(_onClear());
    }
  }

  /// 現在表示中のプロフィールの前の写真へ切り替える。
  void previousImage() {
    if (state.status != QuizStatus.playing) return;
    final prevIndex = state.matchingApp.currentImageIndex - 1;
    if (prevIndex < 0) return; // 最初の写真の場合は何もしない
    state = state.copyWith(
      matchingApp: state.matchingApp.copyWith(currentImageIndex: prevIndex),
    );
  }

  /// スワイプ完了時に呼び出す。トップカードのインデックスと写真インデックスを同時に更新する。
  void onCardSwiped(int newTopCardIndex) {
    if (state.status != QuizStatus.playing) return;
    final alreadyUpdated = state.matchingApp.currentCardIndex == newTopCardIndex &&
        state.matchingApp.currentImageIndex == 0;
    if (alreadyUpdated) return; // 冪等ガード
    state = state.copyWith(
      matchingApp: state.matchingApp.copyWith(
        currentCardIndex: newTopCardIndex,
        currentImageIndex: 0,
      ),
    );
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
        unawaited(_onTimeUp());
      } else {
        state = state.copyWith(remainingSeconds: remaining);
      }
    });
  }

  Future<void> _onTimeUp() async {
    final elapsed = _elapsed;
    final analyticsService = ref.read(analyticsServiceProvider);
    final repo = ref.read(matchingQuizRepositoryProvider);
    state = state.copyWith(status: QuizStatus.timeUp, elapsedMs: elapsed);
    unawaited(analyticsService.logQuizTimeUp(quizId: _quizId));
    try {
      await _saveResult(
        isCleared: false,
        elapsedMs: elapsed,
        analyticsService: analyticsService,
        repo: repo,
      );
    } catch (error, stackTrace) {
      appLogger.e(
        '[MatchingQuizNotifier] _onTimeUp: _saveResult failed',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// クリア処理。
  ///
  /// autoDispose により dispose 後に ref.read すると例外になるため、
  /// state 変更前に依存サービスをキャッシュしてから非同期処理を行う。
  Future<void> _onClear() async {
    _timer?.cancel();
    final elapsed = _elapsed;
    final analyticsService = ref.read(analyticsServiceProvider);
    final repo = ref.read(matchingQuizRepositoryProvider);
    state = state.copyWith(status: QuizStatus.correct, elapsedMs: elapsed);
    try {
      await _saveResult(
        isCleared: true,
        elapsedMs: elapsed,
        analyticsService: analyticsService,
        repo: repo,
      );
    } catch (error, stackTrace) {
      appLogger.e(
        '[MatchingQuizNotifier] _onClear: _saveResult failed',
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
    required AnalyticsService analyticsService,
    required MatchingQuizRepository repo,
  }) async {
    if (isCleared) {
      await analyticsService.logQuizCompleted(
            quizId: _quizId,
            score: state.score,
            failureCount: state.failureCount,
            clearTimeMs: elapsedMs,
          );
    }
    await repo.saveResult(
      quizId: _quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
  }
}
