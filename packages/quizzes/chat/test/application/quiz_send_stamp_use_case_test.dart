import 'package:chat/src/application/quiz_send_stamp_use_case.dart';
import 'package:chat/src/domain/entities/chat_message.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const useCase = QuizSendStampUseCase();
  final _baseTime = DateTime(2026, 3, 31, 12, 0);

  group('QuizSendStampUseCase.isClear', () {
    test('自分のスタンプメッセージがあればクリア', () {
      final messages = [
        ChatMessage(
          id: 's1',
          text: '😊',
          isMine: true,
          sentAt: _baseTime,
          isStamp: true,
          stampId: '😊',
        ),
      ];
      expect(useCase.isClear(messages: messages), isTrue);
    });

    test('テキストメッセージのみではクリアでない', () {
      final messages = [
        ChatMessage(
          id: 'm1',
          text: 'Hello',
          isMine: true,
          sentAt: _baseTime,
        ),
      ];
      expect(useCase.isClear(messages: messages), isFalse);
    });

    test('相手のスタンプではクリアでない', () {
      final messages = [
        ChatMessage(
          id: 's1',
          text: '😊',
          isMine: false,
          sentAt: _baseTime,
          isStamp: true,
          stampId: '😊',
        ),
      ];
      expect(useCase.isClear(messages: messages), isFalse);
    });

    test('メッセージが空ならクリアでない', () {
      expect(useCase.isClear(messages: const []), isFalse);
    });
  });
}
