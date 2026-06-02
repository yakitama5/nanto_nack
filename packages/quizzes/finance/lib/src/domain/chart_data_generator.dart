import 'dart:math' as math;

import 'package:clock/clock.dart';

import 'chart_data_point.dart';
import 'chart_period.dart';

abstract final class ChartDataGenerator {
  static List<ChartDataPoint> generate(ChartPeriod period) {
    final now = clock.now();
    return switch (period) {
      ChartPeriod.oneDay => _generate(
          now: now,
          count: 288,
          interval: const Duration(minutes: 5),
          seed: 42,
          basePrice: 15000,
          amplitude: 1500,
          noiseScale: 150,
        ),
      ChartPeriod.oneWeek => _generate(
          now: now,
          count: 168,
          interval: const Duration(hours: 1),
          seed: 43,
          basePrice: 15000,
          amplitude: 2000,
          noiseScale: 200,
        ),
      ChartPeriod.oneMonth => _generate(
          now: now,
          count: 30,
          interval: const Duration(days: 1),
          seed: 44,
          basePrice: 15000,
          amplitude: 3000,
          noiseScale: 300,
        ),
      ChartPeriod.oneYear => _generate(
          now: now,
          count: 52,
          interval: const Duration(days: 7),
          seed: 45,
          basePrice: 15000,
          amplitude: 5000,
          noiseScale: 500,
        ),
    };
  }

  static List<ChartDataPoint> _generate({
    required DateTime now,
    required int count,
    required Duration interval,
    required int seed,
    required double basePrice,
    required double amplitude,
    required double noiseScale,
  }) {
    final rng = math.Random(seed);
    final points = <ChartDataPoint>[];

    for (var i = 0; i < count; i++) {
      final t = i / (count - 1);
      // Mountain shape: rises to peak at t=0.6 then falls
      final mountain = math.sin(t * math.pi) * amplitude;
      final noise = (rng.nextDouble() - 0.5) * 2 * noiseScale;
      final price = (basePrice + mountain + noise).clamp(
        basePrice * 0.5,
        basePrice * 1.8,
      );
      points.add(
        ChartDataPoint(
          timestamp: now.subtract(Duration(
            microseconds: (count - 1 - i) * interval.inMicroseconds,
          )),
          price: price,
        ),
      );
    }
    return points;
  }
}
