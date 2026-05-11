import 'hourly_forecast.dart';

class DailyForecast {
  const DailyForecast({
    required this.date,
    required this.weatherIcon,
    required this.highTemp,
    required this.lowTemp,
    required this.hourlyForecasts,
  });

  final DateTime date;
  final String weatherIcon;
  final int highTemp;
  final int lowTemp;
  final List<HourlyForecast> hourlyForecasts;

  DailyForecast copyWith({
    DateTime? date,
    String? weatherIcon,
    int? highTemp,
    int? lowTemp,
    List<HourlyForecast>? hourlyForecasts,
  }) {
    return DailyForecast(
      date: date ?? this.date,
      weatherIcon: weatherIcon ?? this.weatherIcon,
      highTemp: highTemp ?? this.highTemp,
      lowTemp: lowTemp ?? this.lowTemp,
      hourlyForecasts: hourlyForecasts ?? this.hourlyForecasts,
    );
  }
}
