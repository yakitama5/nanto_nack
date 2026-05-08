import 'package:flutter_test/flutter_test.dart';
import 'package:music/src/application/quiz_lyrics_use_case.dart';

void main() {
  const useCase = QuizLyricsUseCase();

  group('QuizLyricsUseCase', () {
    test('isClear returns true when lyricsSheetSize is 0.5', () {
      expect(useCase.isClear(lyricsSheetSize: 0.5), isTrue);
    });

    test('isClear returns true when lyricsSheetSize is greater than 0.5', () {
      expect(useCase.isClear(lyricsSheetSize: 0.8), isTrue);
    });

    test('isClear returns true when lyricsSheetSize is 1.0', () {
      expect(useCase.isClear(lyricsSheetSize: 1.0), isTrue);
    });

    test('isClear returns false when lyricsSheetSize is less than 0.5', () {
      expect(useCase.isClear(lyricsSheetSize: 0.4), isFalse);
    });

    test('isClear returns false when lyricsSheetSize is 0.0', () {
      expect(useCase.isClear(lyricsSheetSize: 0.0), isFalse);
    });
  });
}
