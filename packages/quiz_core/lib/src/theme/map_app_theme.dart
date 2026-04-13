import 'package:flutter/material.dart';

/// マップ（Google Maps 風）アプリ画面のカスタムカラーを ThemeExtension として定義する。
///
/// ライトテーマは現在のデザインを保持し、ダークテーマでは背景を暗くして
/// 背景色と文字色のコントラストを確保する。
@immutable
class MapAppTheme extends ThemeExtension<MapAppTheme> {
  const MapAppTheme({
    required this.mapBackground,
    required this.roadColor,
    required this.roadMinorColor,
    required this.parkColor,
    required this.waterColor,
    required this.surfaceColor,
    required this.shadowColor,
    required this.iconColor,
    required this.primaryTextColor,
    required this.subTextColor,
    required this.favoriteActiveColor,
    required this.favoriteHighlightBg,
    required this.favoriteHighlightBorder,
    required this.navigationPanelBackground,
    required this.searchQueryTextColor,
    required this.searchHintColor,
  });

  /// 地図キャンバス背景・Scaffold 背景色
  final Color mapBackground;

  /// 地図の主要道路色
  final Color roadColor;

  /// 地図の細道色
  final Color roadMinorColor;

  /// 地図の公園・緑地色
  final Color parkColor;

  /// 地図の水域色
  final Color waterColor;

  /// 検索バー・FAB・パネル背景色
  final Color surfaceColor;

  /// ボックスシャドウ色
  final Color shadowColor;

  /// グレーアイコン全般の色
  final Color iconColor;

  /// 場所名など主要テキスト色
  final Color primaryTextColor;

  /// 住所・サブテキスト色
  final Color subTextColor;

  /// お気に入り済み星アイコン色
  final Color favoriteActiveColor;

  /// 星ハイライト時の背景色
  final Color favoriteHighlightBg;

  /// 星ハイライト時のボーダー色
  final Color favoriteHighlightBorder;

  /// ナビゲーションパネル背景色
  final Color navigationPanelBackground;

  /// 検索クエリ入力テキスト色
  final Color searchQueryTextColor;

  /// 検索ヒントテキスト色
  final Color searchHintColor;

  /// ライトテーマ用デフォルト値
  static const light = MapAppTheme(
    mapBackground: Color(0xFFE8F0E9),
    roadColor: Color(0xFFFFFFFF),
    roadMinorColor: Color(0xB3FFFFFF),
    parkColor: Color(0xFFB7DFB5),
    waterColor: Color(0xFF90CAF9),
    surfaceColor: Color(0xFFFFFFFF),
    shadowColor: Color(0x26000000),
    iconColor: Color(0xFF616161),
    primaryTextColor: Color(0xFF212121),
    subTextColor: Color(0xFF757575),
    favoriteActiveColor: Color(0xFFFBC02D),
    favoriteHighlightBg: Color(0xFFFFFDE7),
    favoriteHighlightBorder: Color(0xFFFDD835),
    navigationPanelBackground: Color(0xFFFFFFFF),
    searchQueryTextColor: Color(0xFF212121),
    searchHintColor: Color(0xFF9E9E9E),
  );

  /// ダークテーマ用デフォルト値
  static const dark = MapAppTheme(
    mapBackground: Color(0xFF1C2A1C),
    roadColor: Color(0xFF3A4A3A),
    roadMinorColor: Color(0x803A4A3A),
    parkColor: Color(0xFF2D5C2D),
    waterColor: Color(0xFF1A3A5C),
    surfaceColor: Color(0xFF252525),
    shadowColor: Color(0x66000000),
    iconColor: Color(0xFF9E9E9E),
    primaryTextColor: Color(0xFFE0E0E0),
    subTextColor: Color(0xFF9E9E9E),
    favoriteActiveColor: Color(0xFFFFD54F),
    favoriteHighlightBg: Color(0xFF3A3000),
    favoriteHighlightBorder: Color(0xFFFFD54F),
    navigationPanelBackground: Color(0xFF252525),
    searchQueryTextColor: Color(0xFFE0E0E0),
    searchHintColor: Color(0xFF616161),
  );

  @override
  MapAppTheme copyWith({
    Color? mapBackground,
    Color? roadColor,
    Color? roadMinorColor,
    Color? parkColor,
    Color? waterColor,
    Color? surfaceColor,
    Color? shadowColor,
    Color? iconColor,
    Color? primaryTextColor,
    Color? subTextColor,
    Color? favoriteActiveColor,
    Color? favoriteHighlightBg,
    Color? favoriteHighlightBorder,
    Color? navigationPanelBackground,
    Color? searchQueryTextColor,
    Color? searchHintColor,
  }) {
    return MapAppTheme(
      mapBackground: mapBackground ?? this.mapBackground,
      roadColor: roadColor ?? this.roadColor,
      roadMinorColor: roadMinorColor ?? this.roadMinorColor,
      parkColor: parkColor ?? this.parkColor,
      waterColor: waterColor ?? this.waterColor,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      shadowColor: shadowColor ?? this.shadowColor,
      iconColor: iconColor ?? this.iconColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      subTextColor: subTextColor ?? this.subTextColor,
      favoriteActiveColor: favoriteActiveColor ?? this.favoriteActiveColor,
      favoriteHighlightBg: favoriteHighlightBg ?? this.favoriteHighlightBg,
      favoriteHighlightBorder:
          favoriteHighlightBorder ?? this.favoriteHighlightBorder,
      navigationPanelBackground:
          navigationPanelBackground ?? this.navigationPanelBackground,
      searchQueryTextColor: searchQueryTextColor ?? this.searchQueryTextColor,
      searchHintColor: searchHintColor ?? this.searchHintColor,
    );
  }

  @override
  MapAppTheme lerp(covariant MapAppTheme? other, double t) {
    if (other == null) return this;
    return MapAppTheme(
      mapBackground: Color.lerp(mapBackground, other.mapBackground, t)!,
      roadColor: Color.lerp(roadColor, other.roadColor, t)!,
      roadMinorColor: Color.lerp(roadMinorColor, other.roadMinorColor, t)!,
      parkColor: Color.lerp(parkColor, other.parkColor, t)!,
      waterColor: Color.lerp(waterColor, other.waterColor, t)!,
      surfaceColor: Color.lerp(surfaceColor, other.surfaceColor, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      primaryTextColor: Color.lerp(primaryTextColor, other.primaryTextColor, t)!,
      subTextColor: Color.lerp(subTextColor, other.subTextColor, t)!,
      favoriteActiveColor:
          Color.lerp(favoriteActiveColor, other.favoriteActiveColor, t)!,
      favoriteHighlightBg:
          Color.lerp(favoriteHighlightBg, other.favoriteHighlightBg, t)!,
      favoriteHighlightBorder:
          Color.lerp(favoriteHighlightBorder, other.favoriteHighlightBorder, t)!,
      navigationPanelBackground: Color.lerp(
        navigationPanelBackground,
        other.navigationPanelBackground,
        t,
      )!,
      searchQueryTextColor:
          Color.lerp(searchQueryTextColor, other.searchQueryTextColor, t)!,
      searchHintColor: Color.lerp(searchHintColor, other.searchHintColor, t)!,
    );
  }
}
