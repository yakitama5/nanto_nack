import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../application/quiz_change_payment_method_use_case.dart';
import '../../domain/payment_method.dart';
import '../../infrastructure/payment_quiz_repository_provider.dart';
import 'change_payment_method_quiz_state.dart';

final changePaymentMethodQuizProvider = AutoDisposeNotifierProvider<
    ChangePaymentMethodQuizNotifier, ChangePaymentMethodQuizState>(
  ChangePaymentMethodQuizNotifier.new,
);

/// Quiz 4「支払い元を変更してバーコードを提示する」のNotifier
class ChangePaymentMethodQuizNotifier
    extends AutoDisposeNotifier<ChangePaymentMethodQuizState> {
  static const _quizId = 'payment_quiz4';
  static const _hintPenaltyFailureCount = 2;

  final _useCase = const QuizChangePaymentMethodUseCase();
  Timer? _timer;

  @override
  ChangePaymentMethodQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return ChangePaymentMethodQuizState.initial();
  }

  /// クイズを開始する
  void startQuiz() {
    if (state.status != QuizStatus.idle) return;
    state = ChangePaymentMethodQuizState.initial().copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  /// ボトムナビ中央の支払いボタンをタップ → 支払い画面を開く
  Future<void> tapPayment() async {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(paymentScreenShown: true);
    await _checkAndComplete();
  }

  /// 支払い画面を閉じる
  void closePaymentScreen() {
    state = state.copyWith(paymentScreenShown: false);
  }

  /// 支払い元を変更する（ホームカルーセルまたは支払い画面のボトムシートから）
  Future<void> changePaymentMethod(PaymentMethod method) async {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(currentPaymentMethod: method);
    await _checkAndComplete();
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
    final previousFailureCount = state.failureCount;
    _timer?.cancel();
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: _quizId);
    state = ChangePaymentMethodQuizState.initial().copyWith(
      failureCount: previousFailureCount,
    );
  }

  /// クリア条件を確認し、満たしていれば完了処理を行う
  Future<void> _checkAndComplete() async {
    final isClear = _useCase.isClear(
      currentPaymentMethod: state.currentPaymentMethod,
      paymentScreenShown: state.paymentScreenShown,
    );
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
    final repo = ref.read(paymentQuizRepositoryProvider);
    await repo.saveResult(
      quizId: _quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
    if (isCleared) {
      try {
        await ref.read(analyticsServiceProvider).logQuizCompleted(
              quizId: _quizId,
              score: state.score,
              failureCount: state.failureCount,
              clearTimeMs: elapsedMs,
            );
      } on Exception catch (_) {}
    }
  }
}
