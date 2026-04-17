import 'package:flutter/foundation.dart';
import 'package:quiz_core/quiz_core.dart';

import '../domain/calendar_catalog.dart';
import '../domain/calendar_quiz_config.dart';
import '../domain/entities/calendar_event.dart';
import 'calendar_quiz_type.dart';

/// カレンダークイズの状態（全4クイズ共通）
@immutable
class CalendarQuizState extends QuizStateBase {
  /// コンストラクタ
  const CalendarQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.events,
    required this.focusedMonth,
    required this.initialMonth,
    required this.remainingSeconds,
    required this.quizStartTime,
  });

  /// 初期状態を生成する
  ///
  /// [now] には clock.now() を渡すことでテスト時に差し替え可能にする。
  factory CalendarQuizState.initial(CalendarQuizType quizType, DateTime now) {
    final events = CalendarCatalog.initialEventsFor(quizType, now);
    final month = CalendarCatalog.initialMonthFor(quizType, now);
    return CalendarQuizState(
      status: QuizStatus.idle,
      failureCount: 0,
      elapsedMs: 0,
      startedAt: null,
      events: List.unmodifiable(events),
      focusedMonth: month,
      initialMonth: month,
      remainingSeconds: CalendarQuizConfig.timeLimitSecondsFor(quizType),
      // Quiz3のクリア判定で「今日」を参照するために保持する
      quizStartTime: now,
    );
  }

  /// カレンダー上の予定リスト
  final List<CalendarEvent> events;

  /// 現在表示中の月（月の1日を保持）
  final DateTime focusedMonth;

  /// クイズ開始時の表示月（クリア判定の基準）
  final DateTime initialMonth;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// クイズ開始時刻（clock.now() で取得した今日の日付を保持）
  ///
  /// Quiz3のクリア判定「翌日への移動」で使用する。
  final DateTime quizStartTime;

  /// 指定フィールドを差し替えた新インスタンスを返す
  CalendarQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    List<CalendarEvent>? events,
    DateTime? focusedMonth,
    DateTime? initialMonth,
    int? remainingSeconds,
    DateTime? quizStartTime,
  }) {
    return CalendarQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      events: events != null ? List.unmodifiable(events) : this.events,
      focusedMonth: focusedMonth ?? this.focusedMonth,
      initialMonth: initialMonth ?? this.initialMonth,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      quizStartTime: quizStartTime ?? this.quizStartTime,
    );
  }
}
