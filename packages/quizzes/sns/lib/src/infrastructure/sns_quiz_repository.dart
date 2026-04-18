import 'package:system/system.dart';

/// SNSクイズのリポジトリ
class SnsQuizRepository {
  /// コンストラクタ
  const SnsQuizRepository(this._quizResultRepository);

  final QuizResultRepository _quizResultRepository;

  /// 結果を保存する
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
}
