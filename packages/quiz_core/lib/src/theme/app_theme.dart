import 'package:flutter/material.dart';
import 'package:quiz_core/src/theme/app_colors.dart';
import 'package:quiz_core/src/theme/chat_app_theme.dart';
import 'package:quiz_core/src/theme/map_app_theme.dart';
import 'package:quiz_core/src/theme/nanto_nack_theme_extension.dart';
import 'package:quiz_core/src/theme/payment_app_theme.dart';
import 'package:quiz_core/src/theme/shopping_app_theme.dart';
import 'package:quiz_core/src/theme/streaming_app_theme.dart';

/// NantoNack テーマ定義
abstract final class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'packages/quiz_core/NotoSansJP',
      fontFamilyFallback: const [
        'packages/quiz_core/NotoSansJP',
        'sans-serif',
        'Apple Color Emoji',
        'Segoe UI Emoji',
        'Noto Color Emoji',
      ],
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
      ),
      extensions: const [
        NantoNackThemeExtension.light,
        ChatAppTheme.light,
        MapAppTheme.light,
        PaymentAppTheme.light,
        ShoppingAppTheme.light,
        StreamingAppTheme.light,
      ],
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'packages/quiz_core/NotoSansJP',
      fontFamilyFallback: const [
        'packages/quiz_core/NotoSansJP',
        'sans-serif',
        'Apple Color Emoji',
        'Segoe UI Emoji',
        'Noto Color Emoji',
      ],
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
      ),
      extensions: const [
        NantoNackThemeExtension.dark,
        ChatAppTheme.dark,
        MapAppTheme.dark,
        PaymentAppTheme.dark,
        ShoppingAppTheme.dark,
        StreamingAppTheme.dark,
      ],
    );
  }
}
