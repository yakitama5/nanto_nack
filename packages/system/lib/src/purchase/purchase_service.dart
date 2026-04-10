import 'package:flutter/foundation.dart';

import '../logger/app_logger.dart';

/// アプリ内課金サービス
/// Web環境では動作しません
class PurchaseService {
  const PurchaseService._();

  static Future<void> initialize() async {
    if (kIsWeb) {
      appLogger.i('IAP: Web環境では非対応');
      return;
    }
    // TODO: in_app_purchase の初期化
  }
}
