import '../../i18n/strings.g.dart';

/// 「スヌーズをオフにする」クイズのクリア判定ユースケース
class QuizDisableSnoozeUseCase {
  /// コンストラクタ
  const QuizDisableSnoozeUseCase();

  /// クリア条件：スヌーズが無効かつ保存済みか
  bool isClear({required bool snoozeEnabled, required bool saved}) =>
      !snoozeEnabled && saved;

  /// 失敗した理由を返す
  String? failureReason({
    required bool snoozeEnabled,
    required bool saved,
  }) {
    if (isClear(snoozeEnabled: snoozeEnabled, saved: saved)) return null;
    return t.quiz3.failureReason;
  }
}
