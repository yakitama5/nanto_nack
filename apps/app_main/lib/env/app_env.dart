import 'package:envied/envied.dart';

part 'app_env.g.dart';

/// OpenWeather APIキーの管理クラス。
///
/// envied により難読化されたキーを保持する。
/// dart-define の FLAVOR 値で dev/prod を切り替える。
@Envied(path: '.env', obfuscate: true)
abstract final class AppEnv {
  @EnviedField(varName: 'OPEN_WEATHER_API_KEY_DEV')
  static final String openWeatherApiKeyDev = _AppEnv.openWeatherApiKeyDev;

  @EnviedField(varName: 'OPEN_WEATHER_API_KEY_PROD')
  static final String openWeatherApiKeyProd = _AppEnv.openWeatherApiKeyProd;

  /// 実行時の FLAVOR に応じて適切なキーを返す。
  /// dart-define: --dart-define-from-file=dart_define/dev.json
  static String get activeApiKey {
    const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
    return flavor == 'prod' ? openWeatherApiKeyProd : openWeatherApiKeyDev;
  }
}
