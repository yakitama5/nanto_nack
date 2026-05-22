/// デリバリークイズの設定値を管理するクラス。
///
/// タイムリミット、クリア判定の閾値など静的な設定値を一元管理する。
abstract final class DeliveryQuizConfig {
  static const int quiz1TimeLimitSeconds = 30;
  static const int quiz2TimeLimitSeconds = 30;
  static const int quiz3TimeLimitSeconds = 30;
  static const int quiz4TimeLimitSeconds = 45;

  /// Quiz4 のクリア判定: ボトムシートがこの割合以上に引き上げられたらクリア
  static const double trackingClearExtent = 0.7;

  /// 商品単価（円）
  static const double itemPriceYen = 890;

  /// ピザカテゴリのID（Quiz1のクリア判定に使用）
  static const String pizzaCategoryId = 'pizza';
}
