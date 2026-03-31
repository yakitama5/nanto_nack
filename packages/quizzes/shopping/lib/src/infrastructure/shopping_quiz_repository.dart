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
  }) async {
    // PlayLogs: 諦め・失敗・クリアを問わず毎回記録する
    await _quizResultRepository.logPlay(
      quizId: quizId,
      isCleared: isCleared,
      score: score,
      failureCount: failureCount,
    );
    // StageRecords相当: 最高記録を上回った場合・初回クリア時のみ更新する
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
