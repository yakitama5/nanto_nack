import 'package:mail/src/domain/entities/mail.dart';
import 'package:mail/src/domain/entities/mail_folder.dart';

/// Quiz2 (ゴミ箱を空にする) のクリア判定ユースケース
class QuizEmptyTrashUseCase {
  const QuizEmptyTrashUseCase();

  /// ゴミ箱を空にした後のメールリストが正しくゴミ箱0件かを判定する
  bool isClear({required List<Mail> mails}) {
    return mails.every((m) => m.folder != MailFolder.trash);
  }
}
