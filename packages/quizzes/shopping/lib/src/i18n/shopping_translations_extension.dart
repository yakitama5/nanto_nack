import 'package:flutter/widgets.dart';
import '../../i18n/strings.g.dart' as $shopping;

/// ショッピングパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : ミッションテキスト・解説など読めるべき日本語テキスト（ja ロケール固定）
/// [sq] : クイズUI用のカスタム言語テキスト（xx ロケール）
///        quiz_core の [t] / [qt] と対応する shopping 版。
extension ShoppingTranslationsExtension on BuildContext {
  /// ミッションテキスト等の読める日本語テキスト
  $shopping.Translations get s => $shopping.AppLocale.ja.translations;

  /// クイズUI用カスタム言語テキスト（常に xx ロケール）
  $shopping.Translations get sq => $shopping.AppLocale.xx.translations;

  /// 商品IDに対応するカタログ商品名を返す（xx ロケール・英語）。
  ///
  /// UnreadableText に渡すことで CustomLanguageEncoder により
  /// カスタム言語に変換される。
  String sqCatalogItemName(String itemId) {
    final catalog = sq.catalog;
    return switch (itemId) {
      'water_pura_aqua' => catalog.waterPuraAqua,
      'tea_aqua' => catalog.teaAqua,
      'coffee_craft' => catalog.coffeeCraft,
      'milk_daily' => catalog.milkDaily,
      'snack_chips' => catalog.snackChips,
      'cocoa_bar' => catalog.cocoaBar,
      'bakery_bread' => catalog.bakeryBread,
      'eggs' => catalog.eggs,
      'noodle_bowl' => catalog.noodleBowl,
      'apple' => catalog.apple,
      'banana' => catalog.banana,
      'detergent_daily_wash' => catalog.detergentDailyWash,
      'soap_wash_power' => catalog.soapWashPower,
      'dish_soap_sparkle' => catalog.dishSoapSparkle,
      'sponge' => catalog.sponge,
      'tissue_soft' => catalog.tissueSoft,
      'toilet_paper' => catalog.toiletPaper,
      'haircare_botanic_shine' => catalog.haircareBotanicShine,
      'notebook' => catalog.notebook,
      'towel' => catalog.towel,
      'water_500ml' => catalog.water500ml,
      'tea_500ml' => catalog.tea500ml,
      'coffee_500ml' => catalog.coffee500ml,
      _ => itemId,
    };
  }
}
