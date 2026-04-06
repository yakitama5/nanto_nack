import 'package:chat/src/application/quiz_send_image_use_case.dart';
import 'package:chat/src/domain/entities/chat_message.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const useCase = QuizSendImageUseCase();
  final baseTime = DateTime(2026, 3, 31, 12, 0);

  group('QuizSendImageUseCase.isClear', () {
    test('自分の画像メッセージがあればクリア', () {
      final messages = [
        ChatMessage(
          id: 'm1',
          text: '',
          isMine: true,
          sentAt: baseTime,
          isImage: true,
        ),
      ];
      expect(useCase.isClear(messages: messages), isTrue);
    });

    test('テキストメッセージのみではクリアでない', () {
      final messages = [
        ChatMessage(id: 'm1', text: 'Hello', isMine: true, sentAt: baseTime),
      ];
      expect(useCase.isClear(messages: messages), isFalse);
    });

    test('相手の画像メッセージではクリアでない', () {
      final messages = [
        ChatMessage(
          id: 'm1',
          text: '',
          isMine: false,
          sentAt: baseTime,
          isImage: true,
        ),
      ];
      expect(useCase.isClear(messages: messages), isFalse);
    });

    test('メッセージが空ならクリアでない', () {
      expect(useCase.isClear(messages: const []), isFalse);
    });
  });

  group('QuizSendImageUseCase.failureReason', () {
    test('クリア時はnullを返す', () {
      final messages = [
        ChatMessage(
          id: 'm1',
          text: '',
          isMine: true,
          sentAt: baseTime,
          isImage: true,
        ),
      ];
      expect(useCase.failureReason(messages: messages), isNull);
    });

    test('クリアでない時はメッセージを返す', () {
      expect(useCase.failureReason(messages: const []), isNotNull);
    });
  });
}
