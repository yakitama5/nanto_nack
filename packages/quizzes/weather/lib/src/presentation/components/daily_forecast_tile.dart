import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../domain/entities/daily_forecast.dart';
import '../../i18n/weather_translations_extension.dart';

class DailyForecastTile extends StatelessWidget {
  const DailyForecastTile({
    super.key,
    required this.forecast,
    required this.onExpanded,
  });

  final DailyForecast forecast;
  final VoidCallback onExpanded;

  String _weekdayLabel(BuildContext context, int weekday) {
    final w = context.sq.weekdays;
    return switch (weekday) {
      1 => w.mon,
      2 => w.tue,
      3 => w.wed,
      4 => w.thu,
      5 => w.fri,
      6 => w.sat,
      7 => w.sun,
      _ => '',
    };
  }

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<WeatherAppTheme>()!;
    final weekday = _weekdayLabel(context, forecast.date.weekday);

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        onExpansionChanged: (expanded) {
          if (expanded) {
            onExpanded();
          }
        },
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        title: Row(
          children: [
            SizedBox(
              width: 32,
              child: UnreadableText(
                weekday,
                animateOnObfuscate: false,
                style: TextStyle(
                  color: ext.primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(forecast.weatherIcon, style: const TextStyle(fontSize: 24)),
            const Spacer(),
            UnreadableText(
              '${forecast.lowTemp}°',
              animateOnObfuscate: false,
              style: TextStyle(color: ext.subTextColor, fontSize: 14),
            ),
            const SizedBox(width: 8),
            UnreadableText(
              '${forecast.highTemp}°',
              animateOnObfuscate: false,
              style: TextStyle(
                color: ext.primaryTextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        children: [
          SizedBox(
            height: 88,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: forecast.hourlyForecasts.length,
              itemBuilder: (context, index) {
                final hourly = forecast.hourlyForecasts[index];
                return Container(
                  width: 60,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: ext.cardBackground,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: ext.cardBorderColor),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UnreadableText(
                        '${hourly.hour}時',
                        animateOnObfuscate: false,
                        style: TextStyle(
                          fontSize: 10,
                          color: ext.subTextColor,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        hourly.weatherIcon,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 2),
                      UnreadableText(
                        '${hourly.temp}°',
                        animateOnObfuscate: false,
                        style: TextStyle(
                          fontSize: 12,
                          color: ext.primaryTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
