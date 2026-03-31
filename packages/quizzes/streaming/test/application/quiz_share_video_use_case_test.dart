import 'package:flutter_test/flutter_test.dart';
import 'package:streaming/src/application/quiz_share_video_use_case.dart';

void main() {
  const useCase = QuizShareVideoUseCase();

  group('QuizShareVideoUseCase.isClear', () {
    test('isShared=true のときクリア', () {
      expect(useCase.isClear(isShared: true), isTrue);
    });

    test('isShared=false のときクリアでない', () {
      expect(useCase.isClear(isShared: false), isFalse);
    });
  });

  group('QuizShareVideoUseCase.failureReason', () {
    test('クリア時は null を返す', () {
      expect(useCase.failureReason(isShared: true), isNull);
    });

    test('クリアでないときメッセージを返す', () {
      expect(useCase.failureReason(isShared: false), isNotNull);
    });
  });
}
