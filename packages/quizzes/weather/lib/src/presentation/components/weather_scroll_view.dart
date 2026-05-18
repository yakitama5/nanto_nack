import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';

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
    this.highlightRefresh = false,
    this.highlightWednesdayForecast = false,
    this.highlightRadarMap = false,
  });

  final WeatherCity city;
  final Future<void> Function() onRefresh;
  final void Function(DateTime date) onExpandForecast;
  final VoidCallback onRadarMapTap;
  final Widget cityWidget;
  final bool highlightRefresh;
  final bool highlightWednesdayForecast;
  final bool highlightRadarMap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<WeatherAppTheme>()!;
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          if (highlightRefresh)
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: ext.highlightBorderColor, width: 2),
                borderRadius: BorderRadius.circular(8),
                color: ext.highlightBorderColor.withValues(alpha: 0.1),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_downward,
                  color: ext.highlightBorderColor,
                  size: 18,
                ),
              ),
            ),
          cityWidget,
          ...city.dailyForecasts.map(
            (forecast) => DailyForecastTile(
              forecast: forecast,
              onExpanded: () => onExpandForecast(forecast.date),
              isHighlighted:
                  highlightWednesdayForecast &&
                  forecast.date.weekday == DateTime.wednesday,
            ),
          ),
          RadarMapCard(
            onTap: onRadarMapTap,
            isHighlighted: highlightRadarMap,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
