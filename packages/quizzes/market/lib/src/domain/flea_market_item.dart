/// フリマアプリの商品モデル
class FleaMarketItem {
  FleaMarketItem({
    required this.id,
    required this.title,
    required this.price,
    required List<String> imageEmojis,
    required this.description,
    required this.sellerName,
    required this.sellerRating,
  }) : _imageEmojis = List.unmodifiable(imageEmojis);

  final String id;
  final String title;
  final int price;

  final List<String> _imageEmojis;

  /// 商品画像を表す絵文字リスト（例: ['👕', '🔄', '🏷️'] で表・横・裏を表現）
  List<String> get imageEmojis => _imageEmojis;

  final String description;
  final String sellerName;
  final double sellerRating;

  FleaMarketItem copyWith({
    String? id,
    String? title,
    int? price,
    List<String>? imageEmojis,
    String? description,
    String? sellerName,
    double? sellerRating,
  }) {
    return FleaMarketItem(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      imageEmojis: imageEmojis ?? _imageEmojis,
      description: description ?? this.description,
      sellerName: sellerName ?? this.sellerName,
      sellerRating: sellerRating ?? this.sellerRating,
    );
  }
}
