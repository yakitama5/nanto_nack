import 'package:mail/src/domain/mail_quiz_config.dart';

/// Quiz4 (特定コマンドで検索) のクリア判定ユースケース
class QuizSearchUseCase {
  const QuizSearchUseCase();

  /// 検索クエリが正解と一致するかを判定する
  ///
  /// 前後の空白を除去し、大文字小文字を区別しない比較を行う。
  bool isClear({required String query}) {
    return query.trim().toLowerCase() ==
        MailQuizConfig.quiz4TargetQuery.toLowerCase();
  }
}
