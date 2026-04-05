import '../../i18n/strings.g.dart';
import '../domain/alarm_catalog.dart';

/// 「平日繰り返しを設定する」クイズのクリア判定ユースケース
class QuizSetWeekdaysUseCase {
  /// コンストラクタ
  const QuizSetWeekdaysUseCase();

  /// クリア条件：選択中の曜日が平日（月〜金）と一致するか
  bool isClear({required Set<int> activeDays}) =>
      activeDays.containsAll(AlarmCatalog.weekdays) &&
      activeDays.length == AlarmCatalog.weekdays.length;

  /// 失敗した理由を返す
  String? failureReason({required Set<int> activeDays}) {
    if (isClear(activeDays: activeDays)) return null;
    return t.quiz2.failureReason;
  }
}
