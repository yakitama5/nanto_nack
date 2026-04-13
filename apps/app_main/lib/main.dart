import 'package:app_main/app.dart';
import 'package:app_main/env/app_env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  // routerProvider が生成する RouterNotifier は起動直後に systemConfigProvider を
  // 購読するため、runApp() より前に Firebase を初期化しておく必要がある。
  // Firebase 未初期化のまま systemConfigProvider が build() を実行すると
  // FirebaseRemoteConfig.instance が [core/no-app] エラーを投げる。
  await AppInitializer.initialize(
    revenueCatApiKey: AppEnv.activeRevenueCatApiKey,
  );
  runApp(
    TranslationProvider(
      child: const ProviderScope(child: NantoNackApp()),
    ),
  );
}
