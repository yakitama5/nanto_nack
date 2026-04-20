import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/application/quiz_cart_use_case.dart';
import 'package:system/system.dart';
import 'package:shopping/src/domain/entities/shopping_cart.dart';
import 'package:shopping/src/infrastructure/shopping_quiz_repository_provider.dart';
import 'package:shopping/src/presentation/cart_quiz/cart_quiz_state.dart';

final cartQuizProvider =
    AutoDisposeNotifierProvider<CartQuizNotifier, CartQuizState>(
  CartQuizNotifier.new,
);

class CartQuizNotifier extends AutoDisposeNotifier<CartQuizState> {
  static const _quizId = 'shopping_quiz4';

  final _useCase = const QuizCartUseCase();
  Timer? _timer;

  @override
  CartQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return CartQuizState.initial();
  }

  /// クイズを開始する（タイマー始動）
  void startQuiz() {
    state = CartQuizState.initial().copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  /// 指定桁の数字を増減する（0-9のループ）
  void updateDigit(int index, int delta) {
    if (state.status != QuizStatus.playing) return;
    final digits = List<int>.from(state.enteredDigits);
    digits[index] = (digits[index] + delta) % 10;
    if (digits[index] < 0) digits[index] += 10;
    state = state.copyWith(enteredDigits: digits);
  }

  /// 入力値を確定して正誤判定する
  Future<void> confirmEntry({required ShoppingCart cart}) async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();

    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;

    final enteredValue = state.enteredValue;
    final isCorrect = _useCase.isClear(cart: cart, selectedTotal: enteredValue);

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

  static const _hintPenaltyFailureCount = 2;

  /// ヒントを使用する（スコア減点 -200点相当）
  void useHint() {
    if (state.status != QuizStatus.playing || state.hintUsed) return;
    state = state.copyWith(
      hintUsed: true,
      failureCount: state.failureCount + _hintPenaltyFailureCount,
    );
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
    unawaited(
      ref.read(analyticsServiceProvider).logQuizGivenUp(quizId: _quizId),
    );
    await _saveResult(isCleared: false, elapsedMs: elapsed);
  }

  /// リトライ（桁入力をリセット）
  void retry() {
    _timer?.cancel();
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: _quizId);
    state = CartQuizState.initial().copyWith(
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
    await _saveResult(isCleared: false, elapsedMs: elapsed);
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
