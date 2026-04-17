import '../presentation/sns_quiz_type.dart';

/// SNSクイズの設定値定数
abstract final class SnsQuizConfig {
  /// Quiz1の制限時間（秒）
  static const int quiz1TimeLimitSeconds = 30;

  /// Quiz2の制限時間（秒）
  static const int quiz2TimeLimitSeconds = 30;

  /// Quiz3の制限時間（秒）
  static const int quiz3TimeLimitSeconds = 30;

  /// Quiz4の制限時間（秒）
  static const int quiz4TimeLimitSeconds = 30;

  /// メインアカウントのID
  static const String mainAccountId = '@nanto_user';

  /// サブアカウントのID
  static const String subAccountId = '@nanto_ura';

  /// 猫投稿のID（Quiz1のクリア対象）
  static const String catPostId = 'sns_quiz1_cat_post';

  /// クイズタイプに応じた制限時間を返す
  static int timeLimitSecondsFor(SnsQuizType quizType) => switch (quizType) {
    SnsQuizType.quiz1 => quiz1TimeLimitSeconds,
    SnsQuizType.quiz2 => quiz2TimeLimitSeconds,
    SnsQuizType.quiz3 => quiz3TimeLimitSeconds,
    SnsQuizType.quiz4 => quiz4TimeLimitSeconds,
  };
}
