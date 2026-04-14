/// メールのフォルダを表す列挙型
enum MailFolder {
  /// 受信トレイ
  inbox,

  /// 送信済み（ドロワー表示のみ。クイズ対象外のダミーフォルダ）
  sent,

  /// ゴミ箱
  trash,

  /// アーカイブ
  archive,
}
