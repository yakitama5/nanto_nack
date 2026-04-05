import 'package:quiz_core/quiz_core.dart';

/// ステージの定義（静的データ）
class Stage {
  const Stage({
    required this.id,
    required this.category,
    required this.routePath,
    required this.difficulty,
  });

  final String id;
  final String category;
  final String routePath;

  /// 難易度 (1〜5)
  final int difficulty;
}

/// アプリで定義するステージ一覧
const List<Stage> kAllStages = [
  // ショッピングカテゴリー
  Stage(
    id: 'shopping_water',
    category: 'shopping',
    routePath: '/shopping/water',
    difficulty: 1,
  ),
  Stage(
    id: 'shopping_checkout',
    category: 'shopping',
    routePath: '/shopping/checkout',
    difficulty: 2,
  ),
  Stage(
    id: 'shopping_reorder',
    category: 'shopping',
    routePath: '/shopping/reorder',
    difficulty: 3,
  ),
  Stage(
    id: 'shopping_cart',
    category: 'shopping',
    routePath: '/shopping/cart',
    difficulty: 5,
  ),
  // チャットカテゴリー
  Stage(
    id: 'chat_quiz1',
    category: 'chat',
    routePath: '/chat/quiz1',
    difficulty: 1,
  ),
  Stage(
    id: 'chat_quiz2',
    category: 'chat',
    routePath: '/chat/quiz2',
    difficulty: 2,
  ),
  Stage(
    id: 'chat_quiz3',
    category: 'chat',
    routePath: '/chat/quiz3',
    difficulty: 3,
  ),
  Stage(
    id: 'chat_quiz4',
    category: 'chat',
    routePath: '/chat/quiz4',
    difficulty: 4,
  ),
  // 動画カテゴリー
  Stage(
    id: 'streaming_quiz1',
    category: 'streaming',
    routePath: '/streaming/quiz1',
    difficulty: 1,
  ),
  Stage(
    id: 'streaming_quiz2',
    category: 'streaming',
    routePath: '/streaming/quiz2',
    difficulty: 2,
  ),
  Stage(
    id: 'streaming_quiz3',
    category: 'streaming',
    routePath: '/streaming/quiz3',
    difficulty: 3,
  ),
  Stage(
    id: 'streaming_quiz4',
    category: 'streaming',
    routePath: '/streaming/quiz4',
    difficulty: 4,
  ),
  // マップカテゴリー
  Stage(
    id: 'map_quiz1',
    category: 'map',
    routePath: '/map/quiz1',
    difficulty: 1,
  ),
  Stage(
    id: 'map_quiz2',
    category: 'map',
    routePath: '/map/quiz2',
    difficulty: 2,
  ),
  Stage(
    id: 'map_quiz3',
    category: 'map',
    routePath: '/map/quiz3',
    difficulty: 3,
  ),
  Stage(
    id: 'map_quiz4',
    category: 'map',
    routePath: '/map/quiz4',
    difficulty: 4,
  ),
  // アラームカテゴリー
  Stage(
    id: 'alarm_quiz1',
    category: 'alarm',
    routePath: '/alarm/quiz1',
    difficulty: 1,
  ),
  Stage(
    id: 'alarm_quiz2',
    category: 'alarm',
    routePath: '/alarm/quiz2',
    difficulty: 2,
  ),
  Stage(
    id: 'alarm_quiz3',
    category: 'alarm',
    routePath: '/alarm/quiz3',
    difficulty: 3,
  ),
  Stage(
    id: 'alarm_quiz4',
    category: 'alarm',
    routePath: '/alarm/quiz4',
    difficulty: 4,
  ),
  // 決済カテゴリー
  Stage(
    id: 'payment_quiz1',
    category: 'payment',
    routePath: '/payment/quiz1',
    difficulty: 1,
  ),
  Stage(
    id: 'payment_quiz2',
    category: 'payment',
    routePath: '/payment/quiz2',
    difficulty: 2,
  ),
  Stage(
    id: 'payment_quiz3',
    category: 'payment',
    routePath: '/payment/quiz3',
    difficulty: 3,
  ),
  Stage(
    id: 'payment_quiz4',
    category: 'payment',
    routePath: '/payment/quiz4',
    difficulty: 4,
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
