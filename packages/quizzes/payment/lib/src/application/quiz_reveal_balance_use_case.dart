/// Quiz 2「残高を確認する」のユースケース
class QuizRevealBalanceUseCase {
  /// コンストラクタ
  const QuizRevealBalanceUseCase();

  /// クリア条件: 残高ブラーが解除されたか
  bool isClear({required bool balanceRevealed}) => balanceRevealed;
}
