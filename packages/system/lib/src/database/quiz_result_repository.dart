import 'package:clock/clock.dart';
import 'package:drift/drift.dart';
import 'package:system/src/database/app_database.dart';

/// クイズ結果の永続化を担う Repository
class QuizResultRepository {
  const QuizResultRepository(this._db);

  final AppDatabase _db;

  /// 指定クイズの結果を取得
  Future<QuizResult?> findById(String quizId) =>
      _db.getQuizResult(quizId);

  /// カテゴリのクイズ結果一覧を取得
  Future<List<QuizResult>> findByCategory(String category) =>
      _db.getQuizResultsByCategory(category);

  /// クイズ結果を保存 (upsert)
  Future<void> save({
    required String quizId,
    required bool isCleared,
    int? clearTimeMs,
    int score = 0,
    int failureCount = 0,
  }) =>
      _db.saveQuizResult(
        QuizResultsCompanion(
          quizId: Value(quizId),
          isCleared: Value(isCleared),
          clearTimeMs: Value(clearTimeMs),
          score: Value(score),
          failureCount: Value(failureCount),
          lastPlayedAt: Value(clock.now()),
        ),
      );
}
