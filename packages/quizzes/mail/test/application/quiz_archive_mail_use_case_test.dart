import 'package:flutter_test/flutter_test.dart';
import 'package:mail/src/application/quiz_archive_mail_use_case.dart';
import 'package:mail/src/domain/mail_quiz_config.dart';

void main() {
  const useCase = QuizArchiveMailUseCase();

  group('QuizArchiveMailUseCase', () {
    test('ターゲットIDと一致する場合はtrueを返す', () {
      expect(
        useCase.isClear(archivedMailId: MailQuizConfig.quiz1TargetMailId),
        isTrue,
      );
    });

    test('ターゲットIDと一致しない場合はfalseを返す', () {
      expect(
        useCase.isClear(archivedMailId: 'other_mail_id'),
        isFalse,
      );
    });
  });
}
