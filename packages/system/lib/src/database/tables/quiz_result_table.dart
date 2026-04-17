import 'package:drift/drift.dart';

/// クイズ結果テーブル
class QuizResults extends Table {
  /// クイズID (例: 'shopping_quiz1')
  TextColumn get quizId => text()();

  /// クリア済みかどうか
  BoolColumn get isCleared => boolean().withDefault(const Constant(false))();

  /// クリア時間 (ミリ秒)
  IntColumn get clearTimeMs => integer().nullable()();

  /// スコア
  IntColumn get score => integer().withDefault(const Constant(0))();

  /// 失敗回数
  IntColumn get failureCount => integer().withDefault(const Constant(0))();

  /// 最終プレイ日時
  DateTimeColumn get lastPlayedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {quizId};
}
