import 'package:flutter/material.dart';

import '../presentation/calendar_quiz_type.dart';
import 'entities/calendar_event.dart';

/// カレンダークイズの初期データカタログ
///
/// clock.now() の代わりに [now] パラメータを受け取ることで
/// テスト時に withClock() で決定的な日時を注入できる。
class CalendarCatalog {
  CalendarCatalog._();

  /// クイズタイプに応じた初期イベントリストを返す
  static List<CalendarEvent> initialEventsFor(
    CalendarQuizType quizType,
    DateTime now,
  ) {
    return switch (quizType) {
      CalendarQuizType.quiz1 => _quiz1Events(now),
      CalendarQuizType.quiz2 => _quiz2Events(now),
      CalendarQuizType.quiz3 => _quiz3Events(now),
      CalendarQuizType.quiz4 => _quiz4Events(now),
    };
  }

  /// クイズタイプに応じた初期表示月を返す
  ///
  /// cr_calendar は月の1日を initialDate に渡す必要がある。
  static DateTime initialMonthFor(CalendarQuizType quizType, DateTime now) {
    return switch (quizType) {
      CalendarQuizType.quiz1 ||
      CalendarQuizType.quiz2 ||
      CalendarQuizType.quiz3 => DateTime(now.year, now.month),
      // Quiz4: 3年後の月から始まり「今日」に戻る操作を体験させる
      CalendarQuizType.quiz4 => DateTime(now.year + 3, now.month),
    };
  }

  /// Quiz1: 翌月に2件の予定（来月確認を体験させる）
  static List<CalendarEvent> _quiz1Events(DateTime now) {
    final nextYear = now.month == 12 ? now.year + 1 : now.year;
    final nextMonth = now.month == 12 ? 1 : now.month + 1;
    return [
      CalendarEvent(
        id: 'calendar_quiz1_interview',
        title: '面接',
        begin: DateTime(nextYear, nextMonth, 5, 10),
        end: DateTime(nextYear, nextMonth, 5, 11),
        color: Colors.blue,
      ),
      CalendarEvent(
        id: 'calendar_quiz1_party',
        title: '飲み会',
        begin: DateTime(nextYear, nextMonth, 15, 18),
        end: DateTime(nextYear, nextMonth, 15, 20),
        color: Colors.orange,
      ),
    ];
  }

  /// Quiz2: 今月5日と20日に既存予定（15日への追加を体験させる）
  static List<CalendarEvent> _quiz2Events(DateTime now) {
    return [
      CalendarEvent(
        id: 'calendar_quiz2_meeting',
        title: 'ミーティング',
        begin: DateTime(now.year, now.month, 5, 10),
        end: DateTime(now.year, now.month, 5, 11),
        color: Colors.blue,
      ),
      CalendarEvent(
        id: 'calendar_quiz2_health',
        title: '健康診断',
        begin: DateTime(now.year, now.month, 20, 9),
        end: DateTime(now.year, now.month, 20, 11),
        color: Colors.green,
      ),
    ];
  }

  /// Quiz3: 今日と明日にコンテキストイベント（翌日に移動させる）
  static List<CalendarEvent> _quiz3Events(DateTime now) {
    return [
      CalendarEvent(
        id: 'calendar_quiz3_today',
        title: '歯医者',
        begin: DateTime(now.year, now.month, now.day, 14),
        end: DateTime(now.year, now.month, now.day, 15),
        color: Colors.blue,
      ),
      CalendarEvent(
        id: 'calendar_quiz3_tomorrow',
        title: 'ランチ',
        begin: DateTime(now.year, now.month, now.day + 1, 12),
        end: DateTime(now.year, now.month, now.day + 1, 13),
        color: Colors.orange,
      ),
    ];
  }

  /// Quiz4: 3年後の月に予定（今日へ戻る操作を体験させる）
  static List<CalendarEvent> _quiz4Events(DateTime now) {
    return [
      CalendarEvent(
        id: 'calendar_quiz4_important',
        title: '大切な予定',
        begin: DateTime(now.year + 3, now.month, 10, 14),
        end: DateTime(now.year + 3, now.month, 10, 15),
        color: Colors.purple,
      ),
    ];
  }
}
