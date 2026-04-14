import 'package:flutter/material.dart';

/// メール（Gmail風）アプリ画面のカスタムカラーを ThemeExtension として定義する。
@immutable
class MailAppTheme extends ThemeExtension<MailAppTheme> {
  const MailAppTheme({
    required this.brandBlue,
    required this.onBrandColor,
    required this.scaffoldBackground,
    required this.searchBarBackground,
    required this.textPrimary,
    required this.textSecondary,
    required this.subTextColor,
    required this.archiveSwipeColor,
    required this.selectedBackground,
    required this.unreadBackground,
    required this.unselectedAvatarBackground,
    required this.unselectedCheckColor,
    required this.borderColor,
    required this.drawerHeaderBackground,
    required this.insightIconColor,
  });

  /// Gmail ブランドブルー（選択モードAppBar・選択アバター・未読タイム）
  final Color brandBlue;

  /// ブランドカラー背景上のテキスト/アイコン色
  final Color onBrandColor;

  /// Scaffold 背景色
  final Color scaffoldBackground;

  /// 検索バー背景色
  final Color searchBarBackground;

  /// プライマリテキスト色
  final Color textPrimary;

  /// セカンダリテキスト（アイコン・サブテキスト）色
  final Color textSecondary;

  /// さらに薄いサブテキスト色（Insight 等）
  final Color subTextColor;

  /// アーカイブスワイプ背景色
  final Color archiveSwipeColor;

  /// 選択中メールの背景色
  final Color selectedBackground;

  /// 未読メールの背景色
  final Color unreadBackground;

  /// 未選択モード時のアバター背景色
  final Color unselectedAvatarBackground;

  /// 未選択状態のチェックアイコン色
  final Color unselectedCheckColor;

  /// 区切り線・ボーダー色
  final Color borderColor;

  /// ドロワーヘッダー背景色
  final Color drawerHeaderBackground;

  /// Insight 電球アイコン色
  final Color insightIconColor;

  /// ライトテーマ用デフォルト値
  static const light = MailAppTheme(
    brandBlue: Color(0xFF1A73E8),
    onBrandColor: Colors.white,
    scaffoldBackground: Color(0xFFFFFFFF),
    searchBarBackground: Color(0xFFF1F3F4),
    textPrimary: Color(0xFF202124),
    textSecondary: Color(0xFF5F6368),
    subTextColor: Color(0xFF757575),
    archiveSwipeColor: Color(0xFF0D9550),
    selectedBackground: Color(0xFFE8F0FE),
    unreadBackground: Color(0xFFF8F9FA),
    unselectedAvatarBackground: Color(0xFFE8EAED),
    unselectedCheckColor: Color(0xFFBDC1C6),
    borderColor: Color(0xFFE0E0E0),
    drawerHeaderBackground: Color(0xFF1A73E8),
    insightIconColor: Color(0xFFFFD814),
  );

  /// ダークテーマ用デフォルト値
  static const dark = MailAppTheme(
    brandBlue: Color(0xFF82B1FF),
    onBrandColor: Colors.white,
    scaffoldBackground: Color(0xFF1C1C1C),
    searchBarBackground: Color(0xFF2C2C2C),
    textPrimary: Color(0xFFE8EAED),
    textSecondary: Color(0xFF9AA0A6),
    subTextColor: Color(0xFF80868B),
    archiveSwipeColor: Color(0xFF137333),
    selectedBackground: Color(0xFF1A3A6B),
    unreadBackground: Color(0xFF252525),
    unselectedAvatarBackground: Color(0xFF3C4043),
    unselectedCheckColor: Color(0xFF5F6368),
    borderColor: Color(0xFF3C4043),
    drawerHeaderBackground: Color(0xFF1C3A6E),
    insightIconColor: Color(0xFFFFD814),
  );

  @override
  MailAppTheme copyWith({
    Color? brandBlue,
    Color? onBrandColor,
    Color? scaffoldBackground,
    Color? searchBarBackground,
    Color? textPrimary,
    Color? textSecondary,
    Color? subTextColor,
    Color? archiveSwipeColor,
    Color? selectedBackground,
    Color? unreadBackground,
    Color? unselectedAvatarBackground,
    Color? unselectedCheckColor,
    Color? borderColor,
    Color? drawerHeaderBackground,
    Color? insightIconColor,
  }) {
    return MailAppTheme(
      brandBlue: brandBlue ?? this.brandBlue,
      onBrandColor: onBrandColor ?? this.onBrandColor,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      searchBarBackground: searchBarBackground ?? this.searchBarBackground,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      subTextColor: subTextColor ?? this.subTextColor,
      archiveSwipeColor: archiveSwipeColor ?? this.archiveSwipeColor,
      selectedBackground: selectedBackground ?? this.selectedBackground,
      unreadBackground: unreadBackground ?? this.unreadBackground,
      unselectedAvatarBackground:
          unselectedAvatarBackground ?? this.unselectedAvatarBackground,
      unselectedCheckColor: unselectedCheckColor ?? this.unselectedCheckColor,
      borderColor: borderColor ?? this.borderColor,
      drawerHeaderBackground:
          drawerHeaderBackground ?? this.drawerHeaderBackground,
      insightIconColor: insightIconColor ?? this.insightIconColor,
    );
  }

  @override
  MailAppTheme lerp(covariant MailAppTheme? other, double t) {
    if (other == null) return this;
    return MailAppTheme(
      brandBlue: Color.lerp(brandBlue, other.brandBlue, t)!,
      onBrandColor: Color.lerp(onBrandColor, other.onBrandColor, t)!,
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      searchBarBackground:
          Color.lerp(searchBarBackground, other.searchBarBackground, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      subTextColor: Color.lerp(subTextColor, other.subTextColor, t)!,
      archiveSwipeColor:
          Color.lerp(archiveSwipeColor, other.archiveSwipeColor, t)!,
      selectedBackground:
          Color.lerp(selectedBackground, other.selectedBackground, t)!,
      unreadBackground:
          Color.lerp(unreadBackground, other.unreadBackground, t)!,
      unselectedAvatarBackground: Color.lerp(
          unselectedAvatarBackground, other.unselectedAvatarBackground, t)!,
      unselectedCheckColor:
          Color.lerp(unselectedCheckColor, other.unselectedCheckColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      drawerHeaderBackground:
          Color.lerp(drawerHeaderBackground, other.drawerHeaderBackground, t)!,
      insightIconColor:
          Color.lerp(insightIconColor, other.insightIconColor, t)!,
    );
  }
}
