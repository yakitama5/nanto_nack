import 'package:shopping/src/domain/entities/shopping_item.dart';

/// NantoMall の商品カタログ
const List<ShoppingItem> kShoppingCatalog = [
  ShoppingItem(
    id: 'water_500ml',
    name: '天然水 500ml',
    price: 100,
    description: '国産天然水。まろやかな口当たり。',
    imageEmoji: '💧',
  ),
  ShoppingItem(
    id: 'water_2l',
    name: '天然水 2L',
    price: 200,
    description: '大容量サイズ。まとめ買いにお得。',
    imageEmoji: '🫙',
  ),
  ShoppingItem(
    id: 'tea_500ml',
    name: '緑茶 500ml',
    price: 150,
    description: '国産茶葉100%使用。',
    imageEmoji: '🍵',
  ),
  ShoppingItem(
    id: 'coffee_500ml',
    name: 'ブラックコーヒー 500ml',
    price: 180,
    description: '無糖。こだわりのブレンド。',
    imageEmoji: '☕',
  ),
  ShoppingItem(
    id: 'juice_500ml',
    name: 'オレンジジュース 500ml',
    price: 160,
    description: '果汁100%。朝食にぴったり。',
    imageEmoji: '🍊',
  ),
];
