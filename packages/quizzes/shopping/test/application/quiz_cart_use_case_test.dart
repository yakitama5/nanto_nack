import 'package:flutter_test/flutter_test.dart';
import 'package:shopping/shopping.dart';

void main() {
  group('QuizCartUseCase', () {
    const useCase = QuizCartUseCase();

    test('選択金額がカート合計と一致すればクリア', () {
      final cart = ShoppingCart(
        items: const [
          CartItem(id: 'water_500ml', name: '天然水 500ml', price: 100, quantity: 3),
          CartItem(id: 'tea_500ml', name: '緑茶 500ml', price: 150, quantity: 2),
        ],
      );
      // 100*3 + 150*2 = 600
      expect(useCase.isClear(cart: cart, selectedTotal: 600), isTrue);
    });

    test('選択金額が違えばクリアでない', () {
      final cart = ShoppingCart(
        items: const [
          CartItem(id: 'water_500ml', name: '天然水 500ml', price: 100, quantity: 2),
        ],
      );
      expect(useCase.isClear(cart: cart, selectedTotal: 999), isFalse);
    });
  });
}
