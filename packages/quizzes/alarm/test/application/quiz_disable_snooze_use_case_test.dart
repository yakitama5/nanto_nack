import 'package:flutter_test/flutter_test.dart';
import 'package:alarm/src/application/quiz_disable_snooze_use_case.dart';

void main() {
  const useCase = QuizDisableSnoozeUseCase();

  group('QuizDisableSnoozeUseCase', () {
    test('スヌーズ無効かつ保存済みのとき isClear は true を返す', () {
      expect(useCase.isClear(snoozeEnabled: false, saved: true), isTrue);
    });

    test('スヌーズ有効のとき isClear は false を返す', () {
      expect(useCase.isClear(snoozeEnabled: true, saved: true), isFalse);
    });

    test('保存されていないとき isClear は false を返す', () {
      expect(useCase.isClear(snoozeEnabled: false, saved: false), isFalse);
    });

    test('クリア時は failureReason が null を返す', () {
      expect(
        useCase.failureReason(snoozeEnabled: false, saved: true),
        isNull,
      );
    });

    test('未クリア時は failureReason が非 null を返す', () {
      expect(
        useCase.failureReason(snoozeEnabled: true, saved: true),
        isNotNull,
      );
    });
  });
}
