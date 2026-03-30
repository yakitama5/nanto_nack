import 'package:quiz_core/quiz_core.dart';

/// ステージの定義（静的データ）
class Stage {
  const Stage({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.routePath,
    required this.difficulty,
  });

  final String id;
  final String title;
  final String description;
  final String category;
  final String routePath;

  /// 難易度 (1〜5)
  final int difficulty;
}

/// アプリで定義するステージ一覧
const List<Stage> kAllStages = [
  Stage(
    id: 'shopping_water',
    title: '水を2つ買おう',
    description: 'ECサイトで水を2つカートに入れて購入してください',
    category: 'shopping',
    routePath: '/shopping/water',
    difficulty: 1,
  ),
  Stage(
    id: 'shopping_cart',
    title: 'カートの合計金額を選ぼう',
    description: 'カート内の商品の合計金額を4択から選んでください',
    category: 'shopping',
    routePath: '/shopping/cart',
    difficulty: 3,
  ),
  Stage(
    id: 'shopping_checkout',
    title: '購入手続きを完了しよう',
    description: '住所入力・支払い方法選択・注文確認の3ステップを完了してください',
    category: 'shopping',
    routePath: '/shopping/checkout',
    difficulty: 4,
  ),
  Stage(
    id: 'shopping_reorder',
    title: '直近の注文を再注文しよう',
    description: '注文履歴から直近で注文した商品をもう一度購入してください',
    category: 'shopping',
    routePath: '/shopping/reorder',
    difficulty: 2,
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
