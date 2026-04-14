import 'package:system/system.dart';

/// メールクイズの結果を永続化するリポジトリ
class MailQuizRepository {
  const MailQuizRepository(this._quizResultRepository);

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

  Future<bool> isCleared(String quizId) async {
    final result = await _quizResultRepository.findById(quizId);
    return result?.isCleared ?? false;
  }
}
