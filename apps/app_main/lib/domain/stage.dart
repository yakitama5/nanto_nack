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
    id: 'shopping_reorder',
    title: '直近の注文を再注文しよう',
    description: '注文履歴から直近で注文した商品をもう一度購入してください',
    category: 'shopping',
    routePath: '/shopping/reorder',
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
