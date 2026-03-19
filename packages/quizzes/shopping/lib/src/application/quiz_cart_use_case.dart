import 'package:shopping/src/domain/entities/shopping_cart.dart';

/// 「カートの合計金額を確認する」クイズのクリア判定ユースケース
class QuizCartUseCase {
  const QuizCartUseCase();

  /// 選択した金額がカートの合計金額と一致するかチェック
  bool isClear({
    required ShoppingCart cart,
    required int selectedTotal,
  }) {
    return cart.totalPrice == selectedTotal;
  }
}
