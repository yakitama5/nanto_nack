class HourlyForecast {
  const HourlyForecast({
    required this.hour,
    required this.weatherIcon,
    required this.temp,
    required this.precipitationChance,
  });

  final int hour;
  final String weatherIcon;
  final int temp;
  final int precipitationChance;

  HourlyForecast copyWith({
    int? hour,
    String? weatherIcon,
    int? temp,
    int? precipitationChance,
  }) {
    return HourlyForecast(
      hour: hour ?? this.hour,
      weatherIcon: weatherIcon ?? this.weatherIcon,
      temp: temp ?? this.temp,
      precipitationChance: precipitationChance ?? this.precipitationChance,
    );
  }
}
