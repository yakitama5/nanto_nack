import '../../i18n/strings.g.dart';

/// 「場所をお気に入りに追加する」クイズのクリア判定ユースケース
class QuizSavePlaceUseCase {
  /// コンストラクタ
  const QuizSavePlaceUseCase();

  /// クリア条件を満たしているか
  bool isClear({required bool isFavorite}) => isFavorite;

  /// 失敗した理由を返す
  String? failureReason({required bool isFavorite}) {
    if (isClear(isFavorite: isFavorite)) {
      return null;
    }
    // UIへのメッセージとして直接用いるため
    return t.quiz4.failureReason;
  }
}
