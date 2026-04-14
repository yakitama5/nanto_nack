/// メールクイズの設定値
abstract final class MailQuizConfig {
  /// 全クイズ共通の制限時間（秒）
  static const int timeLimitSeconds = 60;

  /// Quiz1のアーカイブ対象メールID
  static const String quiz1TargetMailId = 'mail_quiz1_target';

  /// Quiz4の正解検索クエリ（大文字小文字を区別しない比較を行う）
  static const String quiz4TargetQuery = 'larger:5M';
}
