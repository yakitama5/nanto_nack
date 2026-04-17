import 'package:flutter/widgets.dart';

import '../../i18n/strings.g.dart' as $calendar;

final _cachedCalendarJa = $calendar.AppLocale.ja.buildSync();
final _cachedCalendarXx = $calendar.AppLocale.xx.buildSync();

/// calendarパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : ミッションテキスト・解説など読めるべき日本語テキスト（ja ロケール固定）
/// [sq] : クイズUI用のカスタム言語テキスト（xx ロケール）
extension CalendarTranslationsExtension on BuildContext {
  /// ミッションテキスト等の読める日本語テキスト
  $calendar.Translations get s => _cachedCalendarJa;

  /// クイズUI用カスタム言語テキスト（常に xx ロケール）
  $calendar.Translations get sq => _cachedCalendarXx;
}
