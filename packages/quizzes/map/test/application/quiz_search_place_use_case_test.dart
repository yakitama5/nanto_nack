import 'package:flutter_test/flutter_test.dart';
import 'package:map/src/application/quiz_search_place_use_case.dart';

void main() {
  const useCase = QuizShowSchoolInfoUseCase();

  group('QuizShowSchoolInfoUseCase', () {
    test('学校（p5）を選択したとき isClear は true を返す', () {
      expect(
        useCase.isClear(selectedPlaceId: QuizShowSchoolInfoUseCase.correctPlaceId),
        isTrue,
      );
    });

    test('学校以外を選択したとき isClear は false を返す', () {
      expect(useCase.isClear(selectedPlaceId: 'p1'), isFalse);
      expect(useCase.isClear(selectedPlaceId: 'p2'), isFalse);
      expect(useCase.isClear(selectedPlaceId: 'p3'), isFalse);
      expect(useCase.isClear(selectedPlaceId: 'p4'), isFalse);
    });

    test('学校（p5）を選択したとき failureReason は null を返す', () {
      expect(
        useCase.failureReason(selectedPlaceId: QuizShowSchoolInfoUseCase.correctPlaceId),
        isNull,
      );
    });

    test('学校以外を選択したとき failureReason は非 null を返す', () {
      expect(useCase.failureReason(selectedPlaceId: 'p1'), isNotNull);
    });
  });
}
