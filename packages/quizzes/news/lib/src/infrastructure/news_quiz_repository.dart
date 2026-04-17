import 'package:system/system.dart';

/// ニュースクイズの結果を永続化するリポジトリ
class NewsQuizRepository {
  const NewsQuizRepository(this._quizResultRepository);

  final QuizResultRepository _quizResultRepository;

  /// 結果を保存する（プレイログと最高記録を原子的に）
  Future<void> saveResult({
    required String quizId,
    required bool isCleared,
    int? clearTimeMs,
    int score = 0,
    int failureCount = 0,
  }) async {
    await _quizResultRepository.recordPlayAndSaveBest(
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
