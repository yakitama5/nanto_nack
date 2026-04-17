import '../presentation/calendar_quiz_type.dart';

/// カレンダークイズの設定定数
abstract final class CalendarQuizConfig {
  /// Quiz1: 翌月スワイプの制限時間（秒）
  static const quiz1SwipeToMonthTimeLimitSeconds = 30;

  /// Quiz2: 予定追加の制限時間（秒）
  static const quiz2AddEventTimeLimitSeconds = 60;

  /// Quiz3: 予定移動の制限時間（秒）
  static const quiz3MoveEventTimeLimitSeconds = 60;

  /// Quiz4: 今日へジャンプの制限時間（秒）
  static const quiz4JumpToTodayTimeLimitSeconds = 30;

  /// クイズタイプに対応する制限時間（秒）を返す
  static int timeLimitSecondsFor(CalendarQuizType quizType) {
    return switch (quizType) {
      CalendarQuizType.quiz1 => quiz1SwipeToMonthTimeLimitSeconds,
      CalendarQuizType.quiz2 => quiz2AddEventTimeLimitSeconds,
      CalendarQuizType.quiz3 => quiz3MoveEventTimeLimitSeconds,
      CalendarQuizType.quiz4 => quiz4JumpToTodayTimeLimitSeconds,
    };
  }
}
