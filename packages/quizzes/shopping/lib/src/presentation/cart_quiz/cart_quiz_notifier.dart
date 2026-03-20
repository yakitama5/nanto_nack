import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/application/quiz_cart_use_case.dart';
import 'package:shopping/src/domain/entities/shopping_cart.dart';
import 'package:shopping/src/infrastructure/shopping_quiz_repository_provider.dart';
import 'package:shopping/src/presentation/cart_quiz/cart_quiz_state.dart';

final cartQuizProvider =
    NotifierProvider<CartQuizNotifier, CartQuizState>(
  CartQuizNotifier.new,
);

class CartQuizNotifier extends Notifier<CartQuizState> {
  static const _quizId = 'shopping_cart';
  static const _timeLimitSeconds = 60;

  final _useCase = const QuizCartUseCase();
  Timer? _timer;

  @override
  CartQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return CartQuizState.initial(timeLimitSeconds: _timeLimitSeconds);
  }

  /// クイズを開始する（タイマー始動）
  void startQuiz() {
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      remainingSeconds: _timeLimitSeconds,
    );
    _startTimer();
  }

  /// 選択肢をタップして正誤判定する
  Future<void> selectChoice({
    required int choice,
    required ShoppingCart cart,
  }) async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();

    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;

    final isCorrect = _useCase.isClear(cart: cart, selectedTotal: choice);

    if (isCorrect) {
      await hapticFeedback.playSuccessFeedback();
      state = state.copyWith(
        status: QuizStatus.correct,
        selectedChoice: choice,
        elapsedMs: elapsed,
      );
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } else {
      await hapticFeedback.playErrorFeedback();
      state = state.copyWith(
        status: QuizStatus.incorrect,
        selectedChoice: choice,
        elapsedMs: elapsed,
        failureCount: state.failureCount + 1,
      );
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    }
  }

  /// ヒントを使用する（スコア減点）
  void useHint() {
    if (state.status != QuizStatus.playing || state.hintUsed) return;
    state = state.copyWith(hintUsed: true);
  }

  /// リトライ
  void retry() {
    _timer?.cancel();
    state = CartQuizState.initial(timeLimitSeconds: _timeLimitSeconds).copyWith(
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
