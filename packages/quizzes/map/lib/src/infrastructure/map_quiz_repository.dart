import 'package:system/system.dart';

/// マップクイズのリポジトリ
class MapQuizRepository {
  /// コンストラクタ
  const MapQuizRepository(this._quizResultRepository);

  final QuizResultRepository _quizResultRepository;

  /// 結果を保存する
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
