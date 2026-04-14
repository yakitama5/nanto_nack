import 'package:mail/src/domain/mail_quiz_config.dart';

/// Quiz1 (メールアーカイブ) のクリア判定ユースケース
class QuizArchiveMailUseCase {
  const QuizArchiveMailUseCase();

  /// アーカイブされたメールIDがターゲットと一致するかを判定する
  bool isClear({required String archivedMailId}) {
    return archivedMailId == MailQuizConfig.quiz1TargetMailId;
  }
}
