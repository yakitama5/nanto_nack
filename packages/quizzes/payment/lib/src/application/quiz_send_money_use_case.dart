/// Quiz 3「送金する」のユースケース
class QuizSendMoneyUseCase {
  /// コンストラクタ
  const QuizSendMoneyUseCase();

  /// クリア条件: 送金が完了したか
  bool isClear({required bool moneySent}) => moneySent;
}
