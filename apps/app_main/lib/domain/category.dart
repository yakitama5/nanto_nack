import 'package:flutter/material.dart';

/// クイズカテゴリーの定義
class Category {
  const Category({
    required this.id,
    required this.label,
    required this.description,
    required this.icon,
    this.isComingSoon = false,
  });

  final String id;
  final String label;
  final String description;
  final IconData icon;

  /// Coming Soon フラグ（未実装カテゴリー）
  final bool isComingSoon;
}

/// アプリで定義するカテゴリー一覧
const List<Category> kAllCategories = [
  Category(
    id: 'shopping',
    label: 'ショッピング',
    description: 'ECサイトのUI/UXを体験しよう',
    icon: Icons.shopping_cart_outlined,
  ),
  Category(
    id: 'chat',
    label: 'チャット',
    description: 'メッセージアプリのUI/UXを体験しよう',
    icon: Icons.chat_bubble_outline,
    isComingSoon: true,
  ),
  Category(
    id: 'streaming',
    label: '動画',
    description: '動画アプリのUI/UXを体験しよう',
    icon: Icons.play_circle_outline,
    isComingSoon: true,
  ),
  Category(
    id: 'map',
    label: 'マップ',
    description: '地図アプリのUI/UXを体験しよう',
    icon: Icons.map_outlined,
    isComingSoon: true,
  ),
  Category(
    id: 'alarm',
    label: 'アラーム',
    description: '時計・アラームアプリのUI/UXを体験しよう',
    icon: Icons.alarm_outlined,
    isComingSoon: true,
  ),
  Category(
    id: 'payment',
    label: '決済',
    description: 'モバイル決済アプリのUI/UXを体験しよう',
    icon: Icons.payment_outlined,
    isComingSoon: true,
  ),
];
