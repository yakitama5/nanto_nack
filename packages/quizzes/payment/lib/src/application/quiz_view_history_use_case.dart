/// Quiz 4「取引履歴を確認する」のユースケース
class QuizViewHistoryUseCase {
  /// コンストラクタ
  const QuizViewHistoryUseCase();

  /// クリア条件: 履歴が表示されたか
  bool isClear({required bool historyViewed}) => historyViewed;
}
