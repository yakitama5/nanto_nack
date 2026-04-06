import 'package:app_main/env/app_env_dev.dart';
import 'package:app_main/env/app_env_prod.dart';

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
