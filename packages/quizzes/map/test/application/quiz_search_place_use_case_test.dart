import 'package:flutter_test/flutter_test.dart';
import 'package:map/src/application/quiz_search_place_use_case.dart';

void main() {
  const useCase = QuizSearchPlaceUseCase();

  group('QuizSearchPlaceUseCase', () {
    test('placeSelected が true のとき isClear は true を返す', () {
      expect(useCase.isClear(placeSelected: true), isTrue);
    });

    test('placeSelected が false のとき isClear は false を返す', () {
      expect(useCase.isClear(placeSelected: false), isFalse);
    });

    test('placeSelected が true のとき failureReason は null を返す', () {
      expect(useCase.failureReason(placeSelected: true), isNull);
    });

    test('placeSelected が false のとき failureReason は非 null を返す', () {
      expect(useCase.failureReason(placeSelected: false), isNotNull);
    });
  });
}
