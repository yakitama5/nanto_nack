import 'package:chat/src/application/quiz_send_reaction_use_case.dart';
import 'package:chat/src/domain/entities/chat_message.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const useCase = QuizSendReactionUseCase();
  final baseTime = DateTime(2026, 3, 31, 12, 0);

  group('QuizSendReactionUseCase.isClear', () {
    test('相手のメッセージにハートリアクションがあればクリア', () {
      final messages = [
        ChatMessage(
          id: 'm1',
          text: 'Hello',
          isMine: false,
          sentAt: baseTime,
          reaction: '❤️',
        ),
      ];
      expect(useCase.isClear(messages: messages), isTrue);
    });

    test('リアクションなしではクリアでない', () {
      final messages = [
        ChatMessage(id: 'm1', text: 'Hello', isMine: false, sentAt: baseTime),
      ];
      expect(useCase.isClear(messages: messages), isFalse);
    });

    test('自分のメッセージへのリアクションはクリアでない', () {
      final messages = [
        ChatMessage(
          id: 'm1',
          text: 'Hello',
          isMine: true,
          sentAt: baseTime,
          reaction: '❤️',
        ),
      ];
      expect(useCase.isClear(messages: messages), isFalse);
    });

    test('ハート以外のリアクションはクリアでない', () {
      final messages = [
        ChatMessage(
          id: 'm1',
          text: 'Hello',
          isMine: false,
          sentAt: baseTime,
          reaction: '👍',
        ),
      ];
      expect(useCase.isClear(messages: messages), isFalse);
    });

    test('メッセージが空ならクリアでない', () {
      expect(useCase.isClear(messages: const []), isFalse);
    });
  });

  group('QuizSendReactionUseCase.failureReason', () {
    test('クリア時はnullを返す', () {
      final messages = [
        ChatMessage(
          id: 'm1',
          text: 'Hello',
          isMine: false,
          sentAt: baseTime,
          reaction: '❤️',
        ),
      ];
      expect(useCase.failureReason(messages: messages), isNull);
    });

    test('クリアでない時はメッセージを返す', () {
      expect(useCase.failureReason(messages: const []), isNotNull);
    });
  });
}
