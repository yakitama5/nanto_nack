import 'package:flutter/material.dart';

/// 漫画アプリ画面のカスタムカラーを ThemeExtension として定義する。
@immutable
class ComicAppTheme extends ThemeExtension<ComicAppTheme> {
  const ComicAppTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.pageBackgroundColor,
    required this.overlayColor,
  });

  /// ライトテーマ用デフォルト値
  static const ComicAppTheme light = ComicAppTheme(
    primaryColor: Color(0xFFE91E63),
    secondaryColor: Color(0xFFFCE4EC),
    pageBackgroundColor: Color(0xFFFAFAFA),
    overlayColor: Color(0xCC000000),
  );

  /// ダークテーマ用デフォルト値
  static const ComicAppTheme dark = ComicAppTheme(
    primaryColor: Color(0xFFF48FB1),
    secondaryColor: Color(0xFF880E4F),
    pageBackgroundColor: Color(0xFF1A1A1A),
    overlayColor: Color(0xCC000000),
  );

  /// メインアクセントカラー（ハートボタン・プログレスバー等）
  final Color primaryColor;

  /// セカンダリカラー（背景ティント・プログレスバー背景等）
  final Color secondaryColor;

  /// ページ背景色
  final Color pageBackgroundColor;

  /// オーバーレイメニュー背景色
  final Color overlayColor;

  @override
  ComicAppTheme copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? pageBackgroundColor,
    Color? overlayColor,
  }) =>
      ComicAppTheme(
        primaryColor: primaryColor ?? this.primaryColor,
        secondaryColor: secondaryColor ?? this.secondaryColor,
        pageBackgroundColor: pageBackgroundColor ?? this.pageBackgroundColor,
        overlayColor: overlayColor ?? this.overlayColor,
      );

  @override
  ComicAppTheme lerp(covariant ComicAppTheme? other, double t) {
    if (other == null) return this;
    return ComicAppTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      pageBackgroundColor:
          Color.lerp(pageBackgroundColor, other.pageBackgroundColor, t)!,
      overlayColor: Color.lerp(overlayColor, other.overlayColor, t)!,
    );
  }
}
