import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter/material.dart';

/// カレンダーアプリの予定エンティティ（内部管理用）
///
/// cr_calendar の CalendarEventModel への変換は [toCalendarEventModel] で行う。
class CalendarEvent {
  /// コンストラクタ
  const CalendarEvent({
    required this.id,
    required this.title,
    required this.begin,
    required this.end,
    required this.color,
  });

  /// 一意のID
  final String id;

  /// 予定のタイトル
  final String title;

  /// 開始日時
  final DateTime begin;

  /// 終了日時
  final DateTime end;

  /// 表示色
  final Color color;

  /// cr_calendar の表示モデルに変換する
  CalendarEventModel toCalendarEventModel() {
    return CalendarEventModel(
      name: title,
      begin: begin,
      end: end,
      eventColor: color,
    );
  }

  /// 指定フィールドを差し替えた新インスタンスを返す
  CalendarEvent copyWith({
    String? id,
    String? title,
    DateTime? begin,
    DateTime? end,
    Color? color,
  }) {
    return CalendarEvent(
      id: id ?? this.id,
      title: title ?? this.title,
      begin: begin ?? this.begin,
      end: end ?? this.end,
      color: color ?? this.color,
    );
  }
}
