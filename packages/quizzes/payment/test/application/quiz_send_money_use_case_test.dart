import 'package:flutter_test/flutter_test.dart';
import 'package:payment/src/application/quiz_send_money_use_case.dart';

void main() {
  const useCase = QuizSendMoneyUseCase();

  group('QuizSendMoneyUseCase', () {
    test('moneySent が true のとき isClear は true を返す', () {
      expect(useCase.isClear(moneySent: true), isTrue);
    });

    test('moneySent が false のとき isClear は false を返す', () {
      expect(useCase.isClear(moneySent: false), isFalse);
    });
  });
}
