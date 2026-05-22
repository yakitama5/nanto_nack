import '../../i18n/strings.g.dart' as $delivery;
import 'food_category.dart';

/// モックカテゴリデータを構築する。
///
/// カテゴリ名は xx ロケール（難読化テキスト）を使用する。
/// id 'pizza' のカテゴリが3番目に配置されており、
/// 初期表示では画面外にはみ出して横スクロールが必要な設計にしている。
List<FoodCategory> buildMockCategories() {
  final sq = $delivery.AppLocale.xx.buildSync();
  return [
    FoodCategory(
      id: 'burger',
      name: sq.categories.burger,
      icon: '🍔',
    ),
    FoodCategory(
      id: 'sushi',
      name: sq.categories.sushi,
      icon: '🍣',
    ),
    FoodCategory(
      id: 'pizza',
      name: sq.categories.pizza,
      icon: '🍕',
    ),
    FoodCategory(
      id: 'ramen',
      name: sq.categories.ramen,
      icon: '🍜',
    ),
    FoodCategory(
      id: 'curry',
      name: sq.categories.curry,
      icon: '🍛',
    ),
  ];
}
