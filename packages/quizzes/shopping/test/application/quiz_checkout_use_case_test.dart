import 'package:flutter_test/flutter_test.dart';
import 'package:shopping/shopping.dart';

void main() {
  group('QuizCheckoutUseCase', () {
    const useCase = QuizCheckoutUseCase();

    test('全ステップ完了でクリア', () {
      expect(
        useCase.isClear(
          isAddressEntered: true,
          isPaymentSelected: true,
          isConfirmed: true,
        ),
        isTrue,
      );
    });

    test('住所未入力はクリアでない', () {
      expect(
        useCase.isClear(
          isAddressEntered: false,
          isPaymentSelected: true,
          isConfirmed: true,
        ),
        isFalse,
      );
    });

    test('支払い方法未選択はクリアでない', () {
      expect(
        useCase.isClear(
          isAddressEntered: true,
          isPaymentSelected: false,
          isConfirmed: true,
        ),
        isFalse,
      );
    });

    test('確認チェック未入力はクリアでない', () {
      expect(
        useCase.isClear(
          isAddressEntered: true,
          isPaymentSelected: true,
          isConfirmed: false,
        ),
        isFalse,
      );
    });
  });
}
