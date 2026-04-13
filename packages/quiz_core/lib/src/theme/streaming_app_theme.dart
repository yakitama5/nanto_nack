import 'package:flutter/material.dart';

/// ストリーミング（YouTube 風）アプリ画面のカスタムカラーを ThemeExtension として定義する。
///
/// 動画プレイヤー領域は YouTube に準拠してライト・ダーク両方で黒固定。
/// 動画情報セクションとメニューはダークテーマで暗い背景に切り替わる。
@immutable
class StreamingAppTheme extends ThemeExtension<StreamingAppTheme> {
  const StreamingAppTheme({
    required this.playerBackground,
    required this.appBarBackground,
    required this.infoSectionBackground,
    required this.brandRedColor,
    required this.activeStateColor,
    required this.subtitleToggleActive,
    required this.subtitleToggleInactive,
    required this.subscribeButtonBackground,
    required this.primaryTextColor,
    required this.subTextColor,
    required this.actionButtonColor,
    required this.highlightBorderColor,
  });

  /// Scaffold・プレイヤー領域の背景色（動画プレイヤーは常に黒）
  final Color playerBackground;

  /// AppBar 背景色
  final Color appBarBackground;

  /// 動画情報セクション背景色
  final Color infoSectionBackground;

  /// YouTube ブランド赤色（シークバー・CC 下線）
  final Color brandRedColor;

  /// アクティブ状態色（保存済み・字幕 ON 等）
  final Color activeStateColor;

  /// 字幕トグル ON 時の色
  final Color subtitleToggleActive;

  /// 字幕トグル OFF 時の色
  final Color subtitleToggleInactive;

  /// 登録ボタン背景色
  final Color subscribeButtonBackground;

  /// タイトル・アクションテキストなど主要テキスト色
  final Color primaryTextColor;

  /// 視聴回数・投稿日時等のサブテキスト色
  final Color subTextColor;

  /// アクションボタン（非アクティブ時）のアイコン・テキスト色
  final Color actionButtonColor;

  /// ヒントハイライトボーダー色（黄色固定）
  final Color highlightBorderColor;

  /// ライトテーマ用デフォルト値
  static const light = StreamingAppTheme(
    playerBackground: Color(0xFF000000),
    appBarBackground: Color(0xFF212121),
    infoSectionBackground: Color(0xFFFFFFFF),
    brandRedColor: Color(0xFFFF0000),
    activeStateColor: Color(0xFF1565C0),
    subtitleToggleActive: Color(0xFF1565C0),
    subtitleToggleInactive: Color(0xFFBDBDBD),
    subscribeButtonBackground: Color(0xFF000000),
    primaryTextColor: Color(0xFF212121),
    subTextColor: Color(0xFF616161),
    actionButtonColor: Color(0xFF212121),
    highlightBorderColor: Color(0xFFFFEB3B),
  );

  /// ダークテーマ用デフォルト値
  static const dark = StreamingAppTheme(
    playerBackground: Color(0xFF000000),
    appBarBackground: Color(0xFF121212),
    infoSectionBackground: Color(0xFF1E1E1E),
    brandRedColor: Color(0xFFFF1744),
    activeStateColor: Color(0xFF64B5F6),
    subtitleToggleActive: Color(0xFF64B5F6),
    subtitleToggleInactive: Color(0xFF4A4A4A),
    subscribeButtonBackground: Color(0xFF333333),
    primaryTextColor: Color(0xFFE0E0E0),
    subTextColor: Color(0xFF9E9E9E),
    actionButtonColor: Color(0xFFE0E0E0),
    highlightBorderColor: Color(0xFFFFEB3B),
  );

  @override
  StreamingAppTheme copyWith({
    Color? playerBackground,
    Color? appBarBackground,
    Color? infoSectionBackground,
    Color? brandRedColor,
    Color? activeStateColor,
    Color? subtitleToggleActive,
    Color? subtitleToggleInactive,
    Color? subscribeButtonBackground,
    Color? primaryTextColor,
    Color? subTextColor,
    Color? actionButtonColor,
    Color? highlightBorderColor,
  }) {
    return StreamingAppTheme(
      playerBackground: playerBackground ?? this.playerBackground,
      appBarBackground: appBarBackground ?? this.appBarBackground,
      infoSectionBackground:
          infoSectionBackground ?? this.infoSectionBackground,
      brandRedColor: brandRedColor ?? this.brandRedColor,
      activeStateColor: activeStateColor ?? this.activeStateColor,
      subtitleToggleActive: subtitleToggleActive ?? this.subtitleToggleActive,
      subtitleToggleInactive:
          subtitleToggleInactive ?? this.subtitleToggleInactive,
      subscribeButtonBackground:
          subscribeButtonBackground ?? this.subscribeButtonBackground,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      subTextColor: subTextColor ?? this.subTextColor,
      actionButtonColor: actionButtonColor ?? this.actionButtonColor,
      highlightBorderColor: highlightBorderColor ?? this.highlightBorderColor,
    );
  }

  @override
  StreamingAppTheme lerp(covariant StreamingAppTheme? other, double t) {
    if (other == null) return this;
    return StreamingAppTheme(
      playerBackground: Color.lerp(playerBackground, other.playerBackground, t)!,
      appBarBackground: Color.lerp(appBarBackground, other.appBarBackground, t)!,
      infoSectionBackground:
          Color.lerp(infoSectionBackground, other.infoSectionBackground, t)!,
      brandRedColor: Color.lerp(brandRedColor, other.brandRedColor, t)!,
      activeStateColor: Color.lerp(activeStateColor, other.activeStateColor, t)!,
      subtitleToggleActive:
          Color.lerp(subtitleToggleActive, other.subtitleToggleActive, t)!,
      subtitleToggleInactive:
          Color.lerp(subtitleToggleInactive, other.subtitleToggleInactive, t)!,
      subscribeButtonBackground: Color.lerp(
        subscribeButtonBackground,
        other.subscribeButtonBackground,
        t,
      )!,
      primaryTextColor: Color.lerp(primaryTextColor, other.primaryTextColor, t)!,
      subTextColor: Color.lerp(subTextColor, other.subTextColor, t)!,
      actionButtonColor:
          Color.lerp(actionButtonColor, other.actionButtonColor, t)!,
      highlightBorderColor:
          Color.lerp(highlightBorderColor, other.highlightBorderColor, t)!,
    );
  }
}
