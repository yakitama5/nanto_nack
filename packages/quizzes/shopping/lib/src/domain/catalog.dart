import 'package:shopping/gen/assets.gen.dart';
import 'package:shopping/src/domain/entities/shopping_category.dart';
import 'package:shopping/src/domain/entities/shopping_item.dart';

/// NantoMall の商品カタログ（20件）
///
/// 商品名・説明文はすべて slang（assets/i18n/）で管理する。
/// 各アイテムの id をキーに shopping_translations_extension.dart でルックアップする。
final List<ShoppingItem> kShoppingCatalog = [
  // ── 飲料・食品 ──────────────────────────────────────────────
  ShoppingItem(
    id: 'water_pura_aqua',
    price: 108,
    imagePath: Assets.item.waterPuraAqua.path,
    category: ShoppingCategory.food,
  ),
  ShoppingItem(
    id: 'tea_aqua',
    price: 138,
    imagePath: Assets.item.teaAqua.path,
    category: ShoppingCategory.food,
  ),
  ShoppingItem(
    id: 'coffee_craft',
    price: 298,
    imagePath: Assets.item.coffeeCraft.path,
    category: ShoppingCategory.food,
  ),
  ShoppingItem(
    id: 'milk_daily',
    price: 198,
    imagePath: Assets.item.milkDaily.path,
    category: ShoppingCategory.food,
  ),
  ShoppingItem(
    id: 'snack_chips',
    price: 148,
    imagePath: Assets.item.snackChips.path,
    category: ShoppingCategory.food,
  ),
  ShoppingItem(
    id: 'cocoa_bar',
    price: 218,
    imagePath: Assets.item.cocoaBar.path,
    category: ShoppingCategory.food,
  ),
  ShoppingItem(
    id: 'bakery_bread',
    price: 258,
    imagePath: Assets.item.bakeryBread.path,
    category: ShoppingCategory.food,
  ),
  ShoppingItem(
    id: 'eggs',
    price: 248,
    imagePath: Assets.item.eggs.path,
    category: ShoppingCategory.food,
  ),
  ShoppingItem(
    id: 'noodle_bowl',
    price: 198,
    imagePath: Assets.item.noodleBowl.path,
    category: ShoppingCategory.food,
  ),
  ShoppingItem(
    id: 'apple',
    price: 128,
    imagePath: Assets.item.apple.path,
    category: ShoppingCategory.food,
  ),
  ShoppingItem(
    id: 'banana',
    price: 198,
    imagePath: Assets.item.banana.path,
    category: ShoppingCategory.food,
  ),
  // ── 日用品（洗剤・清潔） ──────────────────────────────────────
  ShoppingItem(
    id: 'detergent_daily_wash',
    price: 348,
    imagePath: Assets.item.detergentDailyWash.path,
    category: ShoppingCategory.daily,
  ),
  ShoppingItem(
    id: 'soap_wash_power',
    price: 258,
    imagePath: Assets.item.soapWashPower.path,
    category: ShoppingCategory.daily,
  ),
  ShoppingItem(
    id: 'tissue_soft',
    price: 398,
    imagePath: Assets.item.tissueSoft.path,
    category: ShoppingCategory.daily,
  ),
  ShoppingItem(
    id: 'toilet_paper',
    price: 498,
    imagePath: Assets.item.toiletPaper.path,
    category: ShoppingCategory.daily,
  ),
  ShoppingItem(
    id: 'haircare_botanic_shine',
    price: 1280,
    imagePath: Assets.item.haircareBotanicShine.path,
    category: ShoppingCategory.daily,
  ),
  // ── キッチン ──────────────────────────────────────────────────
  ShoppingItem(
    id: 'dish_soap_sparkle',
    price: 198,
    imagePath: Assets.item.dishSoapSparkle.path,
    category: ShoppingCategory.kitchen,
  ),
  ShoppingItem(
    id: 'sponge',
    price: 148,
    imagePath: Assets.item.sponge.path,
    category: ShoppingCategory.kitchen,
  ),
  // ── ファッション・インテリア ──────────────────────────────────
  ShoppingItem(
    id: 'towel',
    price: 680,
    imagePath: Assets.item.towel.path,
    category: ShoppingCategory.fashion,
  ),
  // ── 文具・その他 ──────────────────────────────────────────────
  ShoppingItem(
    id: 'notebook',
    price: 680,
    imagePath: Assets.item.notebook.path,
    category: ShoppingCategory.electronics,
  ),
];
