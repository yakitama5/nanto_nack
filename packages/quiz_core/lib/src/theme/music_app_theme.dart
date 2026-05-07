import 'package:flutter/material.dart';

/// 音楽プレイヤー（YouTube Music 風）アプリ画面のカスタムカラーを ThemeExtension として定義する。
@immutable
class MusicAppTheme extends ThemeExtension<MusicAppTheme> {
  const MusicAppTheme({
    required this.playerBackground,
    required this.appBarBackground,
    required this.cardBackground,
    required this.brandColor,
    required this.accentColor,
    required this.primaryTextColor,
    required this.subTextColor,
    required this.activeColor,
    required this.inactiveColor,
    required this.highlightBorderColor,
    required this.miniPlayerBackground,
  });

  /// プレイヤー背景色
  final Color playerBackground;

  /// AppBar 背景色
  final Color appBarBackground;

  /// カード背景色
  final Color cardBackground;

  /// ブランドカラー（YouTube Music 風サーモンレッド）
  final Color brandColor;

  /// アクセントカラー（ピンクパープル）
  final Color accentColor;

  /// 主要テキスト色
  final Color primaryTextColor;

  /// サブテキスト色
  final Color subTextColor;

  /// アクティブ状態色
  final Color activeColor;

  /// 非アクティブ状態色
  final Color inactiveColor;

  /// ヒントハイライトボーダー色
  final Color highlightBorderColor;

  /// ミニプレイヤー背景色
  final Color miniPlayerBackground;

  static const light = MusicAppTheme(
    playerBackground: Color(0xFF1A0533),
    appBarBackground: Color(0xFF120024),
    cardBackground: Color(0xFF2D1B47),
    brandColor: Color(0xFFFF6B6B),
    accentColor: Color(0xFFE040FB),
    primaryTextColor: Color(0xFFFFFFFF),
    subTextColor: Color(0xFFB39DDB),
    activeColor: Color(0xFFE040FB),
    inactiveColor: Color(0xFF7E57C2),
    highlightBorderColor: Color(0xFFFFEB3B),
    miniPlayerBackground: Color(0xFF2D1B47),
  );

  static const dark = MusicAppTheme(
    playerBackground: Color(0xFF0D0015),
    appBarBackground: Color(0xFF080010),
    cardBackground: Color(0xFF1A0533),
    brandColor: Color(0xFFFF6B6B),
    accentColor: Color(0xFFCE93D8),
    primaryTextColor: Color(0xFFFFFFFF),
    subTextColor: Color(0xFF9575CD),
    activeColor: Color(0xFFCE93D8),
    inactiveColor: Color(0xFF5E35B1),
    highlightBorderColor: Color(0xFFFFEB3B),
    miniPlayerBackground: Color(0xFF1A0533),
  );

  @override
  MusicAppTheme copyWith({
    Color? playerBackground,
    Color? appBarBackground,
    Color? cardBackground,
    Color? brandColor,
    Color? accentColor,
    Color? primaryTextColor,
    Color? subTextColor,
    Color? activeColor,
    Color? inactiveColor,
    Color? highlightBorderColor,
    Color? miniPlayerBackground,
  }) {
    return MusicAppTheme(
      playerBackground: playerBackground ?? this.playerBackground,
      appBarBackground: appBarBackground ?? this.appBarBackground,
      cardBackground: cardBackground ?? this.cardBackground,
      brandColor: brandColor ?? this.brandColor,
      accentColor: accentColor ?? this.accentColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      subTextColor: subTextColor ?? this.subTextColor,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      highlightBorderColor: highlightBorderColor ?? this.highlightBorderColor,
      miniPlayerBackground: miniPlayerBackground ?? this.miniPlayerBackground,
    );
  }

  @override
  MusicAppTheme lerp(covariant MusicAppTheme? other, double t) {
    if (other == null) return this;
    return MusicAppTheme(
      playerBackground:
          Color.lerp(playerBackground, other.playerBackground, t)!,
      appBarBackground:
          Color.lerp(appBarBackground, other.appBarBackground, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      brandColor: Color.lerp(brandColor, other.brandColor, t)!,
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
      primaryTextColor:
          Color.lerp(primaryTextColor, other.primaryTextColor, t)!,
      subTextColor: Color.lerp(subTextColor, other.subTextColor, t)!,
      activeColor: Color.lerp(activeColor, other.activeColor, t)!,
      inactiveColor: Color.lerp(inactiveColor, other.inactiveColor, t)!,
      highlightBorderColor:
          Color.lerp(highlightBorderColor, other.highlightBorderColor, t)!,
      miniPlayerBackground:
          Color.lerp(miniPlayerBackground, other.miniPlayerBackground, t)!,
    );
  }
}
