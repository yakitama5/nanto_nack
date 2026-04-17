import 'package:calendar/src/application/quiz_calendar_use_case.dart';
import 'package:calendar/src/domain/entities/calendar_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const useCase = QuizCalendarUseCase();

  // テスト用の固定日時（2026年4月17日）
  final now = DateTime(2026, 4, 17);
  final initialMonth = DateTime(2026, 4); // 今月の1日

  // ---------------------------------------------------------------------------
  // Quiz1: isClearQuiz1
  // ---------------------------------------------------------------------------
  group('QuizCalendarUseCase.isClearQuiz1', () {
    test('focusedMonth が翌月のとき true を返す', () {
      final nextMonth = DateTime(2026, 5);
      expect(
        useCase.isClearQuiz1(
          focusedMonth: nextMonth,
          initialMonth: initialMonth,
        ),
        isTrue,
      );
    });

    test('focusedMonth が今月のとき false を返す', () {
      expect(
        useCase.isClearQuiz1(
          focusedMonth: initialMonth,
          initialMonth: initialMonth,
        ),
        isFalse,
      );
    });

    test('focusedMonth が2ヶ月後のとき false を返す（翌月のみクリア）', () {
      final twoMonthsLater = DateTime(2026, 6);
      expect(
        useCase.isClearQuiz1(
          focusedMonth: twoMonthsLater,
          initialMonth: initialMonth,
        ),
        isFalse,
      );
    });

    test('12月から翌年1月への遷移が正しく判定される', () {
      final december = DateTime(2026, 12);
      final january = DateTime(2027, 1);
      expect(
        useCase.isClearQuiz1(
          focusedMonth: january,
          initialMonth: december,
        ),
        isTrue,
      );
    });
  });

  // ---------------------------------------------------------------------------
  // Quiz2: isClearQuiz2
  // ---------------------------------------------------------------------------
  group('QuizCalendarUseCase.isClearQuiz2', () {
    final makeEvent = (int day) => CalendarEvent(
          id: 'test_$day',
          title: 'テストイベント',
          begin: DateTime(now.year, now.month, day, 9),
          end: DateTime(now.year, now.month, day, 10),
          color: Colors.blue,
        );

    test('15日にイベントが追加されると true を返す', () {
      expect(
        useCase.isClearQuiz2(
          events: [makeEvent(15)],
          targetMonth: initialMonth,
        ),
        isTrue,
      );
    });

    test('15日以外のイベントのみのとき false を返す', () {
      expect(
        useCase.isClearQuiz2(
          events: [makeEvent(5), makeEvent(20)],
          targetMonth: initialMonth,
        ),
        isFalse,
      );
    });

    test('イベントが空のとき false を返す', () {
      expect(
        useCase.isClearQuiz2(
          events: [],
          targetMonth: initialMonth,
        ),
        isFalse,
      );
    });

    test('異なる月の15日は対象外', () {
      final otherMonth = CalendarEvent(
        id: 'other_month',
        title: '別月の予定',
        begin: DateTime(2026, 5, 15, 9), // 翌月の15日
        end: DateTime(2026, 5, 15, 10),
        color: Colors.blue,
      );
      expect(
        useCase.isClearQuiz2(
          events: [otherMonth],
          targetMonth: initialMonth,
        ),
        isFalse,
      );
    });
  });

  // ---------------------------------------------------------------------------
  // Quiz3: isClearQuiz3
  // ---------------------------------------------------------------------------
  group('QuizCalendarUseCase.isClearQuiz3', () {
    const targetId = 'calendar_quiz3_today';

    CalendarEvent makeEvent(DateTime begin) => CalendarEvent(
          id: targetId,
          title: 'イベント',
          begin: begin,
          end: begin.add(const Duration(hours: 1)),
          color: Colors.red,
        );

    test('イベントが2日後に移動されると true を返す', () {
      final twoDaysLater = DateTime(now.year, now.month, now.day + 2, 10);
      expect(
        useCase.isClearQuiz3(
          events: [makeEvent(twoDaysLater)],
          originalDate: now,
        ),
        isTrue,
      );
    });

    test('イベントが今日のままのとき false を返す', () {
      final today = DateTime(now.year, now.month, now.day, 10);
      expect(
        useCase.isClearQuiz3(
          events: [makeEvent(today)],
          originalDate: now,
        ),
        isFalse,
      );
    });

    test('他のイベントIDのときは false を返す', () {
      final twoDaysLater = DateTime(now.year, now.month, now.day + 2, 10);
      final wrongEvent = CalendarEvent(
        id: 'wrong_id',
        title: '別のイベント',
        begin: twoDaysLater,
        end: twoDaysLater.add(const Duration(hours: 1)),
        color: Colors.blue,
      );
      expect(
        useCase.isClearQuiz3(
          events: [wrongEvent],
          originalDate: now,
        ),
        isFalse,
      );
    });

    test('イベントが存在しないとき false を返す', () {
      expect(
        useCase.isClearQuiz3(
          events: [],
          originalDate: now,
        ),
        isFalse,
      );
    });

    test('月末から翌月への2日後の移動が正しく判定される', () {
      // 4月30日から5月2日への移動
      final originalDate = DateTime(2026, 4, 30);
      final twoDaysLater = DateTime(2026, 5, 2, 10);
      expect(
        useCase.isClearQuiz3(
          events: [makeEvent(twoDaysLater)],
          originalDate: originalDate,
        ),
        isTrue,
      );
    });
  });

  // ---------------------------------------------------------------------------
  // Quiz4: isClearQuiz4
  // ---------------------------------------------------------------------------
  group('QuizCalendarUseCase.isClearQuiz4', () {
    test('focusedMonth が現在の年月のとき true を返す', () {
      final currentMonth = DateTime(now.year, now.month);
      expect(
        useCase.isClearQuiz4(
          focusedMonth: currentMonth,
          now: now,
        ),
        isTrue,
      );
    });

    test('focusedMonth が3年後のとき false を返す', () {
      final futureMonth = DateTime(now.year + 3, now.month);
      expect(
        useCase.isClearQuiz4(
          focusedMonth: futureMonth,
          now: now,
        ),
        isFalse,
      );
    });

    test('同じ月でも年が異なる場合は false を返す', () {
      final lastYear = DateTime(now.year - 1, now.month);
      expect(
        useCase.isClearQuiz4(
          focusedMonth: lastYear,
          now: now,
        ),
        isFalse,
      );
    });
  });
}
