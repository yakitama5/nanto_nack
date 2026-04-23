import 'package:flutter/material.dart';

/// マッチングアプリ（Tinder風）画面のカスタムカラーを ThemeExtension として定義する。
@immutable
class MatchingAppTheme extends ThemeExtension<MatchingAppTheme> {
  const MatchingAppTheme({
    required this.brandPink,
    required this.likeColor,
    required this.nopeColor,
    required this.superLikeColor,
    required this.cardBackground,
    required this.scaffoldBackground,
    required this.appBarBackground,
    required this.appBarForeground,
    required this.indicatorActive,
    required this.indicatorInactive,
    required this.profileTextColor,
    required this.bottomAreaBackground,
  });

  /// ブランドカラー（Tinder風ピンク）
  final Color brandPink;

  /// いいね色（緑）
  final Color likeColor;

  /// スキップ色（赤）
  final Color nopeColor;

  /// 超いいね色（青）
  final Color superLikeColor;

  /// カード背景色
  final Color cardBackground;

  /// Scaffold 背景色
  final Color scaffoldBackground;

  /// AppBar 背景色
  final Color appBarBackground;

  /// AppBar 前景色（テキスト・アイコン）
  final Color appBarForeground;

  /// インジケーターアクティブ色
  final Color indicatorActive;

  /// インジケーター非アクティブ色
  final Color indicatorInactive;

  /// プロフィールテキスト色（カード上の名前など）
  final Color profileTextColor;

  /// ボタン周辺の背景（ボトムエリア）
  final Color bottomAreaBackground;

  /// ライトテーマ用デフォルト値
  static const light = MatchingAppTheme(
    brandPink: Color(0xFFE91E63),
    likeColor: Color(0xFF4CAF50),
    nopeColor: Color(0xFFF44336),
    superLikeColor: Color(0xFF2196F3),
    cardBackground: Color(0xFFF5F5F5),
    scaffoldBackground: Color(0xFFF0F0F0),
    appBarBackground: Color(0xFFFFFFFF),
    appBarForeground: Color(0xFF212121),
    indicatorActive: Color(0xFFFFFFFF),
    indicatorInactive: Color(0x88FFFFFF),
    profileTextColor: Color(0xFFFFFFFF),
    bottomAreaBackground: Color(0xFFFFFFFF),
  );

  /// ダークテーマ用デフォルト値
  static const dark = MatchingAppTheme(
    brandPink: Color(0xFFF06292),
    likeColor: Color(0xFF81C784),
    nopeColor: Color(0xFFE57373),
    superLikeColor: Color(0xFF64B5F6),
    cardBackground: Color(0xFF2C2C2C),
    scaffoldBackground: Color(0xFF1A1A1A),
    appBarBackground: Color(0xFF1C1C1C),
    appBarForeground: Color(0xFFE0E0E0),
    indicatorActive: Color(0xFFFFFFFF),
    indicatorInactive: Color(0x66FFFFFF),
    profileTextColor: Color(0xFFFFFFFF),
    bottomAreaBackground: Color(0xFF242424),
  );

  @override
  MatchingAppTheme copyWith({
    Color? brandPink,
    Color? likeColor,
    Color? nopeColor,
    Color? superLikeColor,
    Color? cardBackground,
    Color? scaffoldBackground,
    Color? appBarBackground,
    Color? appBarForeground,
    Color? indicatorActive,
    Color? indicatorInactive,
    Color? profileTextColor,
    Color? bottomAreaBackground,
  }) {
    return MatchingAppTheme(
      brandPink: brandPink ?? this.brandPink,
      likeColor: likeColor ?? this.likeColor,
      nopeColor: nopeColor ?? this.nopeColor,
      superLikeColor: superLikeColor ?? this.superLikeColor,
      cardBackground: cardBackground ?? this.cardBackground,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      appBarBackground: appBarBackground ?? this.appBarBackground,
      appBarForeground: appBarForeground ?? this.appBarForeground,
      indicatorActive: indicatorActive ?? this.indicatorActive,
      indicatorInactive: indicatorInactive ?? this.indicatorInactive,
      profileTextColor: profileTextColor ?? this.profileTextColor,
      bottomAreaBackground: bottomAreaBackground ?? this.bottomAreaBackground,
    );
  }

  @override
  MatchingAppTheme lerp(covariant MatchingAppTheme? other, double t) {
    if (other == null) return this;
    return MatchingAppTheme(
      brandPink: Color.lerp(brandPink, other.brandPink, t)!,
      likeColor: Color.lerp(likeColor, other.likeColor, t)!,
      nopeColor: Color.lerp(nopeColor, other.nopeColor, t)!,
      superLikeColor: Color.lerp(superLikeColor, other.superLikeColor, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      appBarBackground:
          Color.lerp(appBarBackground, other.appBarBackground, t)!,
      appBarForeground:
          Color.lerp(appBarForeground, other.appBarForeground, t)!,
      indicatorActive: Color.lerp(indicatorActive, other.indicatorActive, t)!,
      indicatorInactive:
          Color.lerp(indicatorInactive, other.indicatorInactive, t)!,
      profileTextColor:
          Color.lerp(profileTextColor, other.profileTextColor, t)!,
      bottomAreaBackground:
          Color.lerp(bottomAreaBackground, other.bottomAreaBackground, t)!,
    );
  }
}
