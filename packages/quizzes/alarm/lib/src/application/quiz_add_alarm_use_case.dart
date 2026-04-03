import '../../i18n/strings.g.dart';

/// 「アラームを追加する」クイズのクリア判定ユースケース
class QuizAddAlarmUseCase {
  /// コンストラクタ
  const QuizAddAlarmUseCase();

  /// クリア条件を満たしているか
  bool isClear({required bool alarmSaved}) => alarmSaved;

  /// 失敗した理由を返す
  String? failureReason({required bool alarmSaved}) {
    if (isClear(alarmSaved: alarmSaved)) return null;
    return t.quiz1.failureReason;
  }
}
