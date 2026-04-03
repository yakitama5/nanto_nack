import 'package:flutter_test/flutter_test.dart';
import 'package:payment/src/application/quiz_view_history_use_case.dart';

void main() {
  const useCase = QuizViewHistoryUseCase();

  group('QuizViewHistoryUseCase', () {
    test('historyViewed が true のとき isClear は true を返す', () {
      expect(useCase.isClear(historyViewed: true), isTrue);
    });

    test('historyViewed が false のとき isClear は false を返す', () {
      expect(useCase.isClear(historyViewed: false), isFalse);
    });
  });
}
