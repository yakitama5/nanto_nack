import 'package:flutter/foundation.dart';

import 'time_of_day_period.dart';
import 'weather_condition.dart';

/// 天気×時間帯の組み合わせを表すキークラス。
///
/// [assetPath] でアセット画像のパスを解決する。
@immutable
class WeatherSceneKey {
  const WeatherSceneKey({
    required this.condition,
    required this.period,
  });

  final WeatherCondition condition;
  final TimeOfDayPeriod period;

  /// 対応するアセット画像のパス。
  ///
  /// 命名規則: `assets/images/weather/{condition}_{period}.png`
  /// 例: `assets/images/weather/sunny_day.png`
  String get assetPath =>
      'assets/images/weather/${condition.name}_${period.name}.png';

  @override
  bool operator ==(Object other) =>
      other is WeatherSceneKey &&
      condition == other.condition &&
      period == other.period;

  @override
  int get hashCode => Object.hash(condition, period);
}
