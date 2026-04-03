import 'package:flutter_test/flutter_test.dart';
import 'package:map/src/application/quiz_show_location_use_case.dart';

void main() {
  const useCase = QuizShowLocationUseCase();

  group('QuizShowLocationUseCase', () {
    test('locationShown が true のとき isClear は true を返す', () {
      expect(useCase.isClear(locationShown: true), isTrue);
    });

    test('locationShown が false のとき isClear は false を返す', () {
      expect(useCase.isClear(locationShown: false), isFalse);
    });

    test('locationShown が true のとき failureReason は null を返す', () {
      expect(useCase.failureReason(locationShown: true), isNull);
    });

    test('locationShown が false のとき failureReason は非 null を返す', () {
      expect(useCase.failureReason(locationShown: false), isNotNull);
    });
  });
}
