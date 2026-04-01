/// 「現在地を表示する」クイズのクリア判定ユースケース
class QuizShowLocationUseCase {
  const QuizShowLocationUseCase();

  bool isClear({required bool locationShown}) => locationShown;

  String? failureReason({required bool locationShown}) {
    if (isClear(locationShown: locationShown)) return null;
    return '現在地ボタンをタップしてください';
  }
}
