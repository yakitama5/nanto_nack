import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Firebase Crashlytics のラッパーサービス
class CrashlyticsService {
  const CrashlyticsService();

  /// Flutter / Dart のエラーハンドリングを Crashlytics に接続する
  ///
  /// Firebase の初期化後、アプリ起動時に一度だけ呼び出すこと。
  /// Web プラットフォームでは Crashlytics は非対応のため何もしない。
  static void setupFlutterErrorHandling() {
    if (kIsWeb) {
      return;
    }
    // Flutter フレームワーク内のエラーを Crashlytics に転送
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    // Flutter フレームワーク外（非同期など）のエラーを Crashlytics に転送
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  /// エラーを手動で記録する
  Future<void> recordError(
    Object error,
    StackTrace? stack, {
    bool fatal = false,
  }) async {
    if (kIsWeb) {
      return;
    }
    await FirebaseCrashlytics.instance
        .recordError(error, stack, fatal: fatal);
  }

  /// Crashlytics ログメッセージを記録する
  Future<void> log(String message) async {
    if (kIsWeb) {
      return;
    }
    await FirebaseCrashlytics.instance.log(message);
  }

  /// ユーザー識別子を設定する
  Future<void> setUserId(String userId) async {
    if (kIsWeb) {
      return;
    }
    await FirebaseCrashlytics.instance.setUserIdentifier(userId);
  }
}

final crashlyticsServiceProvider = Provider<CrashlyticsService>((ref) {
  return const CrashlyticsService();
});
