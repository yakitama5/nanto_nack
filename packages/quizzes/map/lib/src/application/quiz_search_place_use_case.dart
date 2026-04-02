import '../../i18n/strings.g.dart';

/// 「目的地を検索する」クイズのクリア判定ユースケース
class QuizSearchPlaceUseCase {
  /// コンストラクタ
  const QuizSearchPlaceUseCase();

  /// クリア条件を満たしているか
  bool isClear({required bool placeSelected}) => placeSelected;

  /// 失敗した理由を返す
  String? failureReason({required bool placeSelected}) {
    if (isClear(placeSelected: placeSelected)) {
      return null;
    }
    // UIへのメッセージとして直接用いるため
    return t.quiz2.failureReason;
  }
}
