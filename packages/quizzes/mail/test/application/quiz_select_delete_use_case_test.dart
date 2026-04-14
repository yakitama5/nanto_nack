import 'package:flutter_test/flutter_test.dart';
import 'package:mail/src/application/quiz_select_delete_use_case.dart';

void main() {
  const useCase = QuizSelectDeleteUseCase();

  group('QuizSelectDeleteUseCase', () {
    // table-driven: [selectedCount, expectedResult]
    const cases = <(int, bool)>[
      (0, false),
      (1, false),
      (2, false),
      (3, true), // 正解: ちょうど3件
      (4, false),
      (5, false),
    ];

    for (final (count, expected) in cases) {
      test('選択数が$count件の場合は${expected ? 'true' : 'false'}を返す', () {
        expect(useCase.isClear(selectedCount: count), expected);
      });
    }
  });
}
