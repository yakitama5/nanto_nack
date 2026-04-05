import 'package:flutter_test/flutter_test.dart';
import 'package:streaming/src/application/quiz_skip_seek_use_case.dart';

void main() {
  const useCase = QuizSkipSeekUseCase();

  group('QuizSkipSeekUseCase', () {
    test('isClear returns true when isSkipped is true and progress is within 0.4 to 0.6', () {
      expect(useCase.isClear(isSkipped: true, progress: 0.4), isTrue);
      expect(useCase.isClear(isSkipped: true, progress: 0.5), isTrue);
      expect(useCase.isClear(isSkipped: true, progress: 0.6), isTrue);
    });

    test('isClear returns false when isSkipped is false', () {
      expect(useCase.isClear(isSkipped: false, progress: 0.5), isFalse);
    });

    test('isClear returns false when progress is out of 0.4 to 0.6', () {
      expect(useCase.isClear(isSkipped: true, progress: 0.39), isFalse);
      expect(useCase.isClear(isSkipped: true, progress: 0.61), isFalse);
    });
  });
}
