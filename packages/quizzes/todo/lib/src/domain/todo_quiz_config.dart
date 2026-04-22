/// TODOクイズの設定値
abstract final class TodoQuizConfig {
  /// 全クイズ共通の制限時間（秒）
  static const int timeLimitSeconds = 30;

  /// Quiz1のターゲットタスクID（牛乳を買う）
  static const String quiz1TargetId = 'todo_buy_milk';

  /// Quiz2のターゲットタスクID（企画書の作成）
  static const String quiz2TargetId = 'todo_planning_doc';

  /// Quiz3のターゲットタスクID（家賃の振り込み）
  static const String quiz3TargetId = 'todo_rent_payment';

  /// Quiz4のターゲットタスクID（会議の準備）
  static const String quiz4TargetId = 'todo_meeting_prep';
}
