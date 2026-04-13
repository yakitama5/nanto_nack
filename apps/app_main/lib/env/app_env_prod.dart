import 'package:envied/envied.dart';

part 'app_env_prod.g.dart';

/// prod 環境の API キー管理クラス。
@Envied(path: 'env/.env', obfuscate: true)
abstract final class AppEnvProd {
  @EnviedField(varName: 'OPEN_WEATHER_API_KEY')
  static final String openWeatherApiKey = _AppEnvProd.openWeatherApiKey;

  @EnviedField(varName: 'REVENUE_CAT_ANDROID_API_KEY', defaultValue: '')
  static final String revenueCatAndroidApiKey =
      _AppEnvProd.revenueCatAndroidApiKey;

  @EnviedField(varName: 'REVENUE_CAT_IOS_API_KEY', defaultValue: '')
  static final String revenueCatIosApiKey = _AppEnvProd.revenueCatIosApiKey;
}
