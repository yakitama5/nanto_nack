import 'package:flutter_test/flutter_test.dart';
import 'package:map/src/application/quiz_save_place_use_case.dart';

void main() {
  const useCase = QuizSavePlaceUseCase();

  group('QuizSavePlaceUseCase', () {
    group('isCorrectPlace', () {
      test('Main Station（p3）を選択したとき true を返す', () {
        expect(
          useCase.isCorrectPlace(QuizSavePlaceUseCase.correctPlaceId),
          isTrue,
        );
      });

      test('駅以外を選択したとき false を返す', () {
        expect(useCase.isCorrectPlace('p1'), isFalse);
        expect(useCase.isCorrectPlace('p2'), isFalse);
        expect(useCase.isCorrectPlace('p4'), isFalse);
        expect(useCase.isCorrectPlace('p5'), isFalse);
      });
    });

    group('isClear', () {
      test('isFavorite が true のとき isClear は true を返す', () {
        expect(useCase.isClear(isFavorite: true), isTrue);
      });

      test('isFavorite が false のとき isClear は false を返す', () {
        expect(useCase.isClear(isFavorite: false), isFalse);
      });
    });

    group('failureReason', () {
      test('isFavorite が true のとき failureReason は null を返す', () {
        expect(useCase.failureReason(isFavorite: true), isNull);
      });

      test('isFavorite が false のとき failureReason は非 null を返す', () {
        expect(useCase.failureReason(isFavorite: false), isNotNull);
      });
    });
  });
}
