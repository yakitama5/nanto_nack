import 'package:flutter_test/flutter_test.dart';
import 'package:shopping/shopping.dart';

void main() {
  group('ShoppingCart', () {
    test('商品を追加できる', () {
      const cart = ShoppingCart();
      const item = CartItem(
        id: 'water_500ml',
        price: 100,
        quantity: 1,
      );
      final updated = cart.addItem(item);
      expect(updated.items.length, 1);
      expect(updated.totalPrice, 100);
    });

    test('同じ商品を追加すると数量が増える', () {
      final cart = ShoppingCart(
        items: const [
          CartItem(id: 'water_500ml', price: 100, quantity: 1),
        ],
      );
      const newItem = CartItem(id: 'water_500ml', price: 100, quantity: 1);
      final updated = cart.addItem(newItem);
      expect(updated.items.length, 1);
      expect(updated.items.first.quantity, 2);
    });

    test('合計金額が正しく計算される', () {
      final cart = ShoppingCart(
        items: const [
          CartItem(id: 'water_500ml', price: 100, quantity: 3),
          CartItem(id: 'tea_500ml', price: 150, quantity: 2),
        ],
      );
      // 100*3 + 150*2 = 600
      expect(cart.totalPrice, 600);
    });

    test('商品を削除できる', () {
      final cart = ShoppingCart(
        items: const [
          CartItem(id: 'water_500ml', price: 100, quantity: 1),
          CartItem(id: 'tea_500ml', price: 150, quantity: 1),
        ],
      );
      final updated = cart.removeItem('water_500ml');
      expect(updated.items.length, 1);
      expect(updated.items.first.id, 'tea_500ml');
    });

    test('数量を0以下にすると削除される', () {
      final cart = ShoppingCart(
        items: const [
          CartItem(id: 'water_500ml', price: 100, quantity: 2),
        ],
      );
      final updated = cart.updateQuantity('water_500ml', 0);
      expect(updated.isEmpty, isTrue);
    });

    test('空のカートはisEmptyがtrue', () {
      const cart = ShoppingCart();
      expect(cart.isEmpty, isTrue);
    });
  });
}
