import 'package:app_main/env/app_env_dev.dart';
import 'package:app_main/env/app_env_prod.dart';

/// 実行時の FLAVOR に応じて適切なキーを返すユーティリティ。
///
/// dart-define: --dart-define-from-file=dart_define/dev.json
abstract final class AppEnv {
  static const _isProd =
      String.fromEnvironment('FLAVOR', defaultValue: 'dev') == 'prod';

  static String get activeApiKey =>
      _isProd ? AppEnvProd.openWeatherApiKey : AppEnvDev.openWeatherApiKey;

  static String get activeRevenueCatApiKey =>
      _isProd ? AppEnvProd.revenueCatApiKey : AppEnvDev.revenueCatApiKey;
}
