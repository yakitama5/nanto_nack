import 'package:flutter_test/flutter_test.dart';
import 'package:streaming/src/application/quiz_play_video_use_case.dart';

void main() {
  const useCase = QuizPlayVideoUseCase();

  group('QuizPlayVideoUseCase.isClear', () {
    test('isPlaying=true のときクリア', () {
      expect(useCase.isClear(isPlaying: true), isTrue);
    });

    test('isPlaying=false のときクリアでない', () {
      expect(useCase.isClear(isPlaying: false), isFalse);
    });
  });

  group('QuizPlayVideoUseCase.failureReason', () {
    test('クリア時は null を返す', () {
      expect(useCase.failureReason(isPlaying: true), isNull);
    });

    test('クリアでないときメッセージを返す', () {
      expect(useCase.failureReason(isPlaying: false), isNotNull);
    });
  });
}
