/// ニュースクイズの種別
enum NewsQuizType {
  /// Quiz1: Pull to Refresh でニュースを更新する
  refresh,

  /// Quiz2: スポーツタブへカテゴリを切り替える
  category,

  /// Quiz3: 文字サイズを『大』に変更する
  fontSize,

  /// Quiz4: 記事を非表示にする
  hideArticle,
}
