import 'package:flutter/material.dart';

/// 決済（PayPay 風）アプリ画面のカスタムカラーを ThemeExtension として定義する。
///
/// ライトテーマは現在のデザインを保持し、ダークテーマでは背景を暗くして
/// 背景色と文字色のコントラストを確保する。
@immutable
class PaymentAppTheme extends ThemeExtension<PaymentAppTheme> {
  const PaymentAppTheme({
    required this.brandColor,
    required this.brandColorHighlight,
    required this.surfaceColor,
    required this.scaffoldBackground,
    required this.navInactiveColor,
    required this.navSelectedColor,
    required this.borderColor,
    required this.subTextColor,
    required this.secondaryTextColor,
    required this.primaryTextColor,
    required this.actionTileBackground,
    required this.actionTileHighlightBg,
    required this.carouselBackground,
    required this.carouselHighlightBg,
    required this.dotInactiveColor,
    required this.incomeColor,
    required this.incomeBackground,
    required this.outcomeBackground,
    required this.outcomeIconColor,
    required this.outcomeTextColor,
    required this.barcodeColor,
    required this.filterChipActiveText,
    required this.filterChipInactiveBg,
    required this.filterChipInactiveText,
    required this.pointHistoryColor,
    required this.serviceIconOrangeColor,
    required this.serviceIconPurpleColor,
    required this.accountMenuIconBlueColor,
    required this.accountMenuIconTealColor,
    required this.accountMenuIconRedColor,
  });

  /// PayPay 風赤ブランドカラー（ヘッダー背景・FAB・アクセント全般）
  final Color brandColor;

  /// FAB ハイライト時（押下）ブランドカラー
  final Color brandColorHighlight;

  /// コンテンツ背景・カード・ボトムバー色
  final Color surfaceColor;

  /// Scaffold 背景色（ポイント・アカウントタブ等）
  final Color scaffoldBackground;

  /// 非選択ナビアイコン・ラベル色
  final Color navInactiveColor;

  /// 選択中ナビアイコン・ラベル色
  final Color navSelectedColor;

  /// カルーセルボーダー・区切り線色
  final Color borderColor;

  /// サブテキスト全般の色（残高ラベル等）
  final Color subTextColor;

  /// 履歴ラベル・月ヘッダーなどの色
  final Color secondaryTextColor;

  /// 主要テキスト色
  final Color primaryTextColor;

  /// アクションタイルアイコン背景色（送金等）
  final Color actionTileBackground;

  /// アクションタイルハイライト時の背景色
  final Color actionTileHighlightBg;

  /// 支払い元カルーセル背景色
  final Color carouselBackground;

  /// カルーセルハイライト時の背景色
  final Color carouselHighlightBg;

  /// カルーセルドットインジケーター（非選択）色
  final Color dotInactiveColor;

  /// 入金（収入表示）色
  final Color incomeColor;

  /// 入金アイコン背景色
  final Color incomeBackground;

  /// 出金アイコン背景色
  final Color outcomeBackground;

  /// 出金アイコン色
  final Color outcomeIconColor;

  /// 出金テキスト色
  final Color outcomeTextColor;

  /// バーコード描画色
  final Color barcodeColor;

  /// フィルターチップ選択中テキスト色
  final Color filterChipActiveText;

  /// フィルターチップ非選択背景色
  final Color filterChipInactiveBg;

  /// フィルターチップ非選択テキスト色
  final Color filterChipInactiveText;

  /// ポイント履歴の獲得ポイント色
  final Color pointHistoryColor;

  /// サービスアイコン色: オレンジ系
  final Color serviceIconOrangeColor;

  /// サービスアイコン色: 紫系
  final Color serviceIconPurpleColor;

  /// アカウントメニューアイコン色: 青
  final Color accountMenuIconBlueColor;

  /// アカウントメニューアイコン色: ティール
  final Color accountMenuIconTealColor;

  /// アカウントメニューアイコン色: 赤
  final Color accountMenuIconRedColor;

  /// ライトテーマ用デフォルト値
  static const light = PaymentAppTheme(
    brandColor: Color(0xFFFF3B3B),
    brandColorHighlight: Color(0xFFCC0000),
    surfaceColor: Color(0xFFFFFFFF),
    scaffoldBackground: Color(0xFFF5F5F5),
    navInactiveColor: Color(0xFF9E9E9E),
    navSelectedColor: Color(0xFFFF3B3B),
    borderColor: Color(0xFFE0E0E0),
    subTextColor: Color(0xFF9E9E9E),
    secondaryTextColor: Color(0xFF757575),
    primaryTextColor: Color(0xFF212121),
    actionTileBackground: Color(0xFFF5F5F5),
    actionTileHighlightBg: Color(0xFFFFE5E5),
    carouselBackground: Color(0xFFF8F8F8),
    carouselHighlightBg: Color(0xFFFFE5E5),
    dotInactiveColor: Color(0xFFBDBDBD),
    incomeColor: Color(0xFF388E3C),
    incomeBackground: Color(0xFFE8F5E9),
    outcomeBackground: Color(0xFFF5F5F5),
    outcomeIconColor: Color(0xFF757575),
    outcomeTextColor: Color(0xFF212121),
    barcodeColor: Color(0xFF212121),
    filterChipActiveText: Color(0xFFFFFFFF),
    filterChipInactiveBg: Color(0xFFF5F5F5),
    filterChipInactiveText: Color(0xFF757575),
    pointHistoryColor: Color(0xFFFF3B3B),
    serviceIconOrangeColor: Color(0xFFF57C00),
    serviceIconPurpleColor: Color(0xFF7B1FA2),
    accountMenuIconBlueColor: Color(0xFF1976D2),
    accountMenuIconTealColor: Color(0xFF00796B),
    accountMenuIconRedColor: Color(0xFFD32F2F),
  );

  /// ダークテーマ用デフォルト値
  static const dark = PaymentAppTheme(
    brandColor: Color(0xFFFF5252),
    brandColorHighlight: Color(0xFFD32F2F),
    surfaceColor: Color(0xFF252525),
    scaffoldBackground: Color(0xFF1A1A1A),
    navInactiveColor: Color(0xFF757575),
    navSelectedColor: Color(0xFFFF5252),
    borderColor: Color(0xFF3A3A3A),
    subTextColor: Color(0xFF757575),
    secondaryTextColor: Color(0xFF9E9E9E),
    primaryTextColor: Color(0xFFE0E0E0),
    actionTileBackground: Color(0xFF333333),
    actionTileHighlightBg: Color(0xFF4A1A1A),
    carouselBackground: Color(0xFF2A2A2A),
    carouselHighlightBg: Color(0xFF4A1A1A),
    dotInactiveColor: Color(0xFF4A4A4A),
    incomeColor: Color(0xFF81C784),
    incomeBackground: Color(0xFF1B3A1E),
    outcomeBackground: Color(0xFF333333),
    outcomeIconColor: Color(0xFF9E9E9E),
    outcomeTextColor: Color(0xFFE0E0E0),
    barcodeColor: Color(0xFFE0E0E0),
    filterChipActiveText: Color(0xFFFFFFFF),
    filterChipInactiveBg: Color(0xFF333333),
    filterChipInactiveText: Color(0xFF9E9E9E),
    pointHistoryColor: Color(0xFFFF5252),
    serviceIconOrangeColor: Color(0xFFFFB74D),
    serviceIconPurpleColor: Color(0xFFCE93D8),
    accountMenuIconBlueColor: Color(0xFF64B5F6),
    accountMenuIconTealColor: Color(0xFF4DB6AC),
    accountMenuIconRedColor: Color(0xFFEF9A9A),
  );

  @override
  PaymentAppTheme copyWith({
    Color? brandColor,
    Color? brandColorHighlight,
    Color? surfaceColor,
    Color? scaffoldBackground,
    Color? navInactiveColor,
    Color? navSelectedColor,
    Color? borderColor,
    Color? subTextColor,
    Color? secondaryTextColor,
    Color? primaryTextColor,
    Color? actionTileBackground,
    Color? actionTileHighlightBg,
    Color? carouselBackground,
    Color? carouselHighlightBg,
    Color? dotInactiveColor,
    Color? incomeColor,
    Color? incomeBackground,
    Color? outcomeBackground,
    Color? outcomeIconColor,
    Color? outcomeTextColor,
    Color? barcodeColor,
    Color? filterChipActiveText,
    Color? filterChipInactiveBg,
    Color? filterChipInactiveText,
    Color? pointHistoryColor,
    Color? serviceIconOrangeColor,
    Color? serviceIconPurpleColor,
    Color? accountMenuIconBlueColor,
    Color? accountMenuIconTealColor,
    Color? accountMenuIconRedColor,
  }) {
    return PaymentAppTheme(
      brandColor: brandColor ?? this.brandColor,
      brandColorHighlight: brandColorHighlight ?? this.brandColorHighlight,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      navInactiveColor: navInactiveColor ?? this.navInactiveColor,
      navSelectedColor: navSelectedColor ?? this.navSelectedColor,
      borderColor: borderColor ?? this.borderColor,
      subTextColor: subTextColor ?? this.subTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      actionTileBackground: actionTileBackground ?? this.actionTileBackground,
      actionTileHighlightBg:
          actionTileHighlightBg ?? this.actionTileHighlightBg,
      carouselBackground: carouselBackground ?? this.carouselBackground,
      carouselHighlightBg: carouselHighlightBg ?? this.carouselHighlightBg,
      dotInactiveColor: dotInactiveColor ?? this.dotInactiveColor,
      incomeColor: incomeColor ?? this.incomeColor,
      incomeBackground: incomeBackground ?? this.incomeBackground,
      outcomeBackground: outcomeBackground ?? this.outcomeBackground,
      outcomeIconColor: outcomeIconColor ?? this.outcomeIconColor,
      outcomeTextColor: outcomeTextColor ?? this.outcomeTextColor,
      barcodeColor: barcodeColor ?? this.barcodeColor,
      filterChipActiveText: filterChipActiveText ?? this.filterChipActiveText,
      filterChipInactiveBg: filterChipInactiveBg ?? this.filterChipInactiveBg,
      filterChipInactiveText:
          filterChipInactiveText ?? this.filterChipInactiveText,
      pointHistoryColor: pointHistoryColor ?? this.pointHistoryColor,
      serviceIconOrangeColor:
          serviceIconOrangeColor ?? this.serviceIconOrangeColor,
      serviceIconPurpleColor:
          serviceIconPurpleColor ?? this.serviceIconPurpleColor,
      accountMenuIconBlueColor:
          accountMenuIconBlueColor ?? this.accountMenuIconBlueColor,
      accountMenuIconTealColor:
          accountMenuIconTealColor ?? this.accountMenuIconTealColor,
      accountMenuIconRedColor:
          accountMenuIconRedColor ?? this.accountMenuIconRedColor,
    );
  }

  @override
  PaymentAppTheme lerp(covariant PaymentAppTheme? other, double t) {
    if (other == null) return this;
    return PaymentAppTheme(
      brandColor: Color.lerp(brandColor, other.brandColor, t)!,
      brandColorHighlight:
          Color.lerp(brandColorHighlight, other.brandColorHighlight, t)!,
      surfaceColor: Color.lerp(surfaceColor, other.surfaceColor, t)!,
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      navInactiveColor: Color.lerp(navInactiveColor, other.navInactiveColor, t)!,
      navSelectedColor: Color.lerp(navSelectedColor, other.navSelectedColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      subTextColor: Color.lerp(subTextColor, other.subTextColor, t)!,
      secondaryTextColor:
          Color.lerp(secondaryTextColor, other.secondaryTextColor, t)!,
      primaryTextColor: Color.lerp(primaryTextColor, other.primaryTextColor, t)!,
      actionTileBackground:
          Color.lerp(actionTileBackground, other.actionTileBackground, t)!,
      actionTileHighlightBg:
          Color.lerp(actionTileHighlightBg, other.actionTileHighlightBg, t)!,
      carouselBackground:
          Color.lerp(carouselBackground, other.carouselBackground, t)!,
      carouselHighlightBg:
          Color.lerp(carouselHighlightBg, other.carouselHighlightBg, t)!,
      dotInactiveColor: Color.lerp(dotInactiveColor, other.dotInactiveColor, t)!,
      incomeColor: Color.lerp(incomeColor, other.incomeColor, t)!,
      incomeBackground: Color.lerp(incomeBackground, other.incomeBackground, t)!,
      outcomeBackground:
          Color.lerp(outcomeBackground, other.outcomeBackground, t)!,
      outcomeIconColor: Color.lerp(outcomeIconColor, other.outcomeIconColor, t)!,
      outcomeTextColor: Color.lerp(outcomeTextColor, other.outcomeTextColor, t)!,
      barcodeColor: Color.lerp(barcodeColor, other.barcodeColor, t)!,
      filterChipActiveText:
          Color.lerp(filterChipActiveText, other.filterChipActiveText, t)!,
      filterChipInactiveBg:
          Color.lerp(filterChipInactiveBg, other.filterChipInactiveBg, t)!,
      filterChipInactiveText:
          Color.lerp(filterChipInactiveText, other.filterChipInactiveText, t)!,
      pointHistoryColor:
          Color.lerp(pointHistoryColor, other.pointHistoryColor, t)!,
      serviceIconOrangeColor:
          Color.lerp(serviceIconOrangeColor, other.serviceIconOrangeColor, t)!,
      serviceIconPurpleColor:
          Color.lerp(serviceIconPurpleColor, other.serviceIconPurpleColor, t)!,
      accountMenuIconBlueColor: Color.lerp(
        accountMenuIconBlueColor,
        other.accountMenuIconBlueColor,
        t,
      )!,
      accountMenuIconTealColor: Color.lerp(
        accountMenuIconTealColor,
        other.accountMenuIconTealColor,
        t,
      )!,
      accountMenuIconRedColor: Color.lerp(
        accountMenuIconRedColor,
        other.accountMenuIconRedColor,
        t,
      )!,
    );
  }
}
