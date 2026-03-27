class ShoppingItem {
  const ShoppingItem({
    required this.id,
    required this.price,
    required this.imagePath,
  });

  final String id;
  final int price;

  /// アセット画像のパス（例: 'assets/item/water_pura_aqua.png'）
  final String imagePath;

  ShoppingItem copyWith({
    String? id,
    int? price,
    String? imagePath,
  }) {
    return ShoppingItem(
      id: id ?? this.id,
      price: price ?? this.price,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
