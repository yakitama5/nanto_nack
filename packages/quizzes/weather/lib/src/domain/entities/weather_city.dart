import 'daily_forecast.dart';

class WeatherCity {
  WeatherCity({
    required this.id,
    required this.name,
    required this.currentTemp,
    required List<DailyForecast> dailyForecasts,
  }) : dailyForecasts = List.unmodifiable(dailyForecasts);

  final String id;
  final String name;
  final int currentTemp;
  final List<DailyForecast> dailyForecasts;

  WeatherCity copyWith({
    String? id,
    String? name,
    int? currentTemp,
    List<DailyForecast>? dailyForecasts,
  }) {
    return WeatherCity(
      id: id ?? this.id,
      name: name ?? this.name,
      currentTemp: currentTemp ?? this.currentTemp,
      dailyForecasts: dailyForecasts ?? this.dailyForecasts,
    );
  }
}
