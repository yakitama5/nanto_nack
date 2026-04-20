import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../application/quiz_reveal_balance_use_case.dart';
import '../../infrastructure/payment_quiz_repository_provider.dart';
import 'reveal_balance_quiz_state.dart';

final revealBalanceQuizProvider = AutoDisposeNotifierProvider<
    RevealBalanceQuizNotifier, RevealBalanceQuizState>(
  RevealBalanceQuizNotifier.new,
);

/// Quiz 2「残高を隠す」のNotifier
class RevealBalanceQuizNotifier
    extends AutoDisposeNotifier<RevealBalanceQuizState> {
  static const _quizId = 'payment_quiz2';
  static const _hintPenaltyFailureCount = 2;

  final _useCase = const QuizRevealBalanceUseCase();
  Timer? _timer;

  @override
  RevealBalanceQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return RevealBalanceQuizState.initial();
  }

  /// クイズを開始する
  void startQuiz() {
    _timer?.cancel();
    state =
        RevealBalanceQuizState.initial()
            .copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  /// 目アイコンをタップ（残高の表示/非表示を切り替え）
  Future<void> tapEyeIcon() async {
    if (state.status != QuizStatus.playing) return;

    // 残高を隠す（balanceHidden: true = クリア状態）
    state = state.copyWith(balanceHidden: true);

    final isClear = _useCase.isClear(balanceHidden: true);
    if (isClear) {
      _timer?.cancel();
      final elapsed = _elapsed;
      state = state.copyWith(
        status: QuizStatus.correct,
        elapsedMs: elapsed,
      );
      await hapticFeedback.playSuccessFeedback();
      try {
        await _saveResult(isCleared: true, elapsedMs: elapsed);
      } on Exception catch (_) {}
    }
  }

  /// ヒントを使用する（スコア減点）
  void useHint() {
    if (state.status != QuizStatus.playing || state.hintUsed) return;
    state = state.copyWith(
      hintUsed: true,
      failureCount: state.failureCount + _hintPenaltyFailureCount,
    );
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
    state =
        RevealBalanceQuizState.initial()
            .copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      failureCount: state.failureCount,
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
    final repo = ref.read(paymentQuizRepositoryProvider);
    await repo.saveResult(
      quizId: _quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
  }
}
