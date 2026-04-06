import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../application/quiz_show_location_use_case.dart';
import '../../infrastructure/map_quiz_repository_provider.dart';
import 'show_location_quiz_state.dart';

final showLocationQuizProvider = AutoDisposeNotifierProvider<
    ShowLocationQuizNotifier, ShowLocationQuizState>(
  ShowLocationQuizNotifier.new,
);

/// Quiz 1「現在地を表示する」のNotifier
class ShowLocationQuizNotifier
    extends AutoDisposeNotifier<ShowLocationQuizState> {
  static const _quizId = 'map_quiz1';
  static const _timeLimitSeconds = 60;

  final _useCase = const QuizShowLocationUseCase();
  Timer? _timer;

  @override
  ShowLocationQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return ShowLocationQuizState.initial(timeLimitSeconds: _timeLimitSeconds);
  }

  /// クイズを開始する
  void startQuiz() {
    _timer?.cancel();
    state = ShowLocationQuizState.initial(
      timeLimitSeconds: _timeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  /// 現在地ボタンをタップした
  Future<void> tapLocation() async {
    if (state.status != QuizStatus.playing) return;

    final isClear = _useCase.isClear(locationShown: true);
    if (isClear) {
      _timer?.cancel();
      final elapsed = _elapsed;
      state = state.copyWith(
        locationShown: true,
        status: QuizStatus.correct,
        elapsedMs: elapsed,
      );
      await hapticFeedback.playSuccessFeedback();
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    }
  }

  /// 諦めてクイズを終了する
  Future<void> giveUp() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();
    final elapsed = _elapsed;
    state = state.copyWith(
      status: QuizStatus.giveUp,
      remainingSeconds: 0,
      elapsedMs: elapsed,
    );
    unawaited(
      ref.read(analyticsServiceProvider).logQuizGivenUp(quizId: _quizId),
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } on Exception catch (_) {}
  }

  /// クイズをリトライする
  void retry() {
    _timer?.cancel();
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: _quizId);
    state = ShowLocationQuizState.initial(
      timeLimitSeconds: _timeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    _startTimer();
  }

  int get _elapsed => state.startedAt != null
      ? clock.now().difference(state.startedAt!).inMilliseconds
      : 0;

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
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
    state = state.copyWith(
      status: QuizStatus.timeUp,
      remainingSeconds: 0,
      elapsedMs: elapsed,
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } on Exception catch (_) {}
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
    final repo = ref.read(mapQuizRepositoryProvider);
    await repo.saveResult(
      quizId: _quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
  }
}
