import 'package:flutter/material.dart';

/// NantoNack 固有のカスタムカラーを ThemeExtension として定義する。
///
/// Material3 の ColorScheme に含まれない、アプリ独自の意味的カラーを管理する。
@immutable
class NantoNackThemeExtension
    extends ThemeExtension<NantoNackThemeExtension> {
  const NantoNackThemeExtension({
    required this.streakColor,
    required this.streakContainerColor,
    required this.playCountColor,
    required this.playCountContainerColor,
    required this.shoppingCategoryColor,
    required this.shoppingCategoryContainerColor,
  });

  /// 連続プレイ日数（ストリーク）のアクセントカラー
  final Color streakColor;

  /// ストリークカードの背景コンテナカラー
  final Color streakContainerColor;

  /// 残りプレイ数のアクセントカラー
  final Color playCountColor;

  /// プレイ数カードの背景コンテナカラー
  final Color playCountContainerColor;

  /// ショッピングカテゴリーのブランドカラー
  final Color shoppingCategoryColor;

  /// ショッピングカテゴリーカードの背景コンテナカラー
  final Color shoppingCategoryContainerColor;

  /// ライトテーマ用デフォルト値
  static const light = NantoNackThemeExtension(
    streakColor: Color(0xFFE65100),
    streakContainerColor: Color(0xFFFFF3E0),
    playCountColor: Color(0xFF00695C),
    playCountContainerColor: Color(0xFFE0F2F1),
    shoppingCategoryColor: Color(0xFF1565C0),
    shoppingCategoryContainerColor: Color(0xFFE3F2FD),
  );

  /// ダークテーマ用デフォルト値
  static const dark = NantoNackThemeExtension(
    streakColor: Color(0xFFFFAB40),
    streakContainerColor: Color(0xFF3E2723),
    playCountColor: Color(0xFF4DB6AC),
    playCountContainerColor: Color(0xFF1B3A38),
    shoppingCategoryColor: Color(0xFF90CAF9),
    shoppingCategoryContainerColor: Color(0xFF0D2137),
  );

  @override
  NantoNackThemeExtension copyWith({
    Color? streakColor,
    Color? streakContainerColor,
    Color? playCountColor,
    Color? playCountContainerColor,
    Color? shoppingCategoryColor,
    Color? shoppingCategoryContainerColor,
  }) {
    return NantoNackThemeExtension(
      streakColor: streakColor ?? this.streakColor,
      streakContainerColor: streakContainerColor ?? this.streakContainerColor,
      playCountColor: playCountColor ?? this.playCountColor,
      playCountContainerColor:
          playCountContainerColor ?? this.playCountContainerColor,
      shoppingCategoryColor:
          shoppingCategoryColor ?? this.shoppingCategoryColor,
      shoppingCategoryContainerColor:
          shoppingCategoryContainerColor ?? this.shoppingCategoryContainerColor,
    );
  }

  @override
  NantoNackThemeExtension lerp(
    covariant NantoNackThemeExtension? other,
    double t,
  ) {
    if (other == null) return this;
    return NantoNackThemeExtension(
      streakColor: Color.lerp(streakColor, other.streakColor, t)!,
      streakContainerColor:
          Color.lerp(streakContainerColor, other.streakContainerColor, t)!,
      playCountColor: Color.lerp(playCountColor, other.playCountColor, t)!,
      playCountContainerColor: Color.lerp(
        playCountContainerColor,
        other.playCountContainerColor,
        t,
      )!,
      shoppingCategoryColor: Color.lerp(
        shoppingCategoryColor,
        other.shoppingCategoryColor,
        t,
      )!,
      shoppingCategoryContainerColor: Color.lerp(
        shoppingCategoryContainerColor,
        other.shoppingCategoryContainerColor,
        t,
      )!,
    );
  }
}
