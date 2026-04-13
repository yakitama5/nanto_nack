import 'package:flutter/material.dart';

/// チャット（LINE風）アプリ画面のカスタムカラーを ThemeExtension として定義する。
///
/// ライトテーマは現在のデザインを保持し、ダークテーマでは背景を暗くして
/// 背景色と文字色のコントラストを確保する。
@immutable
class ChatAppTheme extends ThemeExtension<ChatAppTheme> {
  const ChatAppTheme({
    required this.brandColor,
    required this.scaffoldBackground,
    required this.surfaceColor,
    required this.navBarBackground,
    required this.navInactiveColor,
    required this.badgeColor,
    required this.borderColor,
    required this.subTextColor,
    required this.myMessageBackground,
    required this.otherMessageBackground,
    required this.avatarBackground,
    required this.timelineAvatar1Color,
    required this.timelineAvatar2Color,
    required this.timelineAvatar3Color,
    required this.newsTagBlue,
    required this.newsTagGreen,
    required this.newsTagOrange,
    required this.newsTagPurple,
    required this.serviceIconPayColor,
    required this.serviceIconCouponColor,
    required this.serviceIconGamesColor,
    required this.serviceIconTvColor,
    required this.serviceIconMusicColor,
    required this.serviceIconNewsColor,
    required this.serviceIconDefaultColor,
  });

  /// LINE ブランドグリーン（ヘッダー背景・選択ナビアイコン・タブ下線）
  final Color brandColor;

  /// Scaffold 背景色
  final Color scaffoldBackground;

  /// カード・ナビバー・プロフィールバナー背景色
  final Color surfaceColor;

  /// ボトムナビバー背景色
  final Color navBarBackground;

  /// 非選択ナビアイコン・ラベル色
  final Color navInactiveColor;

  /// 未読バッジ背景色
  final Color badgeColor;

  /// ボーダー・区切り線色
  final Color borderColor;

  /// サブテキスト全般の色
  final Color subTextColor;

  /// 自分のメッセージバブル背景色
  final Color myMessageBackground;

  /// 相手のメッセージバブル背景色
  final Color otherMessageBackground;

  /// トーク一覧のアバター背景色
  final Color avatarBackground;

  /// タイムラインアバター色1（ピンク系）
  final Color timelineAvatar1Color;

  /// タイムラインアバター色2（ブルー系）
  final Color timelineAvatar2Color;

  /// タイムラインアバター色3（パープル系）
  final Color timelineAvatar3Color;

  /// ニュースタグ色: 青
  final Color newsTagBlue;

  /// ニュースタグ色: 緑
  final Color newsTagGreen;

  /// ニュースタグ色: オレンジ
  final Color newsTagOrange;

  /// ニュースタグ色: 紫
  final Color newsTagPurple;

  /// サービスアイコン色: 決済 (PAY)
  final Color serviceIconPayColor;

  /// サービスアイコン色: クーポン
  final Color serviceIconCouponColor;

  /// サービスアイコン色: ゲーム
  final Color serviceIconGamesColor;

  /// サービスアイコン色: TV
  final Color serviceIconTvColor;

  /// サービスアイコン色: 音楽
  final Color serviceIconMusicColor;

  /// サービスアイコン色: ニュース
  final Color serviceIconNewsColor;

  /// サービスアイコン色: デフォルト（未分類）
  final Color serviceIconDefaultColor;

  /// ライトテーマ用デフォルト値
  static const light = ChatAppTheme(
    brandColor: Color(0xFF00B900),
    scaffoldBackground: Color(0xFFF1F1F1),
    surfaceColor: Color(0xFFFFFFFF),
    navBarBackground: Color(0xFFFFFFFF),
    navInactiveColor: Color(0xFF9E9E9E),
    badgeColor: Color(0xFFFF3B30),
    borderColor: Color(0xFFE0E0E0),
    subTextColor: Color(0xFF757575),
    myMessageBackground: Color(0xFFB2FF8C),
    otherMessageBackground: Color(0xFFFFFFFF),
    avatarBackground: Color(0xFF00897B),
    timelineAvatar1Color: Color(0xFFE91E63),
    timelineAvatar2Color: Color(0xFF2196F3),
    timelineAvatar3Color: Color(0xFF9C27B0),
    newsTagBlue: Color(0xFF1976D2),
    newsTagGreen: Color(0xFF388E3C),
    newsTagOrange: Color(0xFFF57C00),
    newsTagPurple: Color(0xFF7B1FA2),
    serviceIconPayColor: Color(0xFF00B900),
    serviceIconCouponColor: Color(0xFFF57C00),
    serviceIconGamesColor: Color(0xFF7B1FA2),
    serviceIconTvColor: Color(0xFFD32F2F),
    serviceIconMusicColor: Color(0xFFC2185B),
    serviceIconNewsColor: Color(0xFF1976D2),
    serviceIconDefaultColor: Color(0xFF757575),
  );

  /// ダークテーマ用デフォルト値
  static const dark = ChatAppTheme(
    brandColor: Color(0xFF00C300),
    scaffoldBackground: Color(0xFF1A1A1A),
    surfaceColor: Color(0xFF252525),
    navBarBackground: Color(0xFF1E1E1E),
    navInactiveColor: Color(0xFF757575),
    badgeColor: Color(0xFFFF453A),
    borderColor: Color(0xFF3A3A3A),
    subTextColor: Color(0xFF9E9E9E),
    myMessageBackground: Color(0xFF1E5C1E),
    otherMessageBackground: Color(0xFF333333),
    avatarBackground: Color(0xFF00695C),
    timelineAvatar1Color: Color(0xFFC2185B),
    timelineAvatar2Color: Color(0xFF1565C0),
    timelineAvatar3Color: Color(0xFF6A1B9A),
    newsTagBlue: Color(0xFF64B5F6),
    newsTagGreen: Color(0xFF81C784),
    newsTagOrange: Color(0xFFFFB74D),
    newsTagPurple: Color(0xFFCE93D8),
    serviceIconPayColor: Color(0xFF00C300),
    serviceIconCouponColor: Color(0xFFFFB74D),
    serviceIconGamesColor: Color(0xFFCE93D8),
    serviceIconTvColor: Color(0xFFEF9A9A),
    serviceIconMusicColor: Color(0xFFF48FB1),
    serviceIconNewsColor: Color(0xFF64B5F6),
    serviceIconDefaultColor: Color(0xFF9E9E9E),
  );

  @override
  ChatAppTheme copyWith({
    Color? brandColor,
    Color? scaffoldBackground,
    Color? surfaceColor,
    Color? navBarBackground,
    Color? navInactiveColor,
    Color? badgeColor,
    Color? borderColor,
    Color? subTextColor,
    Color? myMessageBackground,
    Color? otherMessageBackground,
    Color? avatarBackground,
    Color? timelineAvatar1Color,
    Color? timelineAvatar2Color,
    Color? timelineAvatar3Color,
    Color? newsTagBlue,
    Color? newsTagGreen,
    Color? newsTagOrange,
    Color? newsTagPurple,
    Color? serviceIconPayColor,
    Color? serviceIconCouponColor,
    Color? serviceIconGamesColor,
    Color? serviceIconTvColor,
    Color? serviceIconMusicColor,
    Color? serviceIconNewsColor,
    Color? serviceIconDefaultColor,
  }) {
    return ChatAppTheme(
      brandColor: brandColor ?? this.brandColor,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      navBarBackground: navBarBackground ?? this.navBarBackground,
      navInactiveColor: navInactiveColor ?? this.navInactiveColor,
      badgeColor: badgeColor ?? this.badgeColor,
      borderColor: borderColor ?? this.borderColor,
      subTextColor: subTextColor ?? this.subTextColor,
      myMessageBackground: myMessageBackground ?? this.myMessageBackground,
      otherMessageBackground:
          otherMessageBackground ?? this.otherMessageBackground,
      avatarBackground: avatarBackground ?? this.avatarBackground,
      timelineAvatar1Color: timelineAvatar1Color ?? this.timelineAvatar1Color,
      timelineAvatar2Color: timelineAvatar2Color ?? this.timelineAvatar2Color,
      timelineAvatar3Color: timelineAvatar3Color ?? this.timelineAvatar3Color,
      newsTagBlue: newsTagBlue ?? this.newsTagBlue,
      newsTagGreen: newsTagGreen ?? this.newsTagGreen,
      newsTagOrange: newsTagOrange ?? this.newsTagOrange,
      newsTagPurple: newsTagPurple ?? this.newsTagPurple,
      serviceIconPayColor: serviceIconPayColor ?? this.serviceIconPayColor,
      serviceIconCouponColor:
          serviceIconCouponColor ?? this.serviceIconCouponColor,
      serviceIconGamesColor:
          serviceIconGamesColor ?? this.serviceIconGamesColor,
      serviceIconTvColor: serviceIconTvColor ?? this.serviceIconTvColor,
      serviceIconMusicColor:
          serviceIconMusicColor ?? this.serviceIconMusicColor,
      serviceIconNewsColor: serviceIconNewsColor ?? this.serviceIconNewsColor,
      serviceIconDefaultColor:
          serviceIconDefaultColor ?? this.serviceIconDefaultColor,
    );
  }

  @override
  ChatAppTheme lerp(covariant ChatAppTheme? other, double t) {
    if (other == null) return this;
    return ChatAppTheme(
      brandColor: Color.lerp(brandColor, other.brandColor, t)!,
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      surfaceColor: Color.lerp(surfaceColor, other.surfaceColor, t)!,
      navBarBackground: Color.lerp(navBarBackground, other.navBarBackground, t)!,
      navInactiveColor: Color.lerp(navInactiveColor, other.navInactiveColor, t)!,
      badgeColor: Color.lerp(badgeColor, other.badgeColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      subTextColor: Color.lerp(subTextColor, other.subTextColor, t)!,
      myMessageBackground:
          Color.lerp(myMessageBackground, other.myMessageBackground, t)!,
      otherMessageBackground:
          Color.lerp(otherMessageBackground, other.otherMessageBackground, t)!,
      avatarBackground: Color.lerp(avatarBackground, other.avatarBackground, t)!,
      timelineAvatar1Color:
          Color.lerp(timelineAvatar1Color, other.timelineAvatar1Color, t)!,
      timelineAvatar2Color:
          Color.lerp(timelineAvatar2Color, other.timelineAvatar2Color, t)!,
      timelineAvatar3Color:
          Color.lerp(timelineAvatar3Color, other.timelineAvatar3Color, t)!,
      newsTagBlue: Color.lerp(newsTagBlue, other.newsTagBlue, t)!,
      newsTagGreen: Color.lerp(newsTagGreen, other.newsTagGreen, t)!,
      newsTagOrange: Color.lerp(newsTagOrange, other.newsTagOrange, t)!,
      newsTagPurple: Color.lerp(newsTagPurple, other.newsTagPurple, t)!,
      serviceIconPayColor:
          Color.lerp(serviceIconPayColor, other.serviceIconPayColor, t)!,
      serviceIconCouponColor:
          Color.lerp(serviceIconCouponColor, other.serviceIconCouponColor, t)!,
      serviceIconGamesColor:
          Color.lerp(serviceIconGamesColor, other.serviceIconGamesColor, t)!,
      serviceIconTvColor:
          Color.lerp(serviceIconTvColor, other.serviceIconTvColor, t)!,
      serviceIconMusicColor:
          Color.lerp(serviceIconMusicColor, other.serviceIconMusicColor, t)!,
      serviceIconNewsColor:
          Color.lerp(serviceIconNewsColor, other.serviceIconNewsColor, t)!,
      serviceIconDefaultColor:
          Color.lerp(serviceIconDefaultColor, other.serviceIconDefaultColor, t)!,
    );
  }
}
