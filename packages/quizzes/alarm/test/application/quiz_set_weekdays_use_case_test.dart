import 'package:flutter_test/flutter_test.dart';
import 'package:alarm/src/application/quiz_set_weekdays_use_case.dart';

void main() {
  const useCase = QuizSetWeekdaysUseCase();

  group('QuizSetWeekdaysUseCase', () {
    test('月〜金の5日が選択されているとき isClear は true を返す', () {
      expect(useCase.isClear(activeDays: {0, 1, 2, 3, 4}), isTrue);
    });

    test('月〜金のすべてが選択されていないとき isClear は false を返す', () {
      expect(useCase.isClear(activeDays: {0, 1, 2, 3}), isFalse);
    });

    test('空のとき isClear は false を返す', () {
      expect(useCase.isClear(activeDays: {}), isFalse);
    });

    test('月〜日（全曜日）のとき isClear は false を返す（土日含む）', () {
      expect(useCase.isClear(activeDays: {0, 1, 2, 3, 4, 5, 6}), isFalse);
    });

    test('月〜金のとき failureReason は null を返す', () {
      expect(useCase.failureReason(activeDays: {0, 1, 2, 3, 4}), isNull);
    });

    test('未達のとき failureReason は非 null を返す', () {
      expect(useCase.failureReason(activeDays: {0, 1}), isNotNull);
    });
  });
}
