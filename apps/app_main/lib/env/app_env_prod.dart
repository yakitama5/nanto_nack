import 'package:envied/envied.dart';

part 'app_env_prod.g.dart';

/// prod 環境の API キー管理クラス。
@Envied(path: 'env/.env', obfuscate: true)
abstract final class AppEnvProd {
  @EnviedField(varName: 'OPEN_WEATHER_API_KEY')
  static final String openWeatherApiKey = _AppEnvProd.openWeatherApiKey;

  @EnviedField(varName: 'REVENUE_CAT_API_KEY', defaultValue: '')
  static final String revenueCatApiKey = _AppEnvProd.revenueCatApiKey;
}
