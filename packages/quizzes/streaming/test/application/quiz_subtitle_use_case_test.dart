import 'package:flutter_test/flutter_test.dart';
import 'package:streaming/src/application/quiz_subtitle_use_case.dart';

void main() {
  const useCase = QuizSubtitleUseCase();

  group('QuizSubtitleUseCase', () {
    test('isClear returns true when subtitlesEnabled is true', () {
      expect(useCase.isClear(subtitlesEnabled: true), isTrue);
    });

    test('isClear returns false when subtitlesEnabled is false', () {
      expect(useCase.isClear(subtitlesEnabled: false), isFalse);
    });
  });
}
