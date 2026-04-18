import 'package:flutter/material.dart';

/// SNS（X/Twitter 風）アプリ画面のカスタムカラーを ThemeExtension として定義する。
@immutable
class SnsAppTheme extends ThemeExtension<SnsAppTheme> {
  /// コンストラクタ
  const SnsAppTheme({
    required this.brandColor,
    required this.scaffoldBackground,
    required this.navBarBackground,
    required this.navInactiveColor,
    required this.postDividerColor,
    required this.heartColor,
    required this.subTextColor,
    required this.imageBackgroundCat,
    required this.accountSwitchBackground,
  });

  /// X/Twitter ブランドブルー
  final Color brandColor;

  /// Scaffold 背景色
  final Color scaffoldBackground;

  /// ナビゲーションバー背景色
  final Color navBarBackground;

  /// ナビゲーションバーの非アクティブアイコン色
  final Color navInactiveColor;

  /// 投稿間の区切り線色
  final Color postDividerColor;

  /// いいね済みハートの色（赤）
  final Color heartColor;

  /// @userId などのサブテキスト色
  final Color subTextColor;

  /// 猫画像の背景色
  final Color imageBackgroundCat;

  /// アカウント切り替えシート背景色
  final Color accountSwitchBackground;

  /// ライトテーマ用デフォルト値
  static const light = SnsAppTheme(
    brandColor: Color(0xFF1DA1F2),
    scaffoldBackground: Color(0xFFFFFFFF),
    navBarBackground: Color(0xFFFFFFFF),
    navInactiveColor: Color(0xFF9E9E9E),
    postDividerColor: Color(0xFFE0E0E0),
    heartColor: Color(0xFFE0245E),
    subTextColor: Color(0xFF757575),
    imageBackgroundCat: Color(0xFFFF8F00),
    accountSwitchBackground: Color(0xFFF5F8FA),
  );

  /// ダークテーマ用デフォルト値
  static const dark = SnsAppTheme(
    brandColor: Color(0xFF1DA1F2),
    scaffoldBackground: Color(0xFF15202B),
    navBarBackground: Color(0xFF15202B),
    navInactiveColor: Color(0xFF6E7680),
    postDividerColor: Color(0xFF2D3741),
    heartColor: Color(0xFFE0245E),
    subTextColor: Color(0xFF6E7680),
    imageBackgroundCat: Color(0xFFE65100),
    accountSwitchBackground: Color(0xFF1A2A38),
  );

  @override
  SnsAppTheme copyWith({
    Color? brandColor,
    Color? scaffoldBackground,
    Color? navBarBackground,
    Color? navInactiveColor,
    Color? postDividerColor,
    Color? heartColor,
    Color? subTextColor,
    Color? imageBackgroundCat,
    Color? accountSwitchBackground,
  }) {
    return SnsAppTheme(
      brandColor: brandColor ?? this.brandColor,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      navBarBackground: navBarBackground ?? this.navBarBackground,
      navInactiveColor: navInactiveColor ?? this.navInactiveColor,
      postDividerColor: postDividerColor ?? this.postDividerColor,
      heartColor: heartColor ?? this.heartColor,
      subTextColor: subTextColor ?? this.subTextColor,
      imageBackgroundCat: imageBackgroundCat ?? this.imageBackgroundCat,
      accountSwitchBackground:
          accountSwitchBackground ?? this.accountSwitchBackground,
    );
  }

  @override
  SnsAppTheme lerp(covariant SnsAppTheme? other, double t) {
    if (other == null) return this;
    return SnsAppTheme(
      brandColor: Color.lerp(brandColor, other.brandColor, t)!,
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      navBarBackground:
          Color.lerp(navBarBackground, other.navBarBackground, t)!,
      navInactiveColor:
          Color.lerp(navInactiveColor, other.navInactiveColor, t)!,
      postDividerColor:
          Color.lerp(postDividerColor, other.postDividerColor, t)!,
      heartColor: Color.lerp(heartColor, other.heartColor, t)!,
      subTextColor: Color.lerp(subTextColor, other.subTextColor, t)!,
      imageBackgroundCat:
          Color.lerp(imageBackgroundCat, other.imageBackgroundCat, t)!,
      accountSwitchBackground: Color.lerp(
        accountSwitchBackground,
        other.accountSwitchBackground,
        t,
      )!,
    );
  }
}
