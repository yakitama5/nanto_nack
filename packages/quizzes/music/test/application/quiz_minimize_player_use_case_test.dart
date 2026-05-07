import 'package:flutter_test/flutter_test.dart';
import 'package:music/src/application/quiz_minimize_player_use_case.dart';

void main() {
  const useCase = QuizMinimizePlayerUseCase();

  group('QuizMinimizePlayerUseCase', () {
    test('isClear returns true when isExpanded is false', () {
      expect(useCase.isClear(isExpanded: false), isTrue);
    });

    test('isClear returns false when isExpanded is true', () {
      expect(useCase.isClear(isExpanded: true), isFalse);
    });
  });
}
