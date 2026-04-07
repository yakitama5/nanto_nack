/// Quiz 2「残高を隠す」のユースケース
class QuizRevealBalanceUseCase {
  /// コンストラクタ
  const QuizRevealBalanceUseCase();

  /// クリア条件: 残高が非表示になったか
  bool isClear({required bool balanceHidden}) => balanceHidden;
}
