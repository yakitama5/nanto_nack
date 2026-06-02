import 'package:flutter/foundation.dart';

@immutable
class ChartDataPoint {
  const ChartDataPoint({
    required this.timestamp,
    required this.price,
  });

  final DateTime timestamp;
  final double price;
}
