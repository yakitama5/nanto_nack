import 'router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:responsive_framework/responsive_framework.dart';

class NantoNackApp extends ConsumerStatefulWidget {
  const NantoNackApp({super.key});

  @override
  ConsumerState<NantoNackApp> createState() => _NantoNackAppState();
}

class _NantoNackAppState extends ConsumerState<NantoNackApp> {
  @override
  void initState() {
    super.initState();
    // 音声データをバックグラウンドで事前ロード（完了を待たない）。
    // クイズ正解時に再生する際、ロード済みであれば即座に再生される。
    ref.read(clearSoundProvider.future).ignore();
  }

  @override
  Widget build(BuildContext context) {
    final locale = TranslationProvider.of(context).flutterLocale;

    return MaterialApp.router(
      title: 'NantoNack',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      locale: locale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      routerConfig: appRouter,
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
