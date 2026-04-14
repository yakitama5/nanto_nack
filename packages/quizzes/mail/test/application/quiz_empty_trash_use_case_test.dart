import 'package:flutter_test/flutter_test.dart';
import 'package:mail/src/application/quiz_empty_trash_use_case.dart';
import 'package:mail/src/domain/entities/mail.dart';
import 'package:mail/src/domain/entities/mail_folder.dart';

void main() {
  const useCase = QuizEmptyTrashUseCase();

  group('QuizEmptyTrashUseCase', () {
    test('ゴミ箱が0件の場合はtrueを返す', () {
      final mails = [
        const Mail(
          id: '1',
          sender: 'Alice',
          subject: 'Hello',
          bodyPreview: 'Hi',
          isRead: true,
          folder: MailFolder.inbox,
          timeLabel: '1h',
        ),
      ];
      expect(useCase.isClear(mails: mails), isTrue);
    });

    test('ゴミ箱に1件以上ある場合はfalseを返す', () {
      final mails = [
        const Mail(
          id: '1',
          sender: 'Alice',
          subject: 'Hello',
          bodyPreview: 'Hi',
          isRead: true,
          folder: MailFolder.trash,
          timeLabel: '1h',
        ),
      ];
      expect(useCase.isClear(mails: mails), isFalse);
    });

    test('メールが空の場合はtrueを返す（ゴミ箱0件）', () {
      expect(useCase.isClear(mails: []), isTrue);
    });
  });
}
