import 'package:flutter_test/flutter_test.dart';
import 'package:payment/src/application/quiz_show_qr_use_case.dart';

void main() {
  const useCase = QuizShowQrUseCase();

  group('QuizShowQrUseCase', () {
    test('paymentShown が true のとき isClear は true を返す', () {
      expect(useCase.isClear(paymentShown: true), isTrue);
    });

    test('paymentShown が false のとき isClear は false を返す', () {
      expect(useCase.isClear(paymentShown: false), isFalse);
    });
  });
}
