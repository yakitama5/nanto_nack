import 'package:clock/clock.dart';

/// 時間帯を表すEnum。
///
/// 端末の現在時刻から [fromNow] で解決する。
enum TimeOfDayPeriod {
  /// 日中（6〜17時）
  day,

  /// 夕方（17〜20時）
  evening,

  /// 夜（20〜6時）
  night;

  /// 現在時刻から時間帯を解決する。
  static TimeOfDayPeriod fromNow() {
    final hour = clock.now().hour;
    if (hour >= 6 && hour < 17) return TimeOfDayPeriod.day;
    if (hour >= 17 && hour < 20) return TimeOfDayPeriod.evening;
    return TimeOfDayPeriod.night;
  }
}
