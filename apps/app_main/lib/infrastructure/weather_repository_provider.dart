import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/weather/weather_repository.dart';
import 'open_weather_repository.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>(
  (ref) => const OpenWeatherRepository(),
);
