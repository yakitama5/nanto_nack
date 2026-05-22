import '../../i18n/strings.g.dart' as $delivery;
import 'food_category.dart';

/// モックカテゴリデータを構築する。
///
/// カテゴリ名は xx ロケール（難読化テキスト）を使用する。
/// id 'pizza' のカテゴリが3番目に配置されており、
/// 初期表示では画面外にはみ出して横スクロールが必要な設計にしている。
final _sq = $delivery.AppLocale.xx.buildSync();

List<FoodCategory> buildMockCategories() {
  return [
    FoodCategory(
      id: 'burger',
      name: _sq.categories.burger,
      icon: '🍔',
    ),
    FoodCategory(
      id: 'sushi',
      name: _sq.categories.sushi,
      icon: '🍣',
    ),
    FoodCategory(
      id: 'pizza',
      name: _sq.categories.pizza,
      icon: '🍕',
    ),
    FoodCategory(
      id: 'ramen',
      name: _sq.categories.ramen,
      icon: '🍜',
    ),
    FoodCategory(
      id: 'curry',
      name: _sq.categories.curry,
      icon: '🍛',
    ),
  ];
}
