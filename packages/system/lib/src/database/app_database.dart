import 'package:drift/drift.dart';
import 'package:system/src/database/connection/connection.dart';
import 'package:system/src/database/tables/play_log_table.dart';
import 'package:system/src/database/tables/quiz_result_table.dart';
import 'package:system/src/database/tables/user_status_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [QuizResults, UserStatus, PlayLogs])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(playLogs);
      }
    },
  );

  /// クイズ結果を取得
  Future<QuizResult?> getQuizResult(String quizId) =>
      (select(quizResults)..where((t) => t.quizId.equals(quizId)))
          .getSingleOrNull();

  /// クイズ結果を保存（upsert）
  Future<void> saveQuizResult(QuizResultsCompanion companion) =>
      into(quizResults).insertOnConflictUpdate(companion);

  /// カテゴリのクイズ結果一覧を取得
  Future<List<QuizResult>> getQuizResultsByCategory(String category) =>
      (select(quizResults)
            ..where((t) => t.quizId.like('${category}_%')))
          .get();

  /// ユーザーステータスを取得（初回はデフォルト値で作成）
  Future<UserStatusData> getUserStatus() async {
    final existing = await (select(userStatus)
          ..where((t) => t.key.equals('default')))
        .getSingleOrNull();
    if (existing != null) return existing;

    final companion = UserStatusCompanion.insert(
      key: const Value('default'),
    );
    await into(userStatus).insert(companion);
    return (select(userStatus)
          ..where((t) => t.key.equals('default')))
        .getSingle();
  }

  /// 指定日時以降にプレイされたクリア済みクイズ履歴を取得
  Future<List<QuizResult>> getQuizHistorySince(DateTime since) =>
      (select(quizResults)
            ..where((t) => t.isCleared.equals(true))
            ..where((t) => t.lastPlayedAt.isBiggerOrEqualValue(since)))
          .get();

  /// ユーザーステータスを更新
  Future<void> updateUserStatus(UserStatusCompanion companion) =>
      (update(userStatus)..where((t) => t.key.equals('default')))
          .write(companion);

  /// プレイログを挿入
  Future<void> insertPlayLog(PlayLogsCompanion companion) =>
      into(playLogs).insert(companion);

  /// 指定日時以降のプレイログ数を取得（今日のプレイ回数制限判定用）
  Future<int> countPlayLogsSince(DateTime since) async {
    final count = playLogs.id.count();
    final query = selectOnly(playLogs)
      ..addColumns([count])
      ..where(playLogs.playedAt.isBiggerOrEqualValue(since));
    final result = await query.getSingle();
    return result.read(count) ?? 0;
  }

  /// 指定日時以降のプレイログ日付一覧を取得（ヒートマップ用）
  Future<List<PlayLog>> getPlayLogsSince(DateTime since) =>
      (select(playLogs)
            ..where((t) => t.playedAt.isBiggerOrEqualValue(since)))
          .get();
}
