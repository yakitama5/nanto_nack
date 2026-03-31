import 'package:shopping/src/domain/entities/shopping_cart.dart';

/// 「直近で注文した商品をもう一度購入する」クイズのクリア判定ユースケース
class QuizReorderUseCase {
  const QuizReorderUseCase();

  /// ターゲットアイテムがカートに入っていて、購入済みならクリア
  bool isClear({
    required ShoppingCart cart,
    required bool isPurchased,
    required String targetItemId,
  }) {
    if (!isPurchased) return false;
    return cart.items.any((i) => i.id == targetItemId && i.quantity > 0);
  }

  /// 失敗理由を返す (クリアならnull)
  String? failureReason({
    required ShoppingCart cart,
    required bool isPurchased,
    required String targetItemId,
  }) {
    if (!isPurchased) return '購入を完了してください';
    if (!cart.items.any((i) => i.id == targetItemId && i.quantity > 0)) {
      return '直近で注文した商品がカートに入っていません';
    }
    return null;
  }
}
