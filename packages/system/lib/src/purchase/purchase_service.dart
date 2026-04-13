import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../logger/app_logger.dart';

/// アプリ内課金サービス（RevenueCat）
/// Web環境では動作しません
class PurchaseService {
  const PurchaseService._();

  /// RevenueCat を初期化する。
  ///
  /// [apiKey] が空の場合は初期化をスキップする（開発環境などで未設定の場合）。
  /// Web 環境では RevenueCat は非対応のため何もしない。
  static Future<void> initialize({required String apiKey}) async {
    if (kIsWeb) {
      appLogger.i('IAP: Web環境では非対応');
      return;
    }

    if (apiKey.isEmpty) {
      appLogger.w('IAP: RevenueCat APIキーが未設定のためスキップします');
      return;
    }

    await Purchases.setLogLevel(
      kDebugMode ? LogLevel.debug : LogLevel.error,
    );

    final config = PurchasesConfiguration(apiKey);
    await Purchases.configure(config);
    appLogger.i('IAP: RevenueCat 初期化完了');
  }
}
