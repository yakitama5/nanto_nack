import 'package:flutter_test/flutter_test.dart';
import 'package:shopping/shopping.dart';

void main() {
  group('QuizWaterUseCase', () {
    const useCase = QuizWaterUseCase();

    test('水が2個あり購入済みならクリア', () {
      final cart = ShoppingCart(
        items: const [
          CartItem(id: 'water_500ml', price: 100, quantity: 2),
        ],
      );
      expect(useCase.isClear(cart: cart, isPurchased: true), isTrue);
    });

    test('水が2個あっても未購入ならクリアでない', () {
      final cart = ShoppingCart(
        items: const [
          CartItem(id: 'water_500ml', price: 100, quantity: 2),
        ],
      );
      expect(useCase.isClear(cart: cart, isPurchased: false), isFalse);
    });

    test('水が1個しかない場合はクリアでない', () {
      final cart = ShoppingCart(
        items: const [
          CartItem(id: 'water_500ml', price: 100, quantity: 1),
        ],
      );
      expect(useCase.isClear(cart: cart, isPurchased: true), isFalse);
    });

    test('異なる水商品を合計2個はクリア', () {
      final cart = ShoppingCart(
        items: const [
          CartItem(id: 'water_500ml', price: 100, quantity: 1),
          CartItem(id: 'water_2l', price: 200, quantity: 1),
        ],
      );
      expect(useCase.isClear(cart: cart, isPurchased: true), isTrue);
    });

    test('水以外の商品だけではクリアでない', () {
      final cart = ShoppingCart(
        items: const [
          CartItem(id: 'tea_500ml', price: 150, quantity: 2),
        ],
      );
      expect(useCase.isClear(cart: cart, isPurchased: true), isFalse);
    });

    test('未購入時の失敗理由を返す', () {
      final cart = ShoppingCart(
        items: const [
          CartItem(id: 'water_500ml', price: 100, quantity: 2),
        ],
      );
      final reason = useCase.failureReason(cart: cart, isPurchased: false);
      expect(reason, isNotNull);
    });

    test('クリア条件を満たした場合は失敗理由がnull', () {
      final cart = ShoppingCart(
        items: const [
          CartItem(id: 'water_500ml', price: 100, quantity: 2),
        ],
      );
      final reason = useCase.failureReason(cart: cart, isPurchased: true);
      expect(reason, isNull);
    });
  });
}
