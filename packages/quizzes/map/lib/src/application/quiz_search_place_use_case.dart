import '../../i18n/strings.g.dart';

/// 「学校の情報を表示する」クイズのクリア判定ユースケース
class QuizShowSchoolInfoUseCase {
  /// コンストラクタ
  const QuizShowSchoolInfoUseCase();

  /// 正解の場所ID（学校）
  static const correctPlaceId = 'p5';

  /// クリア条件：学校の場所が選択されているか
  bool isClear({required String selectedPlaceId}) =>
      selectedPlaceId == correctPlaceId;

  /// 失敗した理由を返す
  String? failureReason({required String selectedPlaceId}) {
    if (isClear(selectedPlaceId: selectedPlaceId)) return null;
    return t.quiz2.failureReason;
  }
}
