/// 「動画を再生する」クイズのクリア判定ユースケース
class QuizPlayVideoUseCase {
  const QuizPlayVideoUseCase();

  bool isClear({required bool isPlaying}) => isPlaying;

  String? failureReason({required bool isPlaying}) {
    if (isClear(isPlaying: isPlaying)) return null;
    return '動画を再生してください';
  }
}
