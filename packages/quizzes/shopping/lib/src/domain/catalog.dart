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
    image: Assets.item.waterPuraAqua,
  ),
  ShoppingItem(
    id: 'tea_aqua',
    name: '緑茶 500ml',
    price: 138,
    description: '国産茶葉100%使用。すっきりとした後味。',
    image: Assets.item.teaAqua,
  ),
  ShoppingItem(
    id: 'coffee_craft',
    name: 'クラフトコーヒー',
    price: 298,
    description: '深煎りブレンド。濃厚なコクとまろやかな苦み。',
    image: Assets.item.coffeeCraft,
  ),
  ShoppingItem(
    id: 'milk_daily',
    name: '牛乳 1L',
    price: 198,
    description: '生乳100%。毎日の食卓に。',
    image: Assets.item.milkDaily,
  ),
  // ── 食品 ──────────────────────────────────────────────────────
  ShoppingItem(
    id: 'snack_chips',
    name: 'ポテトチップス',
    price: 148,
    description: 'サクサク食感。塩味。',
    image: Assets.item.snackChips,
  ),
  ShoppingItem(
    id: 'cocoa_bar',
    name: 'チョコレートバー',
    price: 218,
    description: '濃厚カカオ。ひと口サイズ。',
    image: Assets.item.cocoaBar,
  ),
  ShoppingItem(
    id: 'bakery_bread',
    name: '食パン 6枚切り',
    price: 258,
    description: '毎朝焼きたて。ふんわりやわらか。',
    image: Assets.item.bakeryBread,
  ),
  ShoppingItem(
    id: 'eggs',
    name: '卵 10個入',
    price: 248,
    description: '新鮮たまご。料理・菓子作りに。',
    image: Assets.item.eggs,
  ),
  ShoppingItem(
    id: 'noodle_bowl',
    name: 'カップ麺',
    price: 198,
    description: '本格派スープ。お湯を入れて3分。',
    image: Assets.item.noodleBowl,
  ),
  ShoppingItem(
    id: 'apple',
    name: 'りんご 1個',
    price: 128,
    description: '甘みと酸味のバランスが絶妙。',
    image: Assets.item.apple,
  ),
  ShoppingItem(
    id: 'banana',
    name: 'バナナ 1房',
    price: 198,
    description: '完熟バナナ。エネルギー補給に。',
    image: Assets.item.banana,
  ),
  // ── 日用品（洗剤・清潔） ──────────────────────────────────────
  ShoppingItem(
    id: 'detergent_daily_wash',
    name: '液体洗濯洗剤 詰替',
    price: 348,
    description: '部屋干し対応。花の香り。',
    image: Assets.item.detergentDailyWash,
  ),
  ShoppingItem(
    id: 'soap_wash_power',
    name: 'ハンドソープ ポンプ',
    price: 258,
    description: '泡立ちなめらか。しっとり洗い上がり。',
    image: Assets.item.soapWashPower,
  ),
  ShoppingItem(
    id: 'dish_soap_sparkle',
    name: '食器用洗剤',
    price: 198,
    description: '油汚れもすっきり落とす。',
    image: Assets.item.dishSoapSparkle,
  ),
  ShoppingItem(
    id: 'sponge',
    name: 'キッチンスポンジ 2個入',
    price: 148,
    description: '両面タイプ。食器・鍋に。',
    image: Assets.item.sponge,
  ),
  // ── 日用品（紙・衛生） ──────────────────────────────────────
  ShoppingItem(
    id: 'tissue_soft',
    name: 'ティッシュペーパー 5箱',
    price: 398,
    description: '柔らかさとこしを両立。',
    image: Assets.item.tissueSoft,
  ),
  ShoppingItem(
    id: 'toilet_paper',
    name: 'トイレットペーパー 12ロール',
    price: 498,
    description: 'ダブル。肌にやさしい素材。',
    image: Assets.item.toiletPaper,
  ),
  // ── ヘルスケア・ビューティー ───────────────────────────────────
  ShoppingItem(
    id: 'haircare_botanic_shine',
    name: 'ヘアオイル',
    price: 1280,
    description: '植物由来成分配合。まとまりやすい髪に。',
    image: Assets.item.haircareBotanicShine,
  ),
  // ── 文具・インテリア ─────────────────────────────────────────
  ShoppingItem(
    id: 'notebook',
    name: 'リングノート + ペンセット',
    price: 680,
    description: 'A5サイズ。消しゴム付きボールペン同梱。',
    image: Assets.item.notebook,
  ),
  ShoppingItem(
    id: 'towel',
    name: 'フェイスタオル',
    price: 680,
    description: 'やわらかコットン100%。吸水性抜群。',
    image: Assets.item.towel,
  ),
];
