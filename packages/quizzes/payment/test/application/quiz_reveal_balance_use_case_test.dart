import 'package:flutter_test/flutter_test.dart';
import 'package:payment/src/application/quiz_reveal_balance_use_case.dart';

void main() {
  const useCase = QuizRevealBalanceUseCase();

  group('QuizRevealBalanceUseCase', () {
    test('balanceHidden が true のとき isClear は true を返す', () {
      expect(useCase.isClear(balanceHidden: true), isTrue);
    });

    test('balanceHidden が false のとき isClear は false を返す', () {
      expect(useCase.isClear(balanceHidden: false), isFalse);
    });
  });
}
