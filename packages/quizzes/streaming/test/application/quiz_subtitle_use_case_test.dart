import 'package:flutter_test/flutter_test.dart';
import 'package:streaming/src/application/quiz_subtitle_use_case.dart';

void main() {
  const useCase = QuizSubtitleUseCase();

  group('QuizSubtitleUseCase.isClear', () {
    test('subtitlesEnabled=true のときクリア', () {
      expect(useCase.isClear(subtitlesEnabled: true), isTrue);
    });

    test('subtitlesEnabled=false のときクリアでない', () {
      expect(useCase.isClear(subtitlesEnabled: false), isFalse);
    });
  });

  group('QuizSubtitleUseCase.failureReason', () {
    test('クリア時は null を返す', () {
      expect(useCase.failureReason(subtitlesEnabled: true), isNull);
    });

    test('クリアでないときメッセージを返す', () {
      expect(useCase.failureReason(subtitlesEnabled: false), isNotNull);
    });
  });
}
