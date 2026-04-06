import 'package:chat/src/application/quiz_cancel_message_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const useCase = QuizCancelMessageUseCase();

  group('QuizCancelMessageUseCase.isClear', () {
    test('メッセージが取り消し済みならクリア', () {
      expect(useCase.isClear(messageCancelled: true), isTrue);
    });

    test('メッセージが未取り消しならクリアでない', () {
      expect(useCase.isClear(messageCancelled: false), isFalse);
    });
  });

  group('QuizCancelMessageUseCase.failureReason', () {
    test('クリア時はnullを返す', () {
      expect(useCase.failureReason(messageCancelled: true), isNull);
    });

    test('クリアでない時はメッセージを返す', () {
      expect(useCase.failureReason(messageCancelled: false), isNotNull);
    });
  });
}
