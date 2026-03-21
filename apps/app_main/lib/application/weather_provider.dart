import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/weather/weather_info.dart';
import '../infrastructure/open_weather_repository.dart';
import '../infrastructure/weather_repository_provider.dart';

/// 現在の天気情報を管理するProvider。
///
/// 取得失敗時は null を返し、呼び出し元が DailyScene フォールバックを使う。
class WeatherNotifier extends AsyncNotifier<WeatherInfo?> {
  @override
  Future<WeatherInfo?> build() async {
    final repository = ref.read(weatherRepositoryProvider);
    try {
      // TODO: geolocator で実際のデバイス位置情報を取得する
      return await repository.getCurrentWeather(
        latitude: OpenWeatherRepository.defaultLatitude,
        longitude: OpenWeatherRepository.defaultLongitude,
      );
    } catch (_) {
      // 取得失敗時は null を返してフォールバック表示
      return null;
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(weatherRepositoryProvider);
      return repository.getCurrentWeather(
        latitude: OpenWeatherRepository.defaultLatitude,
        longitude: OpenWeatherRepository.defaultLongitude,
      );
    });
  }
}

final weatherProvider =
    AsyncNotifierProvider<WeatherNotifier, WeatherInfo?>(WeatherNotifier.new);
