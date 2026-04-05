import 'package:system/system.dart';

class StreamingQuizRepository {
  const StreamingQuizRepository(this._quizResultRepository);

  final QuizResultRepository _quizResultRepository;

  Future<void> saveResult({
    required String quizId,
    required bool isCleared,
    int? clearTimeMs,
    int score = 0,
    int failureCount = 0,
  }) async {
    await _quizResultRepository.logPlay(
      quizId: quizId,
      isCleared: isCleared,
      score: score,
      failureCount: failureCount,
    );
    await _quizResultRepository.saveBestRecord(
      quizId: quizId,
      isCleared: isCleared,
      clearTimeMs: clearTimeMs,
      score: score,
      failureCount: failureCount,
    );
  }
}
