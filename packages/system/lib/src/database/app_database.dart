import 'package:drift/drift.dart';
import 'package:system/src/database/connection/connection.dart';
import 'package:system/src/database/tables/quiz_result_table.dart';
import 'package:system/src/database/tables/user_status_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [QuizResults, UserStatus])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;

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

  /// ユーザーステータスを更新
  Future<void> updateUserStatus(UserStatusCompanion companion) =>
      (update(userStatus)..where((t) => t.key.equals('default')))
          .write(companion);
}
