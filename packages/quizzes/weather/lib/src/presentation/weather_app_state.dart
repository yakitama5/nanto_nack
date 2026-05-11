import '../domain/entities/weather_city.dart';

class WeatherAppState {
  const WeatherAppState({
    required this.cities,
    required this.currentCityIndex,
    this.isRefreshing = false,
    this.expandedDate,
    this.isRadarMapOpened = false,
  });

  final List<WeatherCity> cities;
  final int currentCityIndex;
  final bool isRefreshing;
  final DateTime? expandedDate;
  final bool isRadarMapOpened;

  WeatherCity get currentCity => cities[currentCityIndex];

  WeatherAppState copyWith({
    List<WeatherCity>? cities,
    int? currentCityIndex,
    bool? isRefreshing,
    DateTime? expandedDate,
    bool clearExpandedDate = false,
    bool? isRadarMapOpened,
  }) {
    return WeatherAppState(
      cities: cities ?? this.cities,
      currentCityIndex: currentCityIndex ?? this.currentCityIndex,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      expandedDate:
          clearExpandedDate ? null : (expandedDate ?? this.expandedDate),
      isRadarMapOpened: isRadarMapOpened ?? this.isRadarMapOpened,
    );
  }
}
