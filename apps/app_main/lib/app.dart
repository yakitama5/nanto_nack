import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:system/system.dart';

import 'application/settings/settings_notifier.dart';
import 'domain/settings/settings_state.dart';
import 'router.dart';

class NantoNackApp extends ConsumerStatefulWidget {
  const NantoNackApp({super.key});

  @override
  ConsumerState<NantoNackApp> createState() => _NantoNackAppState();
}

class _NantoNackAppState extends ConsumerState<NantoNackApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // 音声データをバックグラウンドで事前ロード（完了を待たない）。
    // クイズ正解時に再生する際、ロード済みであれば即座に再生される。
    ref.read(clearSoundProvider.future).ignore();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// フォアグラウンド復帰時に Remote Config を再取得する。
  ///
  /// 取得後に値が更新されると、Remote Config の onConfigUpdated ストリーム経由で
  /// [systemConfigProvider] が自動更新され、GoRouter の redirect が再評価される。
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    appLogger.d('[App] didChangeAppLifecycleState: $state');
    if (state == AppLifecycleState.resumed) {
      appLogger.d('[App] foregrounded → calling fetchAndActivate');
      FirebaseRemoteConfig.instance.fetchAndActivate().ignore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = TranslationProvider.of(context).flutterLocale;
    final settings = ref.watch(settingsProvider);
    final router = ref.watch(routerProvider);

    // AppThemeMode → Flutter の ThemeMode に変換
    final themeMode = switch (settings.themeMode) {
      AppThemeMode.system => ThemeMode.system,
      AppThemeMode.light => ThemeMode.light,
      AppThemeMode.dark => ThemeMode.dark,
    };

    // AppUiStyle → TargetPlatform に変換（null はシステム依存のまま）
    final targetPlatform = switch (settings.uiStyle) {
      AppUiStyle.material => TargetPlatform.android,
      AppUiStyle.cupertino => TargetPlatform.iOS,
      AppUiStyle.system => null,
    };

    return MaterialApp.router(
      title: 'NantoNack',
      theme: AppTheme.light().copyWith(platform: targetPlatform),
      darkTheme: AppTheme.dark().copyWith(platform: targetPlatform),
      themeMode: themeMode,
      locale: locale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      routerConfig: router,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: ClampingScrollWrapper.builder(context, child!),
        breakpoints: const [
          Breakpoint(start: 0, end: 450, name: MOBILE),
          Breakpoint(start: 451, end: 800, name: TABLET),
          Breakpoint(start: 801, end: 1920, name: DESKTOP),
          Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
