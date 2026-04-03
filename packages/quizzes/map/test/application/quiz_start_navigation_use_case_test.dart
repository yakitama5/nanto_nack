import 'package:flutter_test/flutter_test.dart';
import 'package:map/src/application/quiz_start_navigation_use_case.dart';

void main() {
  const useCase = QuizStartNavigationUseCase();

  group('QuizStartNavigationUseCase', () {
    test('navigationStarted が true のとき isClear は true を返す', () {
      expect(useCase.isClear(navigationStarted: true), isTrue);
    });

    test('navigationStarted が false のとき isClear は false を返す', () {
      expect(useCase.isClear(navigationStarted: false), isFalse);
    });

    test('navigationStarted が true のとき failureReason は null を返す', () {
      expect(useCase.failureReason(navigationStarted: true), isNull);
    });

    test('navigationStarted が false のとき failureReason は非 null を返す', () {
      expect(useCase.failureReason(navigationStarted: false), isNotNull);
    });
  });
}
