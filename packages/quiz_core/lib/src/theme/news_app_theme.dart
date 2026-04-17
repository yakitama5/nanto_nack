import 'package:flutter/material.dart';

/// ニュース（Yahoo!ニュース風）アプリ画面のカスタムカラーを ThemeExtension として定義する。
@immutable
class NewsAppTheme extends ThemeExtension<NewsAppTheme> {
  const NewsAppTheme({
    required this.brandRed,
    required this.onBrandColor,
    required this.scaffoldBackground,
    required this.tabBarBackground,
    required this.tabBarIndicatorColor,
    required this.textPrimary,
    required this.textSecondary,
    required this.borderColor,
    required this.articleBackground,
    required this.insightIconColor,
    required this.bottomSheetBackground,
    required this.fontSizeSelectedColor,
  });

  /// Yahoo!ニュース風ブランドレッド（AppBar・アクセント）
  final Color brandRed;

  /// ブランドカラー背景上のテキスト/アイコン色
  final Color onBrandColor;

  /// Scaffold 背景色
  final Color scaffoldBackground;

  /// タブバー背景色
  final Color tabBarBackground;

  /// タブバーインジケーター色
  final Color tabBarIndicatorColor;

  /// プライマリテキスト色
  final Color textPrimary;

  /// セカンダリテキスト（アイコン・サブテキスト）色
  final Color textSecondary;

  /// 区切り線・ボーダー色
  final Color borderColor;

  /// 記事カード背景色
  final Color articleBackground;

  /// Insight 電球アイコン色
  final Color insightIconColor;

  /// ボトムシート背景色
  final Color bottomSheetBackground;

  /// 文字サイズ選択中の色
  final Color fontSizeSelectedColor;

  /// ライトテーマ用デフォルト値
  static const light = NewsAppTheme(
    brandRed: Color(0xFFBF360C),
    onBrandColor: Colors.white,
    scaffoldBackground: Color(0xFFFFFFFF),
    tabBarBackground: Color(0xFFFFFFFF),
    tabBarIndicatorColor: Color(0xFFBF360C),
    textPrimary: Color(0xFF1A1A1A),
    textSecondary: Color(0xFF757575),
    borderColor: Color(0xFFE0E0E0),
    articleBackground: Color(0xFFFFFFFF),
    insightIconColor: Color(0xFFFFD814),
    bottomSheetBackground: Color(0xFFFFFFFF),
    fontSizeSelectedColor: Color(0xFFBF360C),
  );

  /// ダークテーマ用デフォルト値
  static const dark = NewsAppTheme(
    brandRed: Color(0xFFFF8A65),
    onBrandColor: Colors.white,
    scaffoldBackground: Color(0xFF121212),
    tabBarBackground: Color(0xFF1C1C1C),
    tabBarIndicatorColor: Color(0xFFFF8A65),
    textPrimary: Color(0xFFE0E0E0),
    textSecondary: Color(0xFF9E9E9E),
    borderColor: Color(0xFF2C2C2C),
    articleBackground: Color(0xFF1E1E1E),
    insightIconColor: Color(0xFFFFD814),
    bottomSheetBackground: Color(0xFF242424),
    fontSizeSelectedColor: Color(0xFFFF8A65),
  );

  @override
  NewsAppTheme copyWith({
    Color? brandRed,
    Color? onBrandColor,
    Color? scaffoldBackground,
    Color? tabBarBackground,
    Color? tabBarIndicatorColor,
    Color? textPrimary,
    Color? textSecondary,
    Color? borderColor,
    Color? articleBackground,
    Color? insightIconColor,
    Color? bottomSheetBackground,
    Color? fontSizeSelectedColor,
  }) {
    return NewsAppTheme(
      brandRed: brandRed ?? this.brandRed,
      onBrandColor: onBrandColor ?? this.onBrandColor,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      tabBarBackground: tabBarBackground ?? this.tabBarBackground,
      tabBarIndicatorColor: tabBarIndicatorColor ?? this.tabBarIndicatorColor,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      borderColor: borderColor ?? this.borderColor,
      articleBackground: articleBackground ?? this.articleBackground,
      insightIconColor: insightIconColor ?? this.insightIconColor,
      bottomSheetBackground:
          bottomSheetBackground ?? this.bottomSheetBackground,
      fontSizeSelectedColor:
          fontSizeSelectedColor ?? this.fontSizeSelectedColor,
    );
  }

  @override
  NewsAppTheme lerp(covariant NewsAppTheme? other, double t) {
    if (other == null) return this;
    return NewsAppTheme(
      brandRed: Color.lerp(brandRed, other.brandRed, t)!,
      onBrandColor: Color.lerp(onBrandColor, other.onBrandColor, t)!,
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      tabBarBackground:
          Color.lerp(tabBarBackground, other.tabBarBackground, t)!,
      tabBarIndicatorColor:
          Color.lerp(tabBarIndicatorColor, other.tabBarIndicatorColor, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      articleBackground:
          Color.lerp(articleBackground, other.articleBackground, t)!,
      insightIconColor:
          Color.lerp(insightIconColor, other.insightIconColor, t)!,
      bottomSheetBackground:
          Color.lerp(bottomSheetBackground, other.bottomSheetBackground, t)!,
      fontSizeSelectedColor:
          Color.lerp(fontSizeSelectedColor, other.fontSizeSelectedColor, t)!,
    );
  }
}
