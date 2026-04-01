/// 「ルート案内を開始する」クイズのクリア判定ユースケース
class QuizStartNavigationUseCase {
  const QuizStartNavigationUseCase();

  bool isClear({required bool navigationStarted}) => navigationStarted;

  String? failureReason({required bool navigationStarted}) {
    if (isClear(navigationStarted: navigationStarted)) return null;
    return 'ルート案内を開始してください';
  }
}
