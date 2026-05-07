class QuizNextSongUseCase {
  const QuizNextSongUseCase();

  bool isClear({
    required int previousIndex,
    required int currentIndex,
  }) =>
      currentIndex != previousIndex;
}
