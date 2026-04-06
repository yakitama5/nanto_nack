import 'package:envied/envied.dart';

part 'app_env_prod.g.dart';

/// prod 環境の OpenWeather API キー管理クラス。
@Envied(path: 'env/.env', obfuscate: true)
abstract final class AppEnvProd {
  @EnviedField(varName: 'OPEN_WEATHER_API_KEY')
  static final String openWeatherApiKey = _AppEnvProd.openWeatherApiKey;
}
