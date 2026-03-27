/// カートアイテムエンティティ
class CartItem {
  const CartItem({
    required this.id,
    required this.price,
    required this.quantity,
    this.imageUrl,
  });

  final String id;
  final int price;
  final int quantity;
  final String? imageUrl;

  int get totalPrice => price * quantity;

  CartItem copyWith({
    String? id,
    int? price,
    int? quantity,
    String? imageUrl,
  }) {
    return CartItem(
      id: id ?? this.id,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
