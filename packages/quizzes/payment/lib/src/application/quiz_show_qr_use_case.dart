/// Quiz 1「QRコードを表示する」のユースケース
class QuizShowQrUseCase {
  /// コンストラクタ
  const QuizShowQrUseCase();

  /// クリア条件: QRコードが表示されたか
  bool isClear({required bool qrShown}) => qrShown;
}
