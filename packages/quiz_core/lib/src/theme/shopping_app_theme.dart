import 'package:flutter/material.dart';

/// ショッピング（Amazon 風）アプリ画面のカスタムカラーを ThemeExtension として定義する。
///
/// ライトテーマは現在のデザインを保持し、ダークテーマでは背景を暗くして
/// 背景色と文字色のコントラストを確保する。
@immutable
class ShoppingAppTheme extends ThemeExtension<ShoppingAppTheme> {
  const ShoppingAppTheme({
    required this.navyColor,
    required this.categoryBarBackground,
    required this.scaffoldBackground,
    required this.surfaceColor,
    required this.orangeAccent,
    required this.orangeAccentBorder,
    required this.itemImageBackground,
    required this.itemHighlightBackground,
    required this.favoriteButtonBackground,
    required this.categorySelectedText,
    required this.categoryUnselectedText,
    required this.searchIconColor,
    required this.searchBarBackground,
    required this.searchHintColor,
    required this.primaryTextColor,
    required this.subTextColor,
    required this.addToCartButtonColor,
    required this.cartButtonForeground,
    required this.amazonTealColor,
  });

  /// AppBar・ヘッダー背景色（Amazon ネイビー）
  final Color navyColor;

  /// カテゴリバー背景色
  final Color categoryBarBackground;

  /// Scaffold 背景色
  final Color scaffoldBackground;

  /// 商品カード・セクション背景色
  final Color surfaceColor;

  /// カテゴリ選択・カートボタン・ステッパー色（Amazon オレンジ）
  final Color orangeAccent;

  /// ステッパーボーダー色
  final Color orangeAccentBorder;

  /// 商品画像エリア背景色
  final Color itemImageBackground;

  /// ヒントハイライト時の商品背景色
  final Color itemHighlightBackground;

  /// お気に入りボタン背景色（半透明）
  final Color favoriteButtonBackground;

  /// カテゴリ選択中テキスト色
  final Color categorySelectedText;

  /// カテゴリ非選択テキスト色
  final Color categoryUnselectedText;

  /// 検索バーアイコン・ヒント色
  final Color searchIconColor;

  /// 検索バー入力フィールド背景色
  final Color searchBarBackground;

  /// 検索ヒントテキスト色
  final Color searchHintColor;

  /// 商品名・金額など主要テキスト色
  final Color primaryTextColor;

  /// サブテキスト色（説明文等）
  final Color subTextColor;

  /// カートへ追加ボタン色（黄色系）
  final Color addToCartButtonColor;

  /// カートボタン前景色（アイコン・テキスト）
  final Color cartButtonForeground;

  /// Amazon ティール色（「カートに追加」ボタン等）
  final Color amazonTealColor;

  /// ライトテーマ用デフォルト値
  static const light = ShoppingAppTheme(
    navyColor: Color(0xFF131921),
    categoryBarBackground: Color(0xFF232F3E),
    scaffoldBackground: Color(0xFFF3F3F3),
    surfaceColor: Color(0xFFFFFFFF),
    orangeAccent: Color(0xFFFF9900),
    orangeAccentBorder: Color(0xFFFFA41C),
    itemImageBackground: Color(0xFFF9F9F9),
    itemHighlightBackground: Color(0xFFFFF3CD),
    favoriteButtonBackground: Color(0xD9FFFFFF),
    categorySelectedText: Color(0xFF212121),
    categoryUnselectedText: Color(0xFFFFFFFF),
    searchIconColor: Color(0xFF9E9E9E),
    searchBarBackground: Color(0xFFFFFFFF),
    searchHintColor: Color(0xFF9E9E9E),
    primaryTextColor: Color(0xFF212121),
    subTextColor: Color(0xFF757575),
    addToCartButtonColor: Color(0xFFFFD814),
    cartButtonForeground: Color(0xFF212121),
    amazonTealColor: Color(0xFF007185),
  );

  /// ダークテーマ用デフォルト値
  static const dark = ShoppingAppTheme(
    navyColor: Color(0xFF0D1117),
    categoryBarBackground: Color(0xFF1A2330),
    scaffoldBackground: Color(0xFF1A1A1A),
    surfaceColor: Color(0xFF252525),
    orangeAccent: Color(0xFFFFB74D),
    orangeAccentBorder: Color(0xFFFF9900),
    itemImageBackground: Color(0xFF2A2A2A),
    itemHighlightBackground: Color(0xFF3A2E00),
    favoriteButtonBackground: Color(0xD9252525),
    categorySelectedText: Color(0xFF212121),
    categoryUnselectedText: Color(0xFFFFFFFF),
    searchIconColor: Color(0xFF757575),
    searchBarBackground: Color(0xFF333333),
    searchHintColor: Color(0xFF757575),
    primaryTextColor: Color(0xFFE0E0E0),
    subTextColor: Color(0xFF9E9E9E),
    addToCartButtonColor: Color(0xFFFFB300),
    cartButtonForeground: Color(0xFF1A1A1A),
    amazonTealColor: Color(0xFF4DD0E1),
  );

  @override
  ShoppingAppTheme copyWith({
    Color? navyColor,
    Color? categoryBarBackground,
    Color? scaffoldBackground,
    Color? surfaceColor,
    Color? orangeAccent,
    Color? orangeAccentBorder,
    Color? itemImageBackground,
    Color? itemHighlightBackground,
    Color? favoriteButtonBackground,
    Color? categorySelectedText,
    Color? categoryUnselectedText,
    Color? searchIconColor,
    Color? searchBarBackground,
    Color? searchHintColor,
    Color? primaryTextColor,
    Color? subTextColor,
    Color? addToCartButtonColor,
    Color? cartButtonForeground,
    Color? amazonTealColor,
  }) {
    return ShoppingAppTheme(
      navyColor: navyColor ?? this.navyColor,
      categoryBarBackground:
          categoryBarBackground ?? this.categoryBarBackground,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      orangeAccent: orangeAccent ?? this.orangeAccent,
      orangeAccentBorder: orangeAccentBorder ?? this.orangeAccentBorder,
      itemImageBackground: itemImageBackground ?? this.itemImageBackground,
      itemHighlightBackground:
          itemHighlightBackground ?? this.itemHighlightBackground,
      favoriteButtonBackground:
          favoriteButtonBackground ?? this.favoriteButtonBackground,
      categorySelectedText: categorySelectedText ?? this.categorySelectedText,
      categoryUnselectedText:
          categoryUnselectedText ?? this.categoryUnselectedText,
      searchIconColor: searchIconColor ?? this.searchIconColor,
      searchBarBackground: searchBarBackground ?? this.searchBarBackground,
      searchHintColor: searchHintColor ?? this.searchHintColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      subTextColor: subTextColor ?? this.subTextColor,
      addToCartButtonColor: addToCartButtonColor ?? this.addToCartButtonColor,
      cartButtonForeground: cartButtonForeground ?? this.cartButtonForeground,
      amazonTealColor: amazonTealColor ?? this.amazonTealColor,
    );
  }

  @override
  ShoppingAppTheme lerp(covariant ShoppingAppTheme? other, double t) {
    if (other == null) return this;
    return ShoppingAppTheme(
      navyColor: Color.lerp(navyColor, other.navyColor, t)!,
      categoryBarBackground:
          Color.lerp(categoryBarBackground, other.categoryBarBackground, t)!,
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      surfaceColor: Color.lerp(surfaceColor, other.surfaceColor, t)!,
      orangeAccent: Color.lerp(orangeAccent, other.orangeAccent, t)!,
      orangeAccentBorder:
          Color.lerp(orangeAccentBorder, other.orangeAccentBorder, t)!,
      itemImageBackground:
          Color.lerp(itemImageBackground, other.itemImageBackground, t)!,
      itemHighlightBackground:
          Color.lerp(itemHighlightBackground, other.itemHighlightBackground, t)!,
      favoriteButtonBackground: Color.lerp(
        favoriteButtonBackground,
        other.favoriteButtonBackground,
        t,
      )!,
      categorySelectedText:
          Color.lerp(categorySelectedText, other.categorySelectedText, t)!,
      categoryUnselectedText:
          Color.lerp(categoryUnselectedText, other.categoryUnselectedText, t)!,
      searchIconColor: Color.lerp(searchIconColor, other.searchIconColor, t)!,
      searchBarBackground:
          Color.lerp(searchBarBackground, other.searchBarBackground, t)!,
      searchHintColor: Color.lerp(searchHintColor, other.searchHintColor, t)!,
      primaryTextColor: Color.lerp(primaryTextColor, other.primaryTextColor, t)!,
      subTextColor: Color.lerp(subTextColor, other.subTextColor, t)!,
      addToCartButtonColor:
          Color.lerp(addToCartButtonColor, other.addToCartButtonColor, t)!,
      cartButtonForeground:
          Color.lerp(cartButtonForeground, other.cartButtonForeground, t)!,
      amazonTealColor: Color.lerp(amazonTealColor, other.amazonTealColor, t)!,
    );
  }
}
