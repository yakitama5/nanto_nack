import 'package:flutter/material.dart';

/// 株価チャートアプリクイズ用のThemeExtension。
///
/// TradingView風ダークテーマを基調としたカラー定義。
@immutable
class FinanceAppTheme extends ThemeExtension<FinanceAppTheme> {
  const FinanceAppTheme({
    required this.scaffoldBackground,
    required this.appBarBackground,
    required this.appBarTextColor,
    required this.primaryTextColor,
    required this.subTextColor,
    required this.chartLineColor,
    required this.chartGridColor,
    required this.currentPriceColor,
    required this.pricePositiveColor,
    required this.priceNegativeColor,
    required this.chipSelectedBackground,
    required this.chipSelectedTextColor,
    required this.chipUnselectedBackground,
    required this.chipUnselectedTextColor,
    required this.tooltipBackground,
    required this.tooltipTextColor,
    required this.crosshairColor,
  });

  final Color scaffoldBackground;
  final Color appBarBackground;
  final Color appBarTextColor;
  final Color primaryTextColor;
  final Color subTextColor;

  /// チャートライン色（TradingView風グリーン）
  final Color chartLineColor;

  /// グリッドライン色
  final Color chartGridColor;

  /// 現在価格表示色
  final Color currentPriceColor;

  /// 値上がり色
  final Color pricePositiveColor;

  /// 値下がり色
  final Color priceNegativeColor;

  /// 選択中の期間チップ背景
  final Color chipSelectedBackground;

  /// 選択中の期間チップテキスト
  final Color chipSelectedTextColor;

  /// 未選択の期間チップ背景
  final Color chipUnselectedBackground;

  /// 未選択の期間チップテキスト
  final Color chipUnselectedTextColor;

  /// 長押し時のツールチップ背景
  final Color tooltipBackground;

  /// 長押し時のツールチップテキスト
  final Color tooltipTextColor;

  /// クロスヘアの線色
  final Color crosshairColor;

  static const light = FinanceAppTheme(
    scaffoldBackground: Color(0xFF1A1A2E),
    appBarBackground: Color(0xFF16213E),
    appBarTextColor: Color(0xFFEEEEEE),
    primaryTextColor: Color(0xFFEEEEEE),
    subTextColor: Color(0xFF9E9E9E),
    chartLineColor: Color(0xFF00C087),
    chartGridColor: Color(0xFF2A2A4A),
    currentPriceColor: Color(0xFF00C087),
    pricePositiveColor: Color(0xFF00C087),
    priceNegativeColor: Color(0xFFFF5252),
    chipSelectedBackground: Color(0xFF00C087),
    chipSelectedTextColor: Color(0xFF1A1A2E),
    chipUnselectedBackground: Color(0xFF2A2A4A),
    chipUnselectedTextColor: Color(0xFF9E9E9E),
    tooltipBackground: Color(0xFF0F3460),
    tooltipTextColor: Color(0xFFFFFFFF),
    crosshairColor: Color(0xFF9E9E9E),
  );

  static const dark = FinanceAppTheme(
    scaffoldBackground: Color(0xFF0D0D1A),
    appBarBackground: Color(0xFF111120),
    appBarTextColor: Color(0xFFEEEEEE),
    primaryTextColor: Color(0xFFEEEEEE),
    subTextColor: Color(0xFF9E9E9E),
    chartLineColor: Color(0xFF00E396),
    chartGridColor: Color(0xFF1A1A30),
    currentPriceColor: Color(0xFF00E396),
    pricePositiveColor: Color(0xFF00E396),
    priceNegativeColor: Color(0xFFFF6B6B),
    chipSelectedBackground: Color(0xFF00E396),
    chipSelectedTextColor: Color(0xFF0D0D1A),
    chipUnselectedBackground: Color(0xFF1A1A30),
    chipUnselectedTextColor: Color(0xFF9E9E9E),
    tooltipBackground: Color(0xFF0A1628),
    tooltipTextColor: Color(0xFFFFFFFF),
    crosshairColor: Color(0xFF757575),
  );

  @override
  FinanceAppTheme copyWith({
    Color? scaffoldBackground,
    Color? appBarBackground,
    Color? appBarTextColor,
    Color? primaryTextColor,
    Color? subTextColor,
    Color? chartLineColor,
    Color? chartGridColor,
    Color? currentPriceColor,
    Color? pricePositiveColor,
    Color? priceNegativeColor,
    Color? chipSelectedBackground,
    Color? chipSelectedTextColor,
    Color? chipUnselectedBackground,
    Color? chipUnselectedTextColor,
    Color? tooltipBackground,
    Color? tooltipTextColor,
    Color? crosshairColor,
  }) {
    return FinanceAppTheme(
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      appBarBackground: appBarBackground ?? this.appBarBackground,
      appBarTextColor: appBarTextColor ?? this.appBarTextColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      subTextColor: subTextColor ?? this.subTextColor,
      chartLineColor: chartLineColor ?? this.chartLineColor,
      chartGridColor: chartGridColor ?? this.chartGridColor,
      currentPriceColor: currentPriceColor ?? this.currentPriceColor,
      pricePositiveColor: pricePositiveColor ?? this.pricePositiveColor,
      priceNegativeColor: priceNegativeColor ?? this.priceNegativeColor,
      chipSelectedBackground:
          chipSelectedBackground ?? this.chipSelectedBackground,
      chipSelectedTextColor:
          chipSelectedTextColor ?? this.chipSelectedTextColor,
      chipUnselectedBackground:
          chipUnselectedBackground ?? this.chipUnselectedBackground,
      chipUnselectedTextColor:
          chipUnselectedTextColor ?? this.chipUnselectedTextColor,
      tooltipBackground: tooltipBackground ?? this.tooltipBackground,
      tooltipTextColor: tooltipTextColor ?? this.tooltipTextColor,
      crosshairColor: crosshairColor ?? this.crosshairColor,
    );
  }

  @override
  FinanceAppTheme lerp(covariant FinanceAppTheme? other, double t) {
    if (other == null) return this;
    return FinanceAppTheme(
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      appBarBackground:
          Color.lerp(appBarBackground, other.appBarBackground, t)!,
      appBarTextColor:
          Color.lerp(appBarTextColor, other.appBarTextColor, t)!,
      primaryTextColor:
          Color.lerp(primaryTextColor, other.primaryTextColor, t)!,
      subTextColor: Color.lerp(subTextColor, other.subTextColor, t)!,
      chartLineColor: Color.lerp(chartLineColor, other.chartLineColor, t)!,
      chartGridColor: Color.lerp(chartGridColor, other.chartGridColor, t)!,
      currentPriceColor:
          Color.lerp(currentPriceColor, other.currentPriceColor, t)!,
      pricePositiveColor:
          Color.lerp(pricePositiveColor, other.pricePositiveColor, t)!,
      priceNegativeColor:
          Color.lerp(priceNegativeColor, other.priceNegativeColor, t)!,
      chipSelectedBackground: Color.lerp(
          chipSelectedBackground, other.chipSelectedBackground, t)!,
      chipSelectedTextColor: Color.lerp(
          chipSelectedTextColor, other.chipSelectedTextColor, t)!,
      chipUnselectedBackground: Color.lerp(
          chipUnselectedBackground, other.chipUnselectedBackground, t)!,
      chipUnselectedTextColor: Color.lerp(
          chipUnselectedTextColor, other.chipUnselectedTextColor, t)!,
      tooltipBackground:
          Color.lerp(tooltipBackground, other.tooltipBackground, t)!,
      tooltipTextColor:
          Color.lerp(tooltipTextColor, other.tooltipTextColor, t)!,
      crosshairColor: Color.lerp(crosshairColor, other.crosshairColor, t)!,
    );
  }
}
