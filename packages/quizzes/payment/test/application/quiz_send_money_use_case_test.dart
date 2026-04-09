import 'package:flutter_test/flutter_test.dart';
import 'package:payment/src/application/quiz_send_money_use_case.dart';

void main() {
  const useCase = QuizSendMoneyUseCase();

  group('QuizSendMoneyUseCase', () {
    group('isClear', () {
      test('5,000円で送金済みのとき true を返す', () {
        expect(
          useCase.isClear(
            moneySent: true,
            amount: QuizSendMoneyUseCase.targetAmount,
          ),
          isTrue,
        );
      });

      test('送金済みでも金額が 5,000円未満のとき false を返す', () {
        expect(
          useCase.isClear(moneySent: true, amount: 1),
          isFalse,
        );
      });

      test('送金済みでも金額が 5,000円超のとき false を返す', () {
        expect(
          useCase.isClear(moneySent: true, amount: 5001),
          isFalse,
        );
      });

      test('金額が正しくても moneySent が false のとき false を返す', () {
        expect(
          useCase.isClear(
            moneySent: false,
            amount: QuizSendMoneyUseCase.targetAmount,
          ),
          isFalse,
        );
      });
    });
  });
}
