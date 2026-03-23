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
    required this.remainingSeconds,
    this.hintUsed = false,
    this.hintItemId,
  });

  final ShoppingCart cart;
  final bool isPurchased;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// ヒントを使用済みかどうか
  final bool hintUsed;

  /// ヒントでハイライトする商品 ID
  final String? hintItemId;

  WaterQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    ShoppingCart? cart,
    bool? isPurchased,
    int? remainingSeconds,
    bool? hintUsed,
    String? hintItemId,
  }) {
    return WaterQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      cart: cart ?? this.cart,
      isPurchased: isPurchased ?? this.isPurchased,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      hintUsed: hintUsed ?? this.hintUsed,
      hintItemId: hintItemId ?? this.hintItemId,
    );
  }

  factory WaterQuizState.initial({int timeLimitSeconds = 60}) => WaterQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        cart: const ShoppingCart(),
        isPurchased: false,
        remainingSeconds: timeLimitSeconds,
      );
}
