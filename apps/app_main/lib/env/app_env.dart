import 'dart:io';

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

  /// RevenueCat の API キー。プラットフォームによって Android / iOS を使い分ける。
  ///
  /// RevenueCat は Web 非対応のため、Web では呼ばれないことを前提とする。
  static String get activeRevenueCatApiKey {
    if (_isProd) {
      return Platform.isAndroid
          ? AppEnvProd.revenueCatAndroidApiKey
          : AppEnvProd.revenueCatIosApiKey;
    } else {
      return Platform.isAndroid
          ? AppEnvDev.revenueCatAndroidApiKey
          : AppEnvDev.revenueCatIosApiKey;
    }
  }
}
