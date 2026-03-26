import 'package:shopping/gen/assets.gen.dart';
import 'package:shopping/src/domain/entities/shopping_item.dart';

/// NantoMall の商品カタログ（20件）
final List<ShoppingItem> kShoppingCatalog = [
  // ── 飲料 ──────────────────────────────────────────────────────
  ShoppingItem(
    id: 'water_pura_aqua',
    name: '天然水 500ml',
    price: 108,
    description: '国産天然水。まろやかな口当たり。',
    imagePath: Assets.item.waterPuraAqua.path,
  ),
  ShoppingItem(
    id: 'tea_aqua',
    name: '緑茶 500ml',
    price: 138,
    description: '国産茶葉100%使用。すっきりとした後味。',
    imagePath: Assets.item.teaAqua.path,
  ),
  ShoppingItem(
    id: 'coffee_craft',
    name: 'クラフトコーヒー',
    price: 298,
    description: '深煎りブレンド。濃厚なコクとまろやかな苦み。',
    imagePath: Assets.item.coffeeCraft.path,
  ),
  ShoppingItem(
    id: 'milk_daily',
    name: '牛乳 1L',
    price: 198,
    description: '生乳100%。毎日の食卓に。',
    imagePath: Assets.item.milkDaily.path,
  ),
  // ── 食品 ──────────────────────────────────────────────────────
  ShoppingItem(
    id: 'snack_chips',
    name: 'ポテトチップス',
    price: 148,
    description: 'サクサク食感。塩味。',
    imagePath: Assets.item.snackChips.path,
  ),
  ShoppingItem(
    id: 'cocoa_bar',
    name: 'チョコレートバー',
    price: 218,
    description: '濃厚カカオ。ひと口サイズ。',
    imagePath: Assets.item.cocoaBar.path,
  ),
  ShoppingItem(
    id: 'bakery_bread',
    name: '食パン 6枚切り',
    price: 258,
    description: '毎朝焼きたて。ふんわりやわらか。',
    imagePath: Assets.item.bakeryBread.path,
  ),
  ShoppingItem(
    id: 'eggs',
    name: '卵 10個入',
    price: 248,
    description: '新鮮たまご。料理・菓子作りに。',
    imagePath: Assets.item.eggs.path,
  ),
  ShoppingItem(
    id: 'noodle_bowl',
    name: 'カップ麺',
    price: 198,
    description: '本格派スープ。お湯を入れて3分。',
    imagePath: Assets.item.noodleBowl.path,
  ),
  ShoppingItem(
    id: 'apple',
    name: 'りんご 1個',
    price: 128,
    description: '甘みと酸味のバランスが絶妙。',
    imagePath: Assets.item.apple.path,
  ),
  ShoppingItem(
    id: 'banana',
    name: 'バナナ 1房',
    price: 198,
    description: '完熟バナナ。エネルギー補給に。',
    imagePath: Assets.item.banana.path,
  ),
  // ── 日用品（洗剤・清潔） ──────────────────────────────────────
  ShoppingItem(
    id: 'detergent_daily_wash',
    name: '液体洗濯洗剤 詰替',
    price: 348,
    description: '部屋干し対応。花の香り。',
    imagePath: Assets.item.detergentDailyWash.path,
  ),
  ShoppingItem(
    id: 'soap_wash_power',
    name: 'ハンドソープ ポンプ',
    price: 258,
    description: '泡立ちなめらか。しっとり洗い上がり。',
    imagePath: Assets.item.soapWashPower.path,
  ),
  ShoppingItem(
    id: 'dish_soap_sparkle',
    name: '食器用洗剤',
    price: 198,
    description: '油汚れもすっきり落とす。',
    imagePath: Assets.item.dishSoapSparkle.path,
  ),
  ShoppingItem(
    id: 'sponge',
    name: 'キッチンスポンジ 2個入',
    price: 148,
    description: '両面タイプ。食器・鍋に。',
    imagePath: Assets.item.sponge.path,
  ),
  // ── 日用品（紙・衛生） ──────────────────────────────────────
  ShoppingItem(
    id: 'tissue_soft',
    name: 'ティッシュペーパー 5箱',
    price: 398,
    description: '柔らかさとこしを両立。',
    imagePath: Assets.item.tissueSoft.path,
  ),
  ShoppingItem(
    id: 'toilet_paper',
    name: 'トイレットペーパー 12ロール',
    price: 498,
    description: 'ダブル。肌にやさしい素材。',
    imagePath: Assets.item.toiletPaper.path,
  ),
  // ── ヘルスケア・ビューティー ───────────────────────────────────
  ShoppingItem(
    id: 'haircare_botanic_shine',
    name: 'ヘアオイル',
    price: 1280,
    description: '植物由来成分配合。まとまりやすい髪に。',
    imagePath: Assets.item.haircareBotanicShine.path,
  ),
  // ── 文具・インテリア ─────────────────────────────────────────
  ShoppingItem(
    id: 'notebook',
    name: 'リングノート + ペンセット',
    price: 680,
    description: 'A5サイズ。消しゴム付きボールペン同梱。',
    imagePath: Assets.item.notebook.path,
  ),
  ShoppingItem(
    id: 'towel',
    name: 'フェイスタオル',
    price: 680,
    description: 'やわらかコットン100%。吸水性抜群。',
    imagePath: Assets.item.towel.path,
  ),
];
