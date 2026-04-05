import 'package:flutter_test/flutter_test.dart';
import 'package:alarm/src/application/quiz_delete_alarm_use_case.dart';

void main() {
  const useCase = QuizDeleteAlarmUseCase();

  group('QuizDeleteAlarmUseCase', () {
    test('alarmDeleted が true のとき isClear は true を返す', () {
      expect(useCase.isClear(alarmDeleted: true), isTrue);
    });

    test('alarmDeleted が false のとき isClear は false を返す', () {
      expect(useCase.isClear(alarmDeleted: false), isFalse);
    });

    test('alarmDeleted が true のとき failureReason は null を返す', () {
      expect(useCase.failureReason(alarmDeleted: true), isNull);
    });

    test('alarmDeleted が false のとき failureReason は非 null を返す', () {
      expect(useCase.failureReason(alarmDeleted: false), isNotNull);
    });
  });
}
