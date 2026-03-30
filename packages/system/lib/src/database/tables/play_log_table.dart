import 'package:drift/drift.dart';

/// プレイログテーブル
///
/// 毎回のプレイ結果を記録する。
/// - 今日のプレイ回数制限の判定
/// - ダッシュボードのヒートマップ描画
/// に使用する。
class PlayLogs extends Table {
  /// ログID（自動採番）
  IntColumn get id => integer().autoIncrement()();

  /// クイズID (例: 'shopping_water')
  TextColumn get quizId => text()();

  /// クリアできたかどうか
  BoolColumn get isCleared => boolean().withDefault(const Constant(false))();

  /// 獲得スコア
  IntColumn get score => integer().withDefault(const Constant(0))();

  /// ミスタップ回数
  IntColumn get failureCount => integer().withDefault(const Constant(0))();

  /// プレイ完了（または失敗）日時
  DateTimeColumn get playedAt => dateTime()();
}
