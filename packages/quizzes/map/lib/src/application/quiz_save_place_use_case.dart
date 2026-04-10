import '../../i18n/strings.g.dart';

/// 「指定した場所をお気に入りに追加する」クイズのクリア判定ユースケース
class QuizSavePlaceUseCase {
  /// コンストラクタ
  const QuizSavePlaceUseCase();

  /// 正解の場所ID（Main Station）
  static const correctPlaceId = 'p3';

  /// 場所が正解かどうか
  bool isCorrectPlace(String placeId) => placeId == correctPlaceId;

  /// クリア条件を満たしているか
  bool isClear({required bool isFavorite}) => isFavorite;

  /// 失敗した理由を返す
  String? failureReason({required bool isFavorite}) {
    if (isClear(isFavorite: isFavorite)) return null;
    return t.quiz4.failureReason;
  }
}
