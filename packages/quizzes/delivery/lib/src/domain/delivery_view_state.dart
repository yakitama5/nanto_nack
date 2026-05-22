/// デリバリーアプリの画面状態を表す列挙型。
enum DeliveryViewState {
  /// 商品を選んでいる状態（Quiz1〜3で使用）
  browsing,

  /// 注文完了し、配達状況を見ている状態（Quiz4で使用）
  tracking,
}
