import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/application/quiz_water_use_case.dart';
import 'package:shopping/src/domain/entities/cart_item.dart';
import 'package:shopping/src/domain/entities/shopping_cart.dart';
import 'package:shopping/src/infrastructure/shopping_quiz_repository_provider.dart';
import 'package:shopping/src/presentation/water_quiz/water_quiz_state.dart';

final waterQuizProvider =
    NotifierProvider<WaterQuizNotifier, WaterQuizState>(
  WaterQuizNotifier.new,
);

class WaterQuizNotifier extends Notifier<WaterQuizState> {
  static const _quizId = 'shopping_water';
  static const _timeLimitSeconds = 60;
  // ヒント使用時のスコアペナルティ（ヒント使用で failureCount +1 換算）
  static const _hintPenaltyFailureCount = 2;

  final _useCase = const QuizWaterUseCase();
  Timer? _timer;

  @override
  WaterQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return WaterQuizState.initial(timeLimitSeconds: _timeLimitSeconds);
  }

  void startQuiz() {
    _timer?.cancel();
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: DateTime.now(),
      cart: const ShoppingCart(),
      isPurchased: false,
      remainingSeconds: _timeLimitSeconds,
    );
    _startTimer();
  }

  void addToCart(CartItem item) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(cart: state.cart.addItem(item));
  }

  void removeFromCart(String itemId) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(cart: state.cart.removeItem(itemId));
  }

  void updateQuantity(String itemId, int quantity) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      cart: state.cart.updateQuantity(itemId, quantity),
    );
  }

  /// ヒントを使用する（対象アイテムをハイライト + ペナルティ付与）
  void useHint() {
    if (state.status != QuizStatus.playing || state.hintUsed) return;
    state = state.copyWith(
      hintUsed: true,
      hintItemId: 'water_500ml',
      // ヒント使用分のペナルティを failureCount に加算
      failureCount: state.failureCount + _hintPenaltyFailureCount,
    );
  }

  Future<void> purchase() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();

    final newState = state.copyWith(isPurchased: true);
    final elapsed = newState.startedAt != null
        ? DateTime.now().difference(newState.startedAt!).inMilliseconds
        : 0;

    final reason = _useCase.failureReason(
      cart: newState.cart,
      isPurchased: true,
    );

    if (reason == null) {
      await hapticFeedback.playSuccessFeedback();
      state = newState.copyWith(
        status: QuizStatus.correct,
        elapsedMs: elapsed,
      );
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } else {
      await hapticFeedback.playErrorFeedback();
      state = newState.copyWith(
        status: QuizStatus.incorrect,
        failureCount: state.failureCount + 1,
        elapsedMs: elapsed,
      );
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    }
  }

  void retry() {
    _timer?.cancel();
    state = WaterQuizState.initial(timeLimitSeconds: _timeLimitSeconds).copyWith(
      status: QuizStatus.playing,
      startedAt: DateTime.now(),
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
        ? DateTime.now().difference(state.startedAt!).inMilliseconds
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
