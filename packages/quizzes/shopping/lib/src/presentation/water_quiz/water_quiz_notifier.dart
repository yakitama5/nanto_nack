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
  final _useCase = const QuizWaterUseCase();

  @override
  WaterQuizState build() => WaterQuizState.initial();

  void startQuiz() {
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: DateTime.now(),
      cart: const ShoppingCart(),
      isPurchased: false,
    );
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

  Future<void> purchase() async {
    if (state.status != QuizStatus.playing) return;

    final newState = state.copyWith(isPurchased: true);
    final elapsed = newState.startedAt != null
        ? DateTime.now().difference(newState.startedAt!).inMilliseconds
        : 0;

    final reason = _useCase.failureReason(
      cart: newState.cart,
      isPurchased: true,
    );

    if (reason == null) {
      state = newState.copyWith(
        status: QuizStatus.correct,
        elapsedMs: elapsed,
      );
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } else {
      state = newState.copyWith(
        status: QuizStatus.incorrect,
        failureCount: state.failureCount + 1,
        elapsedMs: elapsed,
      );
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    }
  }

  void retry() {
    state = WaterQuizState.initial().copyWith(
      status: QuizStatus.playing,
      startedAt: DateTime.now(),
      failureCount: state.failureCount,
    );
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
