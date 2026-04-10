/// Quiz 3「送金する」のユースケース
class QuizSendMoneyUseCase {
  /// コンストラクタ
  const QuizSendMoneyUseCase();

  /// クリアに必要な送金金額
  static const int targetAmount = 5000;

  /// クリア条件: 正しい金額（5,000円）で送金が完了したか
  bool isClear({required bool moneySent, required int amount}) =>
      moneySent && amount == targetAmount;
}
