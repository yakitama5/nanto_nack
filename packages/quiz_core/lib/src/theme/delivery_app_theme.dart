import 'package:flutter/material.dart';

/// フードデリバリーアプリクイズ用のThemeExtension。
///
/// UberEats風スカーレット系カラーを使用し、
/// Presentation層でColor直接指定を避けるため、
/// ThemeExtension経由でカラーを提供する。
@immutable
class DeliveryAppTheme extends ThemeExtension<DeliveryAppTheme> {
  const DeliveryAppTheme({
    required this.scaffoldBackground,
    required this.appBarColor,
    required this.appBarTextColor,
    required this.primaryTextColor,
    required this.subTextColor,
    required this.cardBackground,
    required this.cardBorderColor,
    required this.categoryActiveColor,
    required this.categoryActiveBg,
    required this.categoryInactiveColor,
    required this.mapBackground,
    required this.mapRoadColor,
    required this.mapParkColor,
    required this.mapWaterColor,
    required this.courierSheetBackground,
    required this.cartButtonColor,
    required this.cartButtonTextColor,
    required this.highlightBorderColor,
  });

  final Color scaffoldBackground;
  final Color appBarColor;
  final Color appBarTextColor;
  final Color primaryTextColor;
  final Color subTextColor;
  final Color cardBackground;
  final Color cardBorderColor;

  /// アクティブなカテゴリのテキスト・アイコン色
  final Color categoryActiveColor;

  /// アクティブなカテゴリの背景色
  final Color categoryActiveBg;

  /// 非アクティブなカテゴリの色
  final Color categoryInactiveColor;

  /// 地図背景色
  final Color mapBackground;

  /// 地図の道路色（主要・細道共通）
  final Color mapRoadColor;

  /// 地図の公園・緑地色
  final Color mapParkColor;

  /// 地図の水域色
  final Color mapWaterColor;

  /// 配達員情報シートの背景色
  final Color courierSheetBackground;

  /// カートボタンの背景色
  final Color cartButtonColor;

  /// カートボタンのテキスト色
  final Color cartButtonTextColor;

  /// ヒント使用時のハイライトボーダー色
  final Color highlightBorderColor;

  static const light = DeliveryAppTheme(
    scaffoldBackground: Color(0xFFF8F8F8),
    appBarColor: Color(0xFFFFFFFF),
    appBarTextColor: Color(0xFF1A1A1A),
    primaryTextColor: Color(0xFF1A1A1A),
    subTextColor: Color(0xFF757575),
    cardBackground: Color(0xFFFFFFFF),
    cardBorderColor: Color(0xFFE0E0E0),
    categoryActiveColor: Color(0xFFEA1916),
    categoryActiveBg: Color(0xFFFDE8E8),
    categoryInactiveColor: Color(0xFF757575),
    mapBackground: Color(0xFFD4E4C8),
    mapRoadColor: Color(0xFFFFFFFF),
    mapParkColor: Color(0xFFB7DFB5),
    mapWaterColor: Color(0xFF90CAF9),
    courierSheetBackground: Color(0xFFFFFFFF),
    cartButtonColor: Color(0xFFEA1916),
    cartButtonTextColor: Color(0xFFFFFFFF),
    highlightBorderColor: Color(0xFFFFEB3B),
  );

  static const dark = DeliveryAppTheme(
    scaffoldBackground: Color(0xFF121212),
    appBarColor: Color(0xFF1E1E1E),
    appBarTextColor: Color(0xFFFFFFFF),
    primaryTextColor: Color(0xFFEEEEEE),
    subTextColor: Color(0xFF9E9E9E),
    cardBackground: Color(0xFF2C2C2C),
    cardBorderColor: Color(0xFF3A3A3A),
    categoryActiveColor: Color(0xFFFF6B6B),
    categoryActiveBg: Color(0xFF3D0A0A),
    categoryInactiveColor: Color(0xFF9E9E9E),
    mapBackground: Color(0xFF2A3A2A),
    mapRoadColor: Color(0xFF3A4A3A),
    mapParkColor: Color(0xFF2D5C2D),
    mapWaterColor: Color(0xFF1A3A5C),
    courierSheetBackground: Color(0xFF1E1E1E),
    cartButtonColor: Color(0xFFFF6B6B),
    cartButtonTextColor: Color(0xFFFFFFFF),
    highlightBorderColor: Color(0xFFFFEB3B),
  );

  @override
  DeliveryAppTheme copyWith({
    Color? scaffoldBackground,
    Color? appBarColor,
    Color? appBarTextColor,
    Color? primaryTextColor,
    Color? subTextColor,
    Color? cardBackground,
    Color? cardBorderColor,
    Color? categoryActiveColor,
    Color? categoryActiveBg,
    Color? categoryInactiveColor,
    Color? mapBackground,
    Color? mapRoadColor,
    Color? mapParkColor,
    Color? mapWaterColor,
    Color? courierSheetBackground,
    Color? cartButtonColor,
    Color? cartButtonTextColor,
    Color? highlightBorderColor,
  }) {
    return DeliveryAppTheme(
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      appBarColor: appBarColor ?? this.appBarColor,
      appBarTextColor: appBarTextColor ?? this.appBarTextColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      subTextColor: subTextColor ?? this.subTextColor,
      cardBackground: cardBackground ?? this.cardBackground,
      cardBorderColor: cardBorderColor ?? this.cardBorderColor,
      categoryActiveColor: categoryActiveColor ?? this.categoryActiveColor,
      categoryActiveBg: categoryActiveBg ?? this.categoryActiveBg,
      categoryInactiveColor:
          categoryInactiveColor ?? this.categoryInactiveColor,
      mapBackground: mapBackground ?? this.mapBackground,
      mapRoadColor: mapRoadColor ?? this.mapRoadColor,
      mapParkColor: mapParkColor ?? this.mapParkColor,
      mapWaterColor: mapWaterColor ?? this.mapWaterColor,
      courierSheetBackground:
          courierSheetBackground ?? this.courierSheetBackground,
      cartButtonColor: cartButtonColor ?? this.cartButtonColor,
      cartButtonTextColor: cartButtonTextColor ?? this.cartButtonTextColor,
      highlightBorderColor: highlightBorderColor ?? this.highlightBorderColor,
    );
  }

  @override
  DeliveryAppTheme lerp(covariant DeliveryAppTheme? other, double t) {
    if (other == null) return this;
    return DeliveryAppTheme(
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      appBarColor: Color.lerp(appBarColor, other.appBarColor, t)!,
      appBarTextColor: Color.lerp(appBarTextColor, other.appBarTextColor, t)!,
      primaryTextColor:
          Color.lerp(primaryTextColor, other.primaryTextColor, t)!,
      subTextColor: Color.lerp(subTextColor, other.subTextColor, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      cardBorderColor: Color.lerp(cardBorderColor, other.cardBorderColor, t)!,
      categoryActiveColor:
          Color.lerp(categoryActiveColor, other.categoryActiveColor, t)!,
      categoryActiveBg:
          Color.lerp(categoryActiveBg, other.categoryActiveBg, t)!,
      categoryInactiveColor:
          Color.lerp(categoryInactiveColor, other.categoryInactiveColor, t)!,
      mapBackground: Color.lerp(mapBackground, other.mapBackground, t)!,
      mapRoadColor: Color.lerp(mapRoadColor, other.mapRoadColor, t)!,
      mapParkColor: Color.lerp(mapParkColor, other.mapParkColor, t)!,
      mapWaterColor: Color.lerp(mapWaterColor, other.mapWaterColor, t)!,
      courierSheetBackground: Color.lerp(
        courierSheetBackground,
        other.courierSheetBackground,
        t,
      )!,
      cartButtonColor: Color.lerp(cartButtonColor, other.cartButtonColor, t)!,
      cartButtonTextColor:
          Color.lerp(cartButtonTextColor, other.cartButtonTextColor, t)!,
      highlightBorderColor:
          Color.lerp(highlightBorderColor, other.highlightBorderColor, t)!,
    );
  }
}
