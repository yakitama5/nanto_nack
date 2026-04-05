/// 「字幕をオンにする」クイズのクリア判定ユースケース
class QuizSubtitleUseCase {
  const QuizSubtitleUseCase();

  bool isClear({required bool subtitlesEnabled}) => subtitlesEnabled;

  String? failureReason({required bool subtitlesEnabled}) {
    if (isClear(subtitlesEnabled: subtitlesEnabled)) return null;
    return '字幕をオンにしてください';
  }
}
