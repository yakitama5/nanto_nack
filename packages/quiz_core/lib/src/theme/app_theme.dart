import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_core/src/theme/app_colors.dart';
import 'package:quiz_core/src/theme/nanto_nack_theme_extension.dart';

/// NantoNack テーマ定義
abstract final class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.notoSansJpTextTheme(),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
      ),
      extensions: const [NantoNackThemeExtension.light],
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.notoSansJpTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
      ),
      extensions: const [NantoNackThemeExtension.dark],
    );
  }
}
