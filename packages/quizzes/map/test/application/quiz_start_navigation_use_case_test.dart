import 'package:flutter_test/flutter_test.dart';
import 'package:map/src/application/quiz_start_navigation_use_case.dart';

void main() {
  const useCase = QuizStartNavigationUseCase();

  group('QuizStartNavigationUseCase', () {
    group('isCorrectDestination', () {
      test('Grand Park（p2）を選択したとき true を返す', () {
        expect(
          useCase.isCorrectDestination(
            QuizStartNavigationUseCase.correctDestinationId,
          ),
          isTrue,
        );
      });

      test('公園以外を選択したとき false を返す', () {
        expect(useCase.isCorrectDestination('p1'), isFalse);
        expect(useCase.isCorrectDestination('p3'), isFalse);
        expect(useCase.isCorrectDestination('p4'), isFalse);
        expect(useCase.isCorrectDestination('p5'), isFalse);
      });
    });

    group('isCorrectTransport', () {
      test('電車（index 2）を選択したとき true を返す', () {
        expect(
          useCase.isCorrectTransport(
            QuizStartNavigationUseCase.correctTransportIndex,
          ),
          isTrue,
        );
      });

      test('電車以外を選択したとき false を返す', () {
        expect(useCase.isCorrectTransport(0), isFalse); // car
        expect(useCase.isCorrectTransport(1), isFalse); // walk
        expect(useCase.isCorrectTransport(3), isFalse); // bike
      });
    });

    group('isClear', () {
      test('navigationStarted が true のとき isClear は true を返す', () {
        expect(useCase.isClear(navigationStarted: true), isTrue);
      });

      test('navigationStarted が false のとき isClear は false を返す', () {
        expect(useCase.isClear(navigationStarted: false), isFalse);
      });
    });

    group('failureReason', () {
      test('navigationStarted が true のとき failureReason は null を返す', () {
        expect(useCase.failureReason(navigationStarted: true), isNull);
      });

      test('navigationStarted が false のとき failureReason は非 null を返す', () {
        expect(useCase.failureReason(navigationStarted: false), isNotNull);
      });
    });
  });
}
