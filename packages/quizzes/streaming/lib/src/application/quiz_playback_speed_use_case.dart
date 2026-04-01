/// 倍速再生クイズのユースケース
class QuizPlaybackSpeedUseCase {
  const QuizPlaybackSpeedUseCase();

  /// クリア判定
  /// - [playbackSpeed]: 現在の再生速度
  bool isClear({
    required double playbackSpeed,
  }) {
    // 2倍速になっていること
    return playbackSpeed == 2.0;
  }
}
