import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../application/quiz_send_money_use_case.dart';
import '../../infrastructure/payment_quiz_repository_provider.dart';
import 'send_money_quiz_state.dart';

final sendMoneyQuizProvider = AutoDisposeNotifierProvider<
    SendMoneyQuizNotifier, SendMoneyQuizState>(
  SendMoneyQuizNotifier.new,
);

/// Quiz 3「送金する」のNotifier
class SendMoneyQuizNotifier extends AutoDisposeNotifier<SendMoneyQuizState> {
  static const _quizId = 'payment_quiz3';
  static const _timeLimitSeconds = 60;

  final _useCase = const QuizSendMoneyUseCase();
  Timer? _timer;

  @override
  SendMoneyQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return SendMoneyQuizState.initial(timeLimitSeconds: _timeLimitSeconds);
  }

  /// クイズを開始する
  void startQuiz() {
    _timer?.cancel();
    state = SendMoneyQuizState.initial(timeLimitSeconds: _timeLimitSeconds)
        .copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  /// 「送る」ボタンをタップ（ホーム → 送金画面へ）
  void tapSend() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(showSendScreen: true);
  }

  /// 送金画面を閉じる
  void closeSendScreen() {
    state = state.copyWith(
      showSendScreen: false,
      clearSelectedContact: true,
      amount: 0,
    );
  }

  /// コンタクトを選択
  void selectContact(String contactId) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(selectedContactId: contactId);
  }

  /// テンキー入力
  void onAmountKey(String key) {
    if (state.status != QuizStatus.playing) return;
    if (key == '⌫') {
      final current = state.amount.toString();
      if (current.length <= 1) {
        state = state.copyWith(amount: 0);
      } else {
        state = state.copyWith(
          amount: int.parse(current.substring(0, current.length - 1)),
        );
      }
    } else {
      final newAmount = int.tryParse('${state.amount}$key') ?? state.amount;
      if (newAmount <= 999999) {
        state = state.copyWith(amount: newAmount);
      }
    }
  }

  /// 送金ボタンをタップ
  Future<void> tapSendMoney() async {
    if (state.status != QuizStatus.playing) return;
    if (state.selectedContactId == null || state.amount <= 0) return;

    _timer?.cancel();
    final elapsed = _elapsed;
    final isClear = _useCase.isClear(moneySent: true, amount: state.amount);

    if (isClear) {
      state = state.copyWith(moneySent: true);
      state = state.copyWith(
        status: QuizStatus.correct,
        elapsedMs: elapsed,
      );
      await hapticFeedback.playSuccessFeedback();
      try {
        await _saveResult(isCleared: true, elapsedMs: elapsed);
      } on Exception catch (_) {}
    } else {
      await hapticFeedback.playErrorFeedback();
      state = state.copyWith(
        status: QuizStatus.incorrect,
        elapsedMs: elapsed,
        failureCount: state.failureCount + 1,
      );
      try {
        await _saveResult(isCleared: false, elapsedMs: elapsed);
      } on Exception catch (_) {}
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
    state = SendMoneyQuizState.initial(timeLimitSeconds: _timeLimitSeconds)
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
