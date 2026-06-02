import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../domain/chart_data_generator.dart';
import '../domain/chart_period.dart';
import '../domain/finance_quiz_config.dart';
import '../domain/finance_quiz_type.dart';
import '../infrastructure/finance_quiz_repository_provider.dart';
import 'stock_app_quiz_state.dart';

final stockAppQuizProvider = AutoDisposeNotifierProvider.family<
    StockAppQuizNotifier, StockAppQuizState, FinanceQuizType>(
  StockAppQuizNotifier.new,
);

class StockAppQuizNotifier
    extends AutoDisposeFamilyNotifier<StockAppQuizState, FinanceQuizType> {
  Timer? _timer;

  // initial pan recorded on first updateInteraction during playing state
  double? _initialPanDx;

  @override
  StockAppQuizState build(FinanceQuizType arg) {
    ref.onDispose(() => _timer?.cancel());
    return StockAppQuizState.initial(arg);
  }

  void startQuiz() {
    if (state.status != QuizStatus.idle) return;
    _initialPanDx = null;
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: arg.quizId);
    _startTimer();
  }

  void changePeriod(ChartPeriod period) {
    if (state.status != QuizStatus.playing) return;
    if (state.selectedPeriod == period) return;
    state = state.copyWith(
      selectedPeriod: period,
      chartData: ChartDataGenerator.generate(period),
    );
    _checkClear();
  }

  void updateInteraction(double scale, Offset panOffset) {
    if (state.status != QuizStatus.playing) return;
    _initialPanDx ??= panOffset.dx;
    state = state.copyWith(currentScale: scale, panOffset: panOffset);
    _checkClear();
  }

  void setTouchState(bool isTouching) {
    if (state.status != QuizStatus.playing) return;
    if (state.isTouchingChart == isTouching) return;
    state = state.copyWith(isTouchingChart: isTouching);
    _checkClear();
  }

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
      ref.read(analyticsServiceProvider).logQuizGivenUp(quizId: arg.quizId),
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } on Exception catch (_) {}
  }

  void retry() {
    _timer?.cancel();
    _initialPanDx = null;
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: arg.quizId);
    state = StockAppQuizState.initial(arg);
  }

  int get _elapsed => state.startedAt != null
      ? clock.now().difference(state.startedAt!).inMilliseconds
      : 0;

  void _checkClear() {
    if (state.status != QuizStatus.playing) return;
    if (!_isClear()) return;

    _timer?.cancel();
    final elapsed = _elapsed;
    state = state.copyWith(
      status: QuizStatus.correct,
      elapsedMs: elapsed,
    );
    unawaited(hapticFeedback.playSuccessFeedback());
    unawaited(_saveResult(isCleared: true, elapsedMs: elapsed));
  }

  bool _isClear() => switch (arg) {
        FinanceQuizType.quiz1 => _initialPanDx != null &&
            (state.panOffset.dx - _initialPanDx!) >=
                FinanceQuizConfig.quiz1PanThreshold,
        FinanceQuizType.quiz2 =>
          state.currentScale <= FinanceQuizConfig.quiz2ScaleThreshold,
        FinanceQuizType.quiz3 => state.isTouchingChart,
        FinanceQuizType.quiz4 =>
          state.selectedPeriod == ChartPeriod.oneWeek,
      };

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
            quizId: arg.quizId,
            score: state.score,
            failureCount: state.failureCount,
            clearTimeMs: elapsedMs,
          );
    }
    final repo = ref.read(financeQuizRepositoryProvider);
    await repo.saveResult(
      quizId: arg.quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
  }
}
