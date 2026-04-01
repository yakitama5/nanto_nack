/// 「目的地を検索する」クイズのクリア判定ユースケース
class QuizSearchPlaceUseCase {
  const QuizSearchPlaceUseCase();

  bool isClear({required bool placeSelected}) => placeSelected;

  String? failureReason({required bool placeSelected}) {
    if (isClear(placeSelected: placeSelected)) return null;
    return '検索バーで目的地を検索してください';
  }
}
