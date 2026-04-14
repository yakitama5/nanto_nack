/// メールクイズの種別
enum MailQuizType {
  /// Quiz1: 指定メールをアーカイブする
  archive,

  /// Quiz2: ゴミ箱を空にする
  emptyTrash,

  /// Quiz3: 3件選択して削除する
  selectDelete,

  /// Quiz4: 特定コマンドで検索する
  search,
}
