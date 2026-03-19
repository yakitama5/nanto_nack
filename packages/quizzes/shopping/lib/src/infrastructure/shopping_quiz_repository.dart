import 'package:system/system.dart';

/// ショッピングクイズの結果を永続化するリポジトリ
class ShoppingQuizRepository {
  const ShoppingQuizRepository(this._quizResultRepository);

  final QuizResultRepository _quizResultRepository;

  Future<void> saveResult({
    required String quizId,
    required bool isCleared,
    int? clearTimeMs,
    int score = 0,
    int failureCount = 0,
  }) =>
      _quizResultRepository.save(
        quizId: quizId,
        isCleared: isCleared,
        clearTimeMs: clearTimeMs,
        score: score,
        failureCount: failureCount,
      );

  Future<bool> isCleared(String quizId) async {
    final result = await _quizResultRepository.findById(quizId);
    return result?.isCleared ?? false;
  }
}
