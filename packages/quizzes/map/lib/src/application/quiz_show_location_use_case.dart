import '../../i18n/strings.g.dart';

/// 「現在地を表示する」クイズのクリア判定ユースケース
class QuizShowLocationUseCase {
  /// コンストラクタ
  const QuizShowLocationUseCase();

  /// クリア条件を満たしているか
  bool isClear({required bool locationShown}) => locationShown;

  /// 失敗した理由を返す
  String? failureReason({required bool locationShown}) {
    if (isClear(locationShown: locationShown)) {
      return null;
    }
    // UIへのメッセージとして直接用いるため
    return t.quiz1.failureReason;
  }
}
