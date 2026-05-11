import 'package:flutter/material.dart';

import '../../domain/entities/weather_city.dart';
import 'daily_forecast_tile.dart';
import 'radar_map_card.dart';

class WeatherScrollView extends StatelessWidget {
  const WeatherScrollView({
    super.key,
    required this.city,
    required this.onRefresh,
    required this.onExpandForecast,
    required this.onRadarMapTap,
    required this.cityWidget,
  });

  final WeatherCity city;
  final Future<void> Function() onRefresh;
  final void Function(DateTime date) onExpandForecast;
  final VoidCallback onRadarMapTap;
  final Widget cityWidget;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          cityWidget,
          ...city.dailyForecasts.map(
            (forecast) => DailyForecastTile(
              forecast: forecast,
              onExpanded: () => onExpandForecast(forecast.date),
            ),
          ),
          RadarMapCard(onTap: onRadarMapTap),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
