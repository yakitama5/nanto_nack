import 'package:flutter_test/flutter_test.dart';
import 'package:alarm/src/application/quiz_add_alarm_use_case.dart';

void main() {
  const useCase = QuizAddAlarmUseCase();

  group('QuizAddAlarmUseCase', () {
    test('alarmSaved が true のとき isClear は true を返す', () {
      expect(useCase.isClear(alarmSaved: true), isTrue);
    });

    test('alarmSaved が false のとき isClear は false を返す', () {
      expect(useCase.isClear(alarmSaved: false), isFalse);
    });

    test('alarmSaved が true のとき failureReason は null を返す', () {
      expect(useCase.failureReason(alarmSaved: true), isNull);
    });

    test('alarmSaved が false のとき failureReason は非 null を返す', () {
      expect(useCase.failureReason(alarmSaved: false), isNotNull);
    });
  });
}
