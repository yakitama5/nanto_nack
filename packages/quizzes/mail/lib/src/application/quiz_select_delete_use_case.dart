/// Quiz3 (3件選択して削除) のクリア判定ユースケース
class QuizSelectDeleteUseCase {
  const QuizSelectDeleteUseCase();

  /// selectedCount の件数がちょうど3件のときにクリア
  bool isClear({required int selectedCount}) {
    return selectedCount == 3;
  }
}
