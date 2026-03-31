import 'package:chat/src/application/quiz_delete_message_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const useCase = QuizDeleteMessageUseCase();

  group('QuizDeleteMessageUseCase.isClear', () {
    test('メッセージが削除済みならクリア', () {
      expect(useCase.isClear(messageDeleted: true), isTrue);
    });

    test('メッセージが未削除ならクリアでない', () {
      expect(useCase.isClear(messageDeleted: false), isFalse);
    });
  });

  group('QuizDeleteMessageUseCase.failureReason', () {
    test('クリア時はnullを返す', () {
      expect(useCase.failureReason(messageDeleted: true), isNull);
    });

    test('クリアでない時はメッセージを返す', () {
      expect(useCase.failureReason(messageDeleted: false), isNotNull);
    });
  });
}
