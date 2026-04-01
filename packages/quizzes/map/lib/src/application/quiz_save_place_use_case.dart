/// 「場所をお気に入りに追加する」クイズのクリア判定ユースケース
class QuizSavePlaceUseCase {
  const QuizSavePlaceUseCase();

  bool isClear({required bool isFavorite}) => isFavorite;

  String? failureReason({required bool isFavorite}) {
    if (isClear(isFavorite: isFavorite)) return null;
    return '場所をお気に入りに追加してください';
  }
}
