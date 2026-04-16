import 'package:clock/clock.dart';
import 'package:drift/drift.dart';
import 'package:system/src/database/app_database.dart';

/// クイズ結果の永続化を担う Repository
class QuizResultRepository {
  const QuizResultRepository(this._db);

  final AppDatabase _db;

  /// 指定クイズの結果を取得
  Future<QuizResult?> findById(String quizId) => _db.getQuizResult(quizId);

  /// カテゴリのクイズ結果一覧を取得
  Future<List<QuizResult>> findByCategory(String category) =>
      _db.getQuizResultsByCategory(category);

  /// クイズの最高記録を保存する（StageRecords相当）
  ///
  /// - 初回プレイ: そのまま保存
  /// - 2回目以降:
  ///   - [isCleared] が true になる場合のみ `isCleared` を更新（クリア済みは降格しない）
  ///   - [score] が既存の最高スコアを上回る場合のみ `score` / `clearTimeMs` / `failureCount` を更新
  ///   - [isCleared] が false（諦め・失敗）かつスコアが低い場合は何も更新しない
  ///   - `lastPlayedAt` は常に更新する
  Future<void> saveBestRecord({
    required String quizId,
    required bool isCleared,
    int? clearTimeMs,
    int score = 0,
    int failureCount = 0,
  }) async {
    final existing = await findById(quizId);
    final now = clock.now();

    if (existing == null) {
      // 初回：そのまま保存
      await _db.saveQuizResult(
        QuizResultsCompanion(
          quizId: Value(quizId),
          isCleared: Value(isCleared),
          clearTimeMs: Value(clearTimeMs),
          score: Value(score),
          failureCount: Value(failureCount),
          lastPlayedAt: Value(now),
        ),
      );
      return;
    }

    // 最高スコアを上回るか、初めてクリアした場合のみ記録を更新する
    final isNewBestScore = score > existing.score;
    final isFirstClear = isCleared && !existing.isCleared;

    if (isNewBestScore || isFirstClear) {
      await _db.saveQuizResult(
        QuizResultsCompanion(
          quizId: Value(quizId),
          isCleared: Value(existing.isCleared || isCleared),
          clearTimeMs: Value(isCleared ? clearTimeMs : existing.clearTimeMs),
          score: Value(isNewBestScore ? score : existing.score),
          failureCount: Value(
            isNewBestScore ? failureCount : existing.failureCount,
          ),
          lastPlayedAt: Value(now),
        ),
      );
    } else {
      // スコア更新なし・クリア状態変化なし → lastPlayedAt のみ更新
      await _db.saveQuizResult(
        QuizResultsCompanion(
          quizId: Value(quizId),
          isCleared: Value(existing.isCleared),
          clearTimeMs: Value(existing.clearTimeMs),
          score: Value(existing.score),
          failureCount: Value(existing.failureCount),
          lastPlayedAt: Value(now),
        ),
      );
    }
  }

  /// すべてのプレイデータを初期化する
  ///
  /// プレイログ（[PlayLogs]）とクイズ結果（[QuizResults]）をすべて削除する。
  /// ユーザーステータス（プレミアム状態・プレイ回数）は保持する。
  Future<void> deleteAllPlayData() async {
    await _db.transaction(() async {
      await _db.deleteAllPlayLogs();
      await _db.deleteAllQuizResults();
    });
  }

  /// プレイログを記録する（PlayLogs相当）
  ///
  /// 諦め・失敗・クリアを問わず、すべてのプレイ結果を記録する。
  /// 今日のプレイ回数制限やヒートマップ描画に使用する。
  Future<void> logPlay({
    required String quizId,
    required bool isCleared,
    int score = 0,
    int failureCount = 0,
  }) => _db.insertPlayLog(
    PlayLogsCompanion(
      quizId: Value(quizId),
      isCleared: Value(isCleared),
      score: Value(score),
      failureCount: Value(failureCount),
      playedAt: Value(clock.now()),
    ),
  );

  /// プレイログ記録と最高記録保存を 1 つのトランザクション内で実行する（原子操作）
  ///
  /// `logPlay` と `saveBestRecord` を順序保証付きで実行し、
  /// 片方の失敗があれば両方ロールバックする。
  Future<void> recordPlayAndSaveBest({
    required String quizId,
    required bool isCleared,
    int? clearTimeMs,
    int score = 0,
    int failureCount = 0,
  }) async {
    await _db.transaction(() async {
      await logPlay(
        quizId: quizId,
        isCleared: isCleared,
        score: score,
        failureCount: failureCount,
      );
      await saveBestRecord(
        quizId: quizId,
        isCleared: isCleared,
        clearTimeMs: clearTimeMs,
        score: score,
        failureCount: failureCount,
      );
    });
  }
}
