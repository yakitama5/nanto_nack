import '../../i18n/strings.g.dart';

/// 「アラームを削除する」クイズのクリア判定ユースケース
class QuizDeleteAlarmUseCase {
  /// コンストラクタ
  const QuizDeleteAlarmUseCase();

  /// クリア条件：対象アラームが削除されたか
  bool isClear({required bool alarmDeleted}) => alarmDeleted;

  /// 失敗した理由を返す
  String? failureReason({required bool alarmDeleted}) {
    if (isClear(alarmDeleted: alarmDeleted)) return null;
    return t.quiz4.failureReason;
  }
}
