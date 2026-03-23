import 'package:flutter/foundation.dart';

import 'weather_condition.dart';

/// 現在の天気情報エンティティ。
@immutable
class WeatherInfo {
  const WeatherInfo({
    required this.condition,
    required this.cityName,
  });

  /// 天気の状態
  final WeatherCondition condition;

  /// 取得した都市名
  final String cityName;

  WeatherInfo copyWith({
    WeatherCondition? condition,
    String? cityName,
  }) {
    return WeatherInfo(
      condition: condition ?? this.condition,
      cityName: cityName ?? this.cityName,
    );
  }
}
