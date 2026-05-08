class QuizLyricsUseCase {
  const QuizLyricsUseCase();

  bool isClear({required double lyricsSheetSize}) => lyricsSheetSize >= 0.5;
}
