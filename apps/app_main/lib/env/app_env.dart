import 'package:app_main/env/app_env_dev.dart';
import 'package:app_main/env/app_env_prod.dart';
import 'package:flutter/foundation.dart';

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
  /// Web では RevenueCat 非対応のため空文字を返す。
  /// PurchaseService.initialize 側でも空文字の場合はスキップされる。
  static String get activeRevenueCatApiKey {
    if (kIsWeb) return '';
    final isAndroid = defaultTargetPlatform == TargetPlatform.android;
    if (_isProd) {
      return isAndroid
          ? AppEnvProd.revenueCatAndroidApiKey
          : AppEnvProd.revenueCatIosApiKey;
    } else {
      return isAndroid
          ? AppEnvDev.revenueCatAndroidApiKey
          : AppEnvDev.revenueCatIosApiKey;
    }
  }
}
