import 'package:quiz_core/quiz_core.dart';

/// ステージの定義（静的データ）
class Stage {
  const Stage({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.routePath,
  });

  final String id;
  final String title;
  final String description;
  final String category;
  final String routePath;
}

/// アプリで定義するステージ一覧
const List<Stage> kAllStages = [
  Stage(
    id: 'shopping_water',
    title: '水を2つ買おう',
    description: 'ECサイトで水を2つカートに入れて購入してください',
    category: 'shopping',
    routePath: '/shopping/water',
  ),
  Stage(
    id: 'shopping_cart',
    title: 'カートを確認しよう',
    description: 'カートの中身を確認して正しい合計金額を選んでください',
    category: 'shopping',
    routePath: '/shopping/cart',
  ),
  Stage(
    id: 'shopping_checkout',
    title: '購入を完了しよう',
    description: '購入手続きを完了してください',
    category: 'shopping',
    routePath: '/shopping/checkout',
  ),
];

/// ステージにクリア状況を付加したクラス
class StageWithStatus {
  const StageWithStatus({
    required this.stage,
    required this.status,
    this.clearTimeMs,
    this.score,
  });

  final Stage stage;
  final StageStatus status;
  final int? clearTimeMs;
  final int? score;

  StageWithStatus copyWith({
    Stage? stage,
    StageStatus? status,
    int? clearTimeMs,
    int? score,
  }) {
    return StageWithStatus(
      stage: stage ?? this.stage,
      status: status ?? this.status,
      clearTimeMs: clearTimeMs ?? this.clearTimeMs,
      score: score ?? this.score,
    );
  }
}
