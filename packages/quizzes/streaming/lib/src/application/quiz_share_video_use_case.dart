/// 「動画をシェアする」クイズのクリア判定ユースケース
class QuizShareVideoUseCase {
  const QuizShareVideoUseCase();

  bool isClear({required bool isShared}) => isShared;

  String? failureReason({required bool isShared}) {
    if (isClear(isShared: isShared)) return null;
    return '動画をシェアしてください';
  }
}
