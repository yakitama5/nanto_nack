import 'package:flutter_test/flutter_test.dart';
import 'package:streaming/src/application/quiz_save_video_use_case.dart';

void main() {
  const useCase = QuizSaveVideoUseCase();

  group('QuizSaveVideoUseCase.isClear', () {
    test('isSaved=true のときクリア', () {
      expect(useCase.isClear(isSaved: true), isTrue);
    });

    test('isSaved=false のときクリアでない', () {
      expect(useCase.isClear(isSaved: false), isFalse);
    });
  });

  group('QuizSaveVideoUseCase.failureReason', () {
    test('クリア時は null を返す', () {
      expect(useCase.failureReason(isSaved: true), isNull);
    });

    test('クリアでないときメッセージを返す', () {
      expect(useCase.failureReason(isSaved: false), isNotNull);
    });
  });
}
