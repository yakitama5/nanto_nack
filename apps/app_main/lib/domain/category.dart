import 'package:flutter/material.dart';

/// クイズカテゴリーの定義
class Category {
  const Category({
    required this.id,
    required this.icon,
    this.isComingSoon = false,
  });

  final String id;
  final IconData icon;

  /// Coming Soon フラグ（未実装カテゴリー）
  final bool isComingSoon;
}

/// アプリで定義するカテゴリー一覧
const List<Category> kAllCategories = [
  Category(
    id: 'shopping',
    icon: Icons.shopping_cart_outlined,
  ),
  Category(
    id: 'chat',
    icon: Icons.chat_bubble_outline,
  ),
  Category(
    id: 'streaming',
    icon: Icons.play_circle_outline,
  ),
  Category(
    id: 'map',
    icon: Icons.map_outlined,
  ),
  Category(
    id: 'alarm',
    icon: Icons.alarm_outlined,
  ),
  Category(
    id: 'payment',
    icon: Icons.payment_outlined,
  ),
  Category(
    id: 'mail',
    icon: Icons.mail_outlined,
  ),
  Category(
    id: 'news',
    icon: Icons.newspaper_outlined,
  ),
  Category(
    id: 'calendar',
    icon: Icons.calendar_month_outlined,
  ),
];
