import '../../config/route_path_constants.dart';

/// ショッピングカテゴリーのルートパスEnum。
enum ShoppingRoute {
  list(kShoppingListPath),
  water(kShoppingWaterPath),
  cart(kShoppingCartPath),
  checkout(kShoppingCheckoutPath),
  reorder(kShoppingReorderPath);

  const ShoppingRoute(this.path);
  final String path;
}
