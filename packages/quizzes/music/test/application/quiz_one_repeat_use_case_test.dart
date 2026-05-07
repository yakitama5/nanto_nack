import 'package:flutter_test/flutter_test.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music/src/application/quiz_one_repeat_use_case.dart';

void main() {
  const useCase = QuizOneRepeatUseCase();

  group('QuizOneRepeatUseCase', () {
    test('isClear returns true when repeatMode is LoopMode.one', () {
      expect(useCase.isClear(repeatMode: LoopMode.one), isTrue);
    });

    test('isClear returns false when repeatMode is LoopMode.off', () {
      expect(useCase.isClear(repeatMode: LoopMode.off), isFalse);
    });

    test('isClear returns false when repeatMode is LoopMode.all', () {
      expect(useCase.isClear(repeatMode: LoopMode.all), isFalse);
    });
  });
}
