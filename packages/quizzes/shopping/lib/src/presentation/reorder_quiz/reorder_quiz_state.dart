import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/domain/entities/shopping_cart.dart';

class ReorderQuizState extends QuizStateBase {
  const ReorderQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.cart,
    required this.isPurchased,
    required this.remainingSeconds,
    required this.targetItemId,
    this.hintUsed = false,
  });

  final ShoppingCart cart;
  final bool isPurchased;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// ミッションのターゲット商品ID
  final String targetItemId;

  /// ヒントを使用済みかどうか（ヒント使用でターゲット商品をハイライト）
  final bool hintUsed;

  ReorderQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    ShoppingCart? cart,
    bool? isPurchased,
    int? remainingSeconds,
    String? targetItemId,
    bool? hintUsed,
  }) {
    return ReorderQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      cart: cart ?? this.cart,
      isPurchased: isPurchased ?? this.isPurchased,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      targetItemId: targetItemId ?? this.targetItemId,
      hintUsed: hintUsed ?? this.hintUsed,
    );
  }

  factory ReorderQuizState.initial({
    int timeLimitSeconds = 90,
    String targetItemId = 'snack_chips',
  }) =>
      ReorderQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        cart: const ShoppingCart(),
        isPurchased: false,
        remainingSeconds: timeLimitSeconds,
        targetItemId: targetItemId,
      );
}
