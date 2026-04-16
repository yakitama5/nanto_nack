/// ショッピングカテゴリーのルートパスEnum。
enum ShoppingRoute {
  list('/play/shopping'),
  water('/play/shopping/water'),
  cart('/play/shopping/cart'),
  checkout('/play/shopping/checkout'),
  reorder('/play/shopping/reorder');

  const ShoppingRoute(this.path);
  final String path;
}
