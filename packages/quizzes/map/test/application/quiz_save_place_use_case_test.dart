import 'package:flutter_test/flutter_test.dart';
import 'package:map/src/application/quiz_save_place_use_case.dart';

void main() {
  const useCase = QuizSavePlaceUseCase();

  group('QuizSavePlaceUseCase', () {
    test('isFavorite が true のとき isClear は true を返す', () {
      expect(useCase.isClear(isFavorite: true), isTrue);
    });

    test('isFavorite が false のとき isClear は false を返す', () {
      expect(useCase.isClear(isFavorite: false), isFalse);
    });

    test('isFavorite が true のとき failureReason は null を返す', () {
      expect(useCase.failureReason(isFavorite: true), isNull);
    });

    test('isFavorite が false のとき failureReason は非 null を返す', () {
      expect(useCase.failureReason(isFavorite: false), isNotNull);
    });
  });
}
