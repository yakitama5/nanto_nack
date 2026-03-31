import 'package:shopping/src/domain/entities/shopping_category.dart';

class ShoppingItem {
  const ShoppingItem({
    required this.id,
    required this.price,
    required this.imagePath,
    required this.category,
  });

  final String id;
  final int price;

  /// アセット画像のパス（例: 'assets/item/water_pura_aqua.png'）
  final String imagePath;

  /// 商品のカテゴリ（カテゴリフィルタリングに使用）
  final ShoppingCategory category;

  ShoppingItem copyWith({
    String? id,
    int? price,
    String? imagePath,
    ShoppingCategory? category,
  }) {
    return ShoppingItem(
      id: id ?? this.id,
      price: price ?? this.price,
      imagePath: imagePath ?? this.imagePath,
      category: category ?? this.category,
    );
  }
}
