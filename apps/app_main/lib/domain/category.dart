import 'package:flutter/material.dart';

/// クイズカテゴリーの定義
class Category {
  const Category({
    required this.id,
    required this.label,
    required this.description,
    required this.icon,
  });

  final String id;
  final String label;
  final String description;
  final IconData icon;
}

/// アプリで定義するカテゴリー一覧
const List<Category> kAllCategories = [
  Category(
    id: 'shopping',
    label: 'ショッピング',
    description: 'ECサイトのUI/UXを体験しよう',
    icon: Icons.shopping_cart_outlined,
  ),
];
