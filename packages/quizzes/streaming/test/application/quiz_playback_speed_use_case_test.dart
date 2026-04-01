import 'package:flutter_test/flutter_test.dart';
import 'package:streaming/src/application/quiz_playback_speed_use_case.dart';

void main() {
  const useCase = QuizPlaybackSpeedUseCase();

  group('QuizPlaybackSpeedUseCase', () {
    test('isClear returns true when playbackSpeed is 2.0', () {
      expect(useCase.isClear(playbackSpeed: 2.0), isTrue);
    });

    test('isClear returns false when playbackSpeed is not 2.0', () {
      expect(useCase.isClear(playbackSpeed: 1.0), isFalse);
      expect(useCase.isClear(playbackSpeed: 1.5), isFalse);
    });
  });
}
