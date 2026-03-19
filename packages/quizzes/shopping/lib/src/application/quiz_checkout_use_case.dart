/// 「購入手続きを完了する」クイズのクリア判定ユースケース
class QuizCheckoutUseCase {
  const QuizCheckoutUseCase();

  /// 全ステップが完了しているかチェック
  bool isClear({
    required bool isAddressEntered,
    required bool isPaymentSelected,
    required bool isConfirmed,
  }) {
    return isAddressEntered && isPaymentSelected && isConfirmed;
  }
}
