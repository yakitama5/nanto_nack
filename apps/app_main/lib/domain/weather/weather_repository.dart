import 'weather_info.dart';

/// 天気情報を取得するRepositoryの抽象定義。
abstract class WeatherRepository {
  /// 指定座標の現在の天気情報を取得する。
  ///
  /// - [latitude]: 緯度
  /// - [longitude]: 経度
  Future<WeatherInfo> getCurrentWeather({
    required double latitude,
    required double longitude,
  });
}
