import 'package:app_main/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  await AppInitializer.initialize();
  runApp(
    TranslationProvider(
      child: const ProviderScope(child: NantoNackApp()),
    ),
  );
}
