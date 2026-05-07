import 'package:flutter_test/flutter_test.dart';
import 'package:music/src/application/quiz_next_song_use_case.dart';

void main() {
  const useCase = QuizNextSongUseCase();

  group('QuizNextSongUseCase', () {
    test('isClear returns true when currentIndex differs from previousIndex', () {
      expect(useCase.isClear(previousIndex: 0, currentIndex: 1), isTrue);
    });

    test('isClear returns false when currentIndex equals previousIndex', () {
      expect(useCase.isClear(previousIndex: 0, currentIndex: 0), isFalse);
    });

    test('isClear returns true when going from index 1 to index 0', () {
      expect(useCase.isClear(previousIndex: 1, currentIndex: 0), isTrue);
    });
  });
}
