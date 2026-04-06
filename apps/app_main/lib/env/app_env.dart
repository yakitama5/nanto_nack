import 'package:envied/envied.dart';

part 'app_env.g.dart';

/// dev 環境の OpenWeather API キー管理クラス。
@Envied(path: 'env/.env.dev', obfuscate: true)
abstract final class AppEnvDev {
  @EnviedField(varName: 'OPEN_WEATHER_API_KEY')
  static final String openWeatherApiKey = _AppEnvDev.openWeatherApiKey;
}

/// prod 環境の OpenWeather API キー管理クラス。
@Envied(path: 'env/.env', obfuscate: true)
abstract final class AppEnvProd {
  @EnviedField(varName: 'OPEN_WEATHER_API_KEY')
  static final String openWeatherApiKey = _AppEnvProd.openWeatherApiKey;
}

/// 実行時の FLAVOR に応じて適切なキーを返すユーティリティ。
///
/// dart-define: --dart-define-from-file=dart_define/dev.json
abstract final class AppEnv {
  static String get activeApiKey {
    const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
    return flavor == 'prod'
        ? AppEnvProd.openWeatherApiKey
        : AppEnvDev.openWeatherApiKey;
  }
}
