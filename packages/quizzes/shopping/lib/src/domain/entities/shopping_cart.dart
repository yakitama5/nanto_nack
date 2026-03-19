import 'package:shopping/src/domain/entities/cart_item.dart';

class ShoppingCart {
  const ShoppingCart({this.items = const []});

  final List<CartItem> items;

  int get totalPrice =>
      items.fold(0, (sum, item) => sum + item.totalPrice);

  int get totalCount =>
      items.fold(0, (sum, item) => sum + item.quantity);

  bool get isEmpty => items.isEmpty;

  ShoppingCart addItem(CartItem item) {
    final existing = items.indexWhere((i) => i.id == item.id);
    if (existing >= 0) {
      final updated = List<CartItem>.from(items);
      updated[existing] = items[existing].copyWith(
        quantity: items[existing].quantity + item.quantity,
      );
      return ShoppingCart(items: updated);
    }
    return ShoppingCart(items: [...items, item]);
  }

  ShoppingCart removeItem(String itemId) {
    return ShoppingCart(
      items: items.where((i) => i.id != itemId).toList(),
    );
  }

  ShoppingCart updateQuantity(String itemId, int quantity) {
    if (quantity <= 0) return removeItem(itemId);
    return ShoppingCart(
      items: items
          .map((i) => i.id == itemId ? i.copyWith(quantity: quantity) : i)
          .toList(),
    );
  }

  ShoppingCart copyWith({List<CartItem>? items}) {
    return ShoppingCart(items: items ?? this.items);
  }
}
