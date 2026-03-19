import 'package:shopping/src/domain/entities/shopping_cart.dart';

/// 「水を2つ購入する」クイズのクリア判定ユースケース
class QuizWaterUseCase {
  const QuizWaterUseCase();

  /// カートに水が合計2個以上入っていて、購入済みならクリア
  bool isClear({required ShoppingCart cart, required bool isPurchased}) {
    if (!isPurchased) return false;
    final waterCount = cart.items
        .where((i) => i.id.startsWith('water_'))
        .fold(0, (sum, i) => sum + i.quantity);
    return waterCount >= 2;
  }

  /// 失敗理由を返す (クリアならnull)
  String? failureReason({
    required ShoppingCart cart,
    required bool isPurchased,
  }) {
    if (!isPurchased) return '購入を完了してください';
    final waterCount = cart.items
        .where((i) => i.id.startsWith('water_'))
        .fold(0, (sum, i) => sum + i.quantity);
    if (waterCount < 2) return '水が${waterCount}個しかありません。2個以上必要です';
    return null;
  }
}
