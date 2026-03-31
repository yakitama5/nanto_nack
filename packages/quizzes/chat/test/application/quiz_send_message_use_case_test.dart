import 'package:chat/src/application/quiz_send_message_use_case.dart';
import 'package:chat/src/domain/entities/chat_message.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const useCase = QuizSendMessageUseCase();
  final _baseTime = DateTime(2026, 3, 31, 12, 0);

  group('QuizSendMessageUseCase.isClear', () {
    test('自分のテキストメッセージがあればクリア', () {
      final messages = [
        ChatMessage(
          id: 'm1',
          text: 'Hello',
          isMine: true,
          sentAt: _baseTime,
        ),
      ];
      expect(useCase.isClear(messages: messages), isTrue);
    });

    test('自分のメッセージがなければクリアでない', () {
      final messages = [
        ChatMessage(
          id: 'm1',
          text: 'Hello',
          isMine: false,
          sentAt: _baseTime,
        ),
      ];
      expect(useCase.isClear(messages: messages), isFalse);
    });

    test('スタンプメッセージのみではクリアでない', () {
      final messages = [
        ChatMessage(
          id: 'm1',
          text: '😊',
          isMine: true,
          sentAt: _baseTime,
          isStamp: true,
          stampId: '😊',
        ),
      ];
      expect(useCase.isClear(messages: messages), isFalse);
    });

    test('削除済みメッセージはカウントしない', () {
      final messages = [
        ChatMessage(
          id: 'm1',
          text: 'Hello',
          isMine: true,
          sentAt: _baseTime,
          isDeleted: true,
        ),
      ];
      expect(useCase.isClear(messages: messages), isFalse);
    });

    test('メッセージが空ならクリアでない', () {
      expect(useCase.isClear(messages: const []), isFalse);
    });
  });

  group('QuizSendMessageUseCase.failureReason', () {
    test('クリア時はnullを返す', () {
      final messages = [
        ChatMessage(
          id: 'm1',
          text: 'Hello',
          isMine: true,
          sentAt: _baseTime,
        ),
      ];
      expect(useCase.failureReason(messages: messages), isNull);
    });

    test('クリアでない時はメッセージを返す', () {
      expect(
        useCase.failureReason(messages: const []),
        isNotNull,
      );
    });
  });
}
