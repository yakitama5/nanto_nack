/// フードデリバリーアプリのカテゴリを表すドメインモデル。
class FoodCategory {
  const FoodCategory({
    required this.id,
    required this.name,
    required this.icon,
  });

  /// カテゴリID（クリア判定に使用）
  final String id;

  /// カテゴリ名（xxロケールテキスト・表示用）
  final String name;

  /// 絵文字アイコン
  final String icon;
}
