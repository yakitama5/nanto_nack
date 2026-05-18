import 'package:clock/clock.dart';

import 'entities/daily_forecast.dart';
import 'entities/hourly_forecast.dart';
import 'entities/weather_city.dart';

/// モックデータを構築する。
///
/// clock.now() を使用することで、テスト時にクロックを差し替えて
/// 任意の日時でデータを生成できるようにしている（DateTime.now()は使用禁止）。
List<WeatherCity> buildMockCities() {
  final now = clock.now();
  return [
    WeatherCity(
      id: 'tokyo',
      name: '東京都',
      currentTemp: 22,
      dailyForecasts: _buildTokyoForecasts(now),
    ),
    WeatherCity(
      id: 'osaka',
      name: '大阪府',
      currentTemp: 25,
      dailyForecasts: _buildOsakaForecasts(now),
    ),
    WeatherCity(
      id: 'sapporo',
      name: '北海道（札幌）',
      currentTemp: 15,
      dailyForecasts: _buildSapporoForecasts(now),
    ),
  ];
}

/// 今日から「次の水曜日」が何日後かを計算する。
///
/// 今日が水曜の場合は7日後（翌週の水曜）とする。
/// これにより7日分の予報のどこかに必ず水曜日が含まれる。
int _wednesdayOffset(DateTime from) {
  final weekday = from.weekday;
  // DateTime.weekday: 月=1, 火=2, 水=3, 木=4, 金=5, 土=6, 日=7
  final diff = (3 - weekday + 7) % 7;
  return diff == 0 ? 7 : diff;
}

List<DailyForecast> _buildTokyoForecasts(DateTime base) {
  final wedOffset = _wednesdayOffset(base);
  return List.generate(7, (i) {
    final date = base.add(Duration(days: i + 1));
    final isWed = (i + 1) == wedOffset;
    return DailyForecast(
      date: date,
      weatherIcon: isWed ? '🌧️' : (i % 3 == 0 ? '☀️' : '⛅'),
      highTemp: 24 - i,
      lowTemp: 15 - i,
      hourlyForecasts: _buildHourlyForecasts(isRainy: isWed),
    );
  });
}

List<DailyForecast> _buildOsakaForecasts(DateTime base) {
  final wedOffset = _wednesdayOffset(base);
  return List.generate(7, (i) {
    final date = base.add(Duration(days: i + 1));
    final isWed = (i + 1) == wedOffset;
    return DailyForecast(
      date: date,
      weatherIcon: isWed ? '🌧️' : (i.isEven ? '☀️' : '⛅'),
      highTemp: 27 - i,
      lowTemp: 18 - i,
      hourlyForecasts: _buildHourlyForecasts(isRainy: isWed),
    );
  });
}

List<DailyForecast> _buildSapporoForecasts(DateTime base) {
  final wedOffset = _wednesdayOffset(base);
  return List.generate(7, (i) {
    final date = base.add(Duration(days: i + 1));
    final isWed = (i + 1) == wedOffset;
    return DailyForecast(
      date: date,
      weatherIcon: isWed ? '🌧️' : (i % 4 == 0 ? '❄️' : '⛅'),
      highTemp: 16 - i,
      lowTemp: 8 - i,
      hourlyForecasts: _buildHourlyForecasts(isRainy: isWed),
    );
  });
}

List<HourlyForecast> _buildHourlyForecasts({required bool isRainy}) {
  return List.generate(8, (i) {
    final hour = (6 + i * 3) % 24;
    return HourlyForecast(
      hour: hour,
      weatherIcon: (isRainy && i >= 3) ? '🌧️' : '⛅',
      temp: 20 + i,
      precipitationChance: isRainy && i >= 3 ? (70 + i * 5).clamp(0, 100) : 10,
    );
  });
}
