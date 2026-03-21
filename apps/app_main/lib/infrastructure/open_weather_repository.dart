import 'dart:convert';

import 'package:http/http.dart' as http;

import '../domain/weather/weather_condition.dart';
import '../domain/weather/weather_info.dart';
import '../domain/weather/weather_repository.dart';
import '../env/app_env.dart';

/// OpenWeather Current Weather API の実装。
///
/// https://openweathermap.org/current
class OpenWeatherRepository implements WeatherRepository {
  const OpenWeatherRepository();

  /// 位置情報が取得できない場合のフォールバック座標（東京）。
  static const double fallbackLatitude = 35.6762;
  static const double fallbackLongitude = 139.6503;

  @override
  Future<WeatherInfo> getCurrentWeather({
    required double latitude,
    required double longitude,
  }) async {
    final uri = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'lat': latitude.toString(),
        'lon': longitude.toString(),
        'appid': AppEnv.activeApiKey,
        'units': 'metric',
        'lang': 'ja',
      },
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw OpenWeatherException(
        statusCode: response.statusCode,
        message: 'Weather API request failed',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return _parseResponse(json);
  }

  WeatherInfo _parseResponse(Map<String, dynamic> json) {
    final weatherList = json['weather'] as List<dynamic>;
    final weatherId =
        (weatherList.first as Map<String, dynamic>)['id'] as int;
    final cityName = json['name'] as String? ?? '';

    return WeatherInfo(
      condition: _parseWeatherCode(weatherId),
      cityName: cityName,
    );
  }

  /// OpenWeather の天気コードを [WeatherCondition] にマッピングする。
  ///
  /// コード仕様: https://openweathermap.org/weather-conditions
  WeatherCondition _parseWeatherCode(int code) {
    if (code == 800) return WeatherCondition.sunny;
    if (code >= 801 && code <= 804) return WeatherCondition.cloudy;
    if (code >= 600 && code < 700) return WeatherCondition.snowy;
    // 200〜599 (Thunderstorm/Drizzle/Rain) + 700〜799 (Atmosphere) → rainy
    return WeatherCondition.rainy;
  }
}

/// OpenWeather API のエラー
class OpenWeatherException implements Exception {
  const OpenWeatherException({
    required this.statusCode,
    required this.message,
  });

  final int statusCode;
  final String message;

  @override
  String toString() => 'OpenWeatherException($statusCode): $message';
}
