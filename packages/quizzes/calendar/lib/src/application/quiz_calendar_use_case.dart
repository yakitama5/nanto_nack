import '../domain/entities/calendar_event.dart';

/// カレンダークイズのクリア判定ロジック（ユースケース層）
///
/// 副作用なし・外部依存なしの純粋なDartクラス。
class QuizCalendarUseCase {
  /// コンストラクタ
  const QuizCalendarUseCase();

  /// Quiz1: focusedMonth が初期月の翌月になったかチェック
  bool isClearQuiz1({
    required DateTime focusedMonth,
    required DateTime initialMonth,
  }) {
    // 翌月の計算（12月→翌年1月に対応）
    final nextMonth = DateTime(initialMonth.year, initialMonth.month + 1);
    return focusedMonth.year == nextMonth.year &&
        focusedMonth.month == nextMonth.month;
  }

  /// Quiz2: 指定月の15日にイベントが追加されたかチェック
  bool isClearQuiz2({
    required List<CalendarEvent> events,
    required DateTime targetMonth,
  }) {
    return events.any(
      (e) =>
          e.begin.year == targetMonth.year &&
          e.begin.month == targetMonth.month &&
          e.begin.day == 15,
    );
  }

  /// Quiz3: 'calendar_meeting' のイベントが翌日に移動されたかチェック
  bool isClearQuiz3({
    required List<CalendarEvent> events,
    required DateTime originalDate,
  }) {
    final event = events.where((e) => e.id == 'calendar_meeting').firstOrNull;
    if (event == null) return false;
    // originalDate の翌日（月末をまたぐ場合も DateTime が自動補正する）
    final tomorrowDate = DateTime(
      originalDate.year,
      originalDate.month,
      originalDate.day + 1,
    );
    return event.begin.year == tomorrowDate.year &&
        event.begin.month == tomorrowDate.month &&
        event.begin.day == tomorrowDate.day;
  }

  /// Quiz4: focusedMonth が現在の年月に戻ったかチェック
  bool isClearQuiz4({
    required DateTime focusedMonth,
    required DateTime now,
  }) {
    return focusedMonth.year == now.year && focusedMonth.month == now.month;
  }
}
