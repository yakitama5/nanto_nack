import 'package:quiz_core/quiz_core.dart';

import '../config/route_path_constants.dart';

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
///
/// EnumのゲッターはDartのconst contextで使えないため、finalで定義し、不変コンテナでラップしている。
final List<Stage> kAllStages = List.unmodifiable([
  // ショッピングカテゴリー
  Stage(
    id: 'shopping_water',
    category: 'shopping',
    routePath: kShoppingWaterPath,
    difficulty: 1,
  ),
  Stage(
    id: 'shopping_checkout',
    category: 'shopping',
    routePath: kShoppingCheckoutPath,
    difficulty: 2,
  ),
  Stage(
    id: 'shopping_reorder',
    category: 'shopping',
    routePath: kShoppingReorderPath,
    difficulty: 3,
  ),
  Stage(
    id: 'shopping_cart',
    category: 'shopping',
    routePath: kShoppingCartPath,
    difficulty: 5,
  ),
  // チャットカテゴリー
  Stage(
    id: 'chat_quiz1',
    category: 'chat',
    routePath: kChatQuiz1Path,
    difficulty: 1,
  ),
  Stage(
    id: 'chat_quiz2',
    category: 'chat',
    routePath: kChatQuiz2Path,
    difficulty: 2,
  ),
  Stage(
    id: 'chat_quiz3',
    category: 'chat',
    routePath: kChatQuiz3Path,
    difficulty: 3,
  ),
  Stage(
    id: 'chat_quiz4',
    category: 'chat',
    routePath: kChatQuiz4Path,
    difficulty: 4,
  ),
  // 動画カテゴリー
  Stage(
    id: 'streaming_quiz1',
    category: 'streaming',
    routePath: kStreamingQuiz1Path,
    difficulty: 1,
  ),
  Stage(
    id: 'streaming_quiz2',
    category: 'streaming',
    routePath: kStreamingQuiz2Path,
    difficulty: 2,
  ),
  Stage(
    id: 'streaming_quiz3',
    category: 'streaming',
    routePath: kStreamingQuiz3Path,
    difficulty: 3,
  ),
  Stage(
    id: 'streaming_quiz4',
    category: 'streaming',
    routePath: kStreamingQuiz4Path,
    difficulty: 4,
  ),
  // マップカテゴリー
  Stage(
    id: 'map_quiz1',
    category: 'map',
    routePath: kMapQuiz1Path,
    difficulty: 1,
  ),
  Stage(
    id: 'map_quiz2',
    category: 'map',
    routePath: kMapQuiz2Path,
    difficulty: 2,
  ),
  Stage(
    id: 'map_quiz3',
    category: 'map',
    routePath: kMapQuiz3Path,
    difficulty: 3,
  ),
  Stage(
    id: 'map_quiz4',
    category: 'map',
    routePath: kMapQuiz4Path,
    difficulty: 4,
  ),
  // アラームカテゴリー
  Stage(
    id: 'alarm_quiz1',
    category: 'alarm',
    routePath: kAlarmQuiz1Path,
    difficulty: 1,
  ),
  Stage(
    id: 'alarm_quiz2',
    category: 'alarm',
    routePath: kAlarmQuiz2Path,
    difficulty: 2,
  ),
  Stage(
    id: 'alarm_quiz3',
    category: 'alarm',
    routePath: kAlarmQuiz3Path,
    difficulty: 3,
  ),
  Stage(
    id: 'alarm_quiz4',
    category: 'alarm',
    routePath: kAlarmQuiz4Path,
    difficulty: 4,
  ),
  // 決済カテゴリー
  Stage(
    id: 'payment_quiz1',
    category: 'payment',
    routePath: kPaymentQuiz1Path,
    difficulty: 1,
  ),
  Stage(
    id: 'payment_quiz2',
    category: 'payment',
    routePath: kPaymentQuiz2Path,
    difficulty: 2,
  ),
  Stage(
    id: 'payment_quiz3',
    category: 'payment',
    routePath: kPaymentQuiz3Path,
    difficulty: 3,
  ),
  Stage(
    id: 'payment_quiz4',
    category: 'payment',
    routePath: kPaymentQuiz4Path,
    difficulty: 4,
  ),
  // メールカテゴリー
  Stage(
    id: 'mail_quiz1',
    category: 'mail',
    routePath: kMailQuiz1Path,
    difficulty: 1,
  ),
  Stage(
    id: 'mail_quiz2',
    category: 'mail',
    routePath: kMailQuiz2Path,
    difficulty: 2,
  ),
  Stage(
    id: 'mail_quiz3',
    category: 'mail',
    routePath: kMailQuiz3Path,
    difficulty: 3,
  ),
  Stage(
    id: 'mail_quiz4',
    category: 'mail',
    routePath: kMailQuiz4Path,
    difficulty: 4,
  ),
  // ニュースカテゴリー
  Stage(
    id: 'news_quiz1',
    category: 'news',
    routePath: kNewsQuiz1Path,
    difficulty: 1,
  ),
  Stage(
    id: 'news_quiz2',
    category: 'news',
    routePath: kNewsQuiz2Path,
    difficulty: 2,
  ),
  Stage(
    id: 'news_quiz3',
    category: 'news',
    routePath: kNewsQuiz3Path,
    difficulty: 3,
  ),
  Stage(
    id: 'news_quiz4',
    category: 'news',
    routePath: kNewsQuiz4Path,
    difficulty: 4,
  ),
]);

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
