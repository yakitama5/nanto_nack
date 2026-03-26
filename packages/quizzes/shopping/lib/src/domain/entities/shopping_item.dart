class ShoppingItem {
  const ShoppingItem({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
  });

  final String id;
  final String name;
  final int price;
  final String description;

  /// アセット画像のパス（例: 'assets/item/water_pura_aqua.png'）
  final String imagePath;

  ShoppingItem copyWith({
    String? id,
    String? name,
    int? price,
    String? description,
    String? imagePath,
  }) {
    return ShoppingItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
