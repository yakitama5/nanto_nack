class ShoppingItem {
  const ShoppingItem({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    this.imageEmoji = '📦',
  });

  final String id;
  final String name;
  final int price;
  final String description;
  final String imageEmoji;

  ShoppingItem copyWith({
    String? id,
    String? name,
    int? price,
    String? description,
    String? imageEmoji,
  }) {
    return ShoppingItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      imageEmoji: imageEmoji ?? this.imageEmoji,
    );
  }
}
