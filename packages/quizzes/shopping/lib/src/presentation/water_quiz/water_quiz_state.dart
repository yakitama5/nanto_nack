import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/domain/entities/shopping_cart.dart';

class WaterQuizState extends QuizStateBase {
  const WaterQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.cart,
    required this.isPurchased,
  });

  final ShoppingCart cart;
  final bool isPurchased;

  WaterQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    ShoppingCart? cart,
    bool? isPurchased,
  }) {
    return WaterQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      cart: cart ?? this.cart,
      isPurchased: isPurchased ?? this.isPurchased,
    );
  }

  factory WaterQuizState.initial() => WaterQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        cart: const ShoppingCart(),
        isPurchased: false,
      );
}
