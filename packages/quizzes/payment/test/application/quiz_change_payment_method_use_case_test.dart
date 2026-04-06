import 'package:flutter_test/flutter_test.dart';
import 'package:payment/src/application/quiz_change_payment_method_use_case.dart';
import 'package:payment/src/domain/payment_method.dart';

void main() {
  const useCase = QuizChangePaymentMethodUseCase();

  group('QuizChangePaymentMethodUseCase', () {
    test('クレジットカードが選択されて支払い画面が開かれている場合 isClear は true を返す', () {
      expect(
        useCase.isClear(
          currentPaymentMethod: PaymentMethod.creditCard,
          paymentScreenShown: true,
        ),
        isTrue,
      );
    });

    test('残高が選択されている場合は isClear は false を返す', () {
      expect(
        useCase.isClear(
          currentPaymentMethod: PaymentMethod.balance,
          paymentScreenShown: true,
        ),
        isFalse,
      );
    });

    test('支払い画面が開かれていない場合は isClear は false を返す', () {
      expect(
        useCase.isClear(
          currentPaymentMethod: PaymentMethod.creditCard,
          paymentScreenShown: false,
        ),
        isFalse,
      );
    });
  });
}
