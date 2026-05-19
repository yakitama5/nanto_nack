import 'package:flutter/material.dart';

/// 天気予報アプリクイズ用のThemeExtension。
///
/// Presentation層でColor直接指定を避けるため、
/// ThemeExtension経由でカラーを提供する。
@immutable
class WeatherAppTheme extends ThemeExtension<WeatherAppTheme> {
  const WeatherAppTheme({
    required this.scaffoldBackground,
    required this.appBarColor,
    required this.appBarTextColor,
    required this.headerGradient,
    required this.primaryTextColor,
    required this.subTextColor,
    required this.cardBackground,
    required this.cardBorderColor,
    required this.radarBackground,
    required this.radarFullScreenBackground,
    required this.radarFullScreenAppBarColor,
    required this.radarFullScreenTextColor,
    required this.radarLabelBackground,
    required this.radarLabelTextColor,
    required this.radarGridColor,
    required this.radarLandColor,
    required this.radarSeaColor,
    required this.radarCloudGreen,
    required this.radarCloudYellow,
    required this.radarCloudRed,
    required this.highlightBorderColor,
  });

  final Color scaffoldBackground;
  final Color appBarColor;
  final Color appBarTextColor;
  final LinearGradient headerGradient;
  final Color primaryTextColor;
  final Color subTextColor;
  final Color cardBackground;
  final Color cardBorderColor;
  final Color radarBackground;

  /// レーダーマップ全画面の背景色
  final Color radarFullScreenBackground;

  /// レーダーマップ全画面のAppBar背景色
  final Color radarFullScreenAppBarColor;

  /// レーダーマップ全画面のテキスト・アイコン色
  final Color radarFullScreenTextColor;

  /// レーダーマップのラベル背景色
  final Color radarLabelBackground;

  /// レーダーマップのラベルテキスト色
  final Color radarLabelTextColor;

  /// レーダーマップのグリッド線色
  final Color radarGridColor;

  /// レーダーマップの陸地色
  final Color radarLandColor;

  /// レーダーマップの海色
  final Color radarSeaColor;

  /// レーダーマップの雨雲（緑）
  final Color radarCloudGreen;

  /// レーダーマップの雨雲（黄）
  final Color radarCloudYellow;

  /// レーダーマップの雨雲（赤）
  final Color radarCloudRed;

  /// ヒント使用時のハイライトボーダー色
  final Color highlightBorderColor;

  static const light = WeatherAppTheme(
    scaffoldBackground: Color(0xFFF0F4FF),
    appBarColor: Color(0xFF1565C0),
    appBarTextColor: Color(0xFFFFFFFF),
    headerGradient: LinearGradient(
      colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    primaryTextColor: Color(0xFF1A1A2E),
    subTextColor: Color(0xFF6B7280),
    cardBackground: Color(0xFFFFFFFF),
    cardBorderColor: Color(0xFFE5E7EB),
    radarBackground: Color(0xFF1A2A1A),
    radarFullScreenBackground: Color(0xFF000000),
    radarFullScreenAppBarColor: Color(0xFF000000),
    radarFullScreenTextColor: Color(0xFFFFFFFF),
    radarLabelBackground: Color(0x8A000000),
    radarLabelTextColor: Color(0xFFFFFFFF),
    radarGridColor: Color(0x26FFFFFF),
    radarLandColor: Color(0xFF2C4A2E),
    radarSeaColor: Color(0xFF1A3A5C),
    radarCloudGreen: Color(0xFF4CAF50),
    radarCloudYellow: Color(0xFFFFEB3B),
    radarCloudRed: Color(0xFFF44336),
    highlightBorderColor: Color(0xFFFFEB3B),
  );

  static const dark = WeatherAppTheme(
    scaffoldBackground: Color(0xFF0D1117),
    appBarColor: Color(0xFF0D2137),
    appBarTextColor: Color(0xFFFFFFFF),
    headerGradient: LinearGradient(
      colors: [Color(0xFF0D2137), Color(0xFF1565C0)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    primaryTextColor: Color(0xFFE8EAF6),
    subTextColor: Color(0xFF9CA3AF),
    cardBackground: Color(0xFF1E2028),
    cardBorderColor: Color(0xFF2D3748),
    radarBackground: Color(0xFF0D1A0D),
    radarFullScreenBackground: Color(0xFF000000),
    radarFullScreenAppBarColor: Color(0xFF000000),
    radarFullScreenTextColor: Color(0xFFFFFFFF),
    radarLabelBackground: Color(0x8A000000),
    radarLabelTextColor: Color(0xFFFFFFFF),
    radarGridColor: Color(0x26FFFFFF),
    radarLandColor: Color(0xFF2C4A2E),
    radarSeaColor: Color(0xFF1A3A5C),
    radarCloudGreen: Color(0xFF4CAF50),
    radarCloudYellow: Color(0xFFFFEB3B),
    radarCloudRed: Color(0xFFF44336),
    highlightBorderColor: Color(0xFFFFEB3B),
  );

  @override
  WeatherAppTheme copyWith({
    Color? scaffoldBackground,
    Color? appBarColor,
    Color? appBarTextColor,
    LinearGradient? headerGradient,
    Color? primaryTextColor,
    Color? subTextColor,
    Color? cardBackground,
    Color? cardBorderColor,
    Color? radarBackground,
    Color? radarFullScreenBackground,
    Color? radarFullScreenAppBarColor,
    Color? radarFullScreenTextColor,
    Color? radarLabelBackground,
    Color? radarLabelTextColor,
    Color? radarGridColor,
    Color? radarLandColor,
    Color? radarSeaColor,
    Color? radarCloudGreen,
    Color? radarCloudYellow,
    Color? radarCloudRed,
    Color? highlightBorderColor,
  }) {
    return WeatherAppTheme(
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      appBarColor: appBarColor ?? this.appBarColor,
      appBarTextColor: appBarTextColor ?? this.appBarTextColor,
      headerGradient: headerGradient ?? this.headerGradient,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      subTextColor: subTextColor ?? this.subTextColor,
      cardBackground: cardBackground ?? this.cardBackground,
      cardBorderColor: cardBorderColor ?? this.cardBorderColor,
      radarBackground: radarBackground ?? this.radarBackground,
      radarFullScreenBackground:
          radarFullScreenBackground ?? this.radarFullScreenBackground,
      radarFullScreenAppBarColor:
          radarFullScreenAppBarColor ?? this.radarFullScreenAppBarColor,
      radarFullScreenTextColor:
          radarFullScreenTextColor ?? this.radarFullScreenTextColor,
      radarLabelBackground: radarLabelBackground ?? this.radarLabelBackground,
      radarLabelTextColor: radarLabelTextColor ?? this.radarLabelTextColor,
      radarGridColor: radarGridColor ?? this.radarGridColor,
      radarLandColor: radarLandColor ?? this.radarLandColor,
      radarSeaColor: radarSeaColor ?? this.radarSeaColor,
      radarCloudGreen: radarCloudGreen ?? this.radarCloudGreen,
      radarCloudYellow: radarCloudYellow ?? this.radarCloudYellow,
      radarCloudRed: radarCloudRed ?? this.radarCloudRed,
      highlightBorderColor: highlightBorderColor ?? this.highlightBorderColor,
    );
  }

  @override
  WeatherAppTheme lerp(covariant WeatherAppTheme? other, double t) {
    if (other == null) return this;
    return WeatherAppTheme(
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      appBarColor: Color.lerp(appBarColor, other.appBarColor, t)!,
      appBarTextColor: Color.lerp(appBarTextColor, other.appBarTextColor, t)!,
      headerGradient:
          LinearGradient.lerp(headerGradient, other.headerGradient, t)!,
      primaryTextColor:
          Color.lerp(primaryTextColor, other.primaryTextColor, t)!,
      subTextColor: Color.lerp(subTextColor, other.subTextColor, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      cardBorderColor: Color.lerp(cardBorderColor, other.cardBorderColor, t)!,
      radarBackground: Color.lerp(radarBackground, other.radarBackground, t)!,
      radarFullScreenBackground: Color.lerp(
        radarFullScreenBackground,
        other.radarFullScreenBackground,
        t,
      )!,
      radarFullScreenAppBarColor: Color.lerp(
        radarFullScreenAppBarColor,
        other.radarFullScreenAppBarColor,
        t,
      )!,
      radarFullScreenTextColor: Color.lerp(
        radarFullScreenTextColor,
        other.radarFullScreenTextColor,
        t,
      )!,
      radarLabelBackground:
          Color.lerp(radarLabelBackground, other.radarLabelBackground, t)!,
      radarLabelTextColor:
          Color.lerp(radarLabelTextColor, other.radarLabelTextColor, t)!,
      radarGridColor: Color.lerp(radarGridColor, other.radarGridColor, t)!,
      radarLandColor: Color.lerp(radarLandColor, other.radarLandColor, t)!,
      radarSeaColor: Color.lerp(radarSeaColor, other.radarSeaColor, t)!,
      radarCloudGreen: Color.lerp(radarCloudGreen, other.radarCloudGreen, t)!,
      radarCloudYellow:
          Color.lerp(radarCloudYellow, other.radarCloudYellow, t)!,
      radarCloudRed: Color.lerp(radarCloudRed, other.radarCloudRed, t)!,
      highlightBorderColor:
          Color.lerp(highlightBorderColor, other.highlightBorderColor, t)!,
    );
  }
}
