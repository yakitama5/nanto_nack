import 'package:system/src/environment/app_environment.dart';
import 'package:system/src/firebase/crashlytics_service.dart';
import 'package:system/src/firebase/firebase_service.dart';
import 'package:system/src/firebase/remote_config_service.dart';
import 'package:system/src/logger/app_logger.dart';
import 'package:system/src/purchase/purchase_service.dart';

class AppInitializer {
  const AppInitializer._();

  /// アプリの初期化を行う。
  ///
  /// [revenueCatApiKey]: RevenueCat API キー。
  /// envied で管理された値を呼び出し元（main.dart）から渡すこと。
  static Future<void> initialize({required String revenueCatApiKey}) async {
    await FirebaseService.initialize(AppEnvironment.flavor);
    CrashlyticsService.setupFlutterErrorHandling();
    await RemoteConfigService.initialize();
    try {
      await PurchaseService.initialize(apiKey: revenueCatApiKey);
    } catch (e, s) {
      // IAP 初期化失敗はアプリ起動を妨げない
      appLogger.e('IAP: 初期化エラー', error: e, stackTrace: s);
    }
  }
}
