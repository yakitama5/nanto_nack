import 'package:envied/envied.dart';

part 'app_env_dev.g.dart';

/// dev 環境の OpenWeather API キー管理クラス。
@Envied(path: 'env/.env.dev', obfuscate: true)
abstract final class AppEnvDev {
  @EnviedField(varName: 'OPEN_WEATHER_API_KEY')
  static final String openWeatherApiKey = _AppEnvDev.openWeatherApiKey;
}
