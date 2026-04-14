import 'package:flutter_test/flutter_test.dart';
import 'package:mail/src/application/quiz_select_delete_use_case.dart';

void main() {
  const useCase = QuizSelectDeleteUseCase();

  group('QuizSelectDeleteUseCase', () {
    test('選択数が3件の場合はtrueを返す', () {
      expect(useCase.isClear(selectedCount: 3), isTrue);
    });

    test('選択数が2件の場合はfalseを返す', () {
      expect(useCase.isClear(selectedCount: 2), isFalse);
    });

    test('選択数が4件の場合はfalseを返す', () {
      expect(useCase.isClear(selectedCount: 4), isFalse);
    });

    test('選択数が0件の場合はfalseを返す', () {
      expect(useCase.isClear(selectedCount: 0), isFalse);
    });
  });
}
