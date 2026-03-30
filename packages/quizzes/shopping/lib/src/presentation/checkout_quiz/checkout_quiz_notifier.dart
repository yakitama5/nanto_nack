import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/application/quiz_checkout_use_case.dart';
import 'package:shopping/src/infrastructure/shopping_quiz_repository_provider.dart';
import 'package:shopping/src/presentation/checkout_quiz/checkout_quiz_state.dart';

final checkoutQuizProvider =
    AutoDisposeNotifierProvider<CheckoutQuizNotifier, CheckoutQuizState>(
  CheckoutQuizNotifier.new,
);

class CheckoutQuizNotifier extends AutoDisposeNotifier<CheckoutQuizState> {
  static const _quizId = 'shopping_checkout';
  static const _timeLimitSeconds = 90;

  final _useCase = const QuizCheckoutUseCase();
  Timer? _timer;

  @override
  CheckoutQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return CheckoutQuizState.initial(timeLimitSeconds: _timeLimitSeconds);
  }

  /// クイズを開始する（タイマー始動）
  void startQuiz() {
    _timer?.cancel();
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      remainingSeconds: _timeLimitSeconds,
    );
    _startTimer();
  }

  /// 住所入力
  void updateAddress(String address) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(address: address);
  }

  /// 支払い方法選択
  void selectPayment(String payment) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(selectedPayment: payment);
  }

  /// 注文確認チェックボックス
  void toggleConfirmed({required bool value}) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(isConfirmed: value);
  }

  /// 注文確定ボタン → 正誤判定
  Future<void> confirm() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();

    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;

    final isCorrect = _useCase.isClear(
      isAddressEntered: state.address.trim().isNotEmpty,
      isPaymentSelected: state.selectedPayment != null,
      isConfirmed: state.isConfirmed,
    );

    if (isCorrect) {
      await hapticFeedback.playSuccessFeedback();
      state = state.copyWith(
        status: QuizStatus.correct,
        elapsedMs: elapsed,
      );
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } else {
      await hapticFeedback.playErrorFeedback();
      state = state.copyWith(
        status: QuizStatus.incorrect,
        elapsedMs: elapsed,
        failureCount: state.failureCount + 1,
      );
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    }
  }

  /// クイズを諦める（中止）
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
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (_) {
      // 結果保存の失敗はUIに影響させない
    }
  }

  /// リトライ
  void retry() {
    _timer?.cancel();
    state = CheckoutQuizState.initial(timeLimitSeconds: _timeLimitSeconds)
        .copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      failureCount: state.failureCount,
    );
    _startTimer();
  }

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
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;
    state = state.copyWith(
      status: QuizStatus.timeUp,
      remainingSeconds: 0,
      elapsedMs: elapsed,
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (_) {
      // 結果保存の失敗はUIに影響させない（次回起動時に再試行される）
    }
  }

  Future<void> _saveResult({
    required bool isCleared,
    required int elapsedMs,
  }) async {
    final repo = ref.read(shoppingQuizRepositoryProvider);
    await repo.saveResult(
      quizId: _quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
  }

}
