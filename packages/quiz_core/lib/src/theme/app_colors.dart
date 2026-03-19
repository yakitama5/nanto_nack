import 'package:flutter/material.dart';

/// NantoNack カラーパレット
abstract final class AppColors {
  static const primary = Color(0xFF6750A4);
  static const primaryContainer = Color(0xFFEADDFF);
  static const secondary = Color(0xFF625B71);
  static const secondaryContainer = Color(0xFFE8DEF8);
  static const tertiary = Color(0xFF7D5260);
  static const tertiaryContainer = Color(0xFFFFD8E4);
  static const error = Color(0xFFB3261E);
  static const surface = Color(0xFFFFFBFE);
  static const onSurface = Color(0xFF1C1B1F);

  /// クリア済み: 緑
  static const cleared = Color(0xFF4CAF50);

  /// 未解放: グレー
  static const locked = Color(0xFF9E9E9E);

  /// プレイ可能: メインカラー
  static const available = primary;
}
