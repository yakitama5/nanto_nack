import 'package:quiz_core/quiz_core.dart';

import '../router/routes/alarm_route.dart';
import '../router/routes/chat_route.dart';
import '../router/routes/mail_route.dart';
import '../router/routes/map_route.dart';
import '../router/routes/news_route.dart';
import '../router/routes/payment_route.dart';
import '../router/routes/shopping_route.dart';
import '../router/routes/streaming_route.dart';

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
/// EnumのgetterはDartのconst contextで使えないため、finalで定義する。
final List<Stage> kAllStages = [
  // ショッピングカテゴリー
  Stage(
    id: 'shopping_water',
    category: 'shopping',
    routePath: ShoppingRoute.water.path,
    difficulty: 1,
  ),
  Stage(
    id: 'shopping_checkout',
    category: 'shopping',
    routePath: ShoppingRoute.checkout.path,
    difficulty: 2,
  ),
  Stage(
    id: 'shopping_reorder',
    category: 'shopping',
    routePath: ShoppingRoute.reorder.path,
    difficulty: 3,
  ),
  Stage(
    id: 'shopping_cart',
    category: 'shopping',
    routePath: ShoppingRoute.cart.path,
    difficulty: 5,
  ),
  // チャットカテゴリー
  Stage(
    id: 'chat_quiz1',
    category: 'chat',
    routePath: ChatRoute.quiz1.path,
    difficulty: 1,
  ),
  Stage(
    id: 'chat_quiz2',
    category: 'chat',
    routePath: ChatRoute.quiz2.path,
    difficulty: 2,
  ),
  Stage(
    id: 'chat_quiz3',
    category: 'chat',
    routePath: ChatRoute.quiz3.path,
    difficulty: 3,
  ),
  Stage(
    id: 'chat_quiz4',
    category: 'chat',
    routePath: ChatRoute.quiz4.path,
    difficulty: 4,
  ),
  // 動画カテゴリー
  Stage(
    id: 'streaming_quiz1',
    category: 'streaming',
    routePath: StreamingRoute.quiz1.path,
    difficulty: 1,
  ),
  Stage(
    id: 'streaming_quiz2',
    category: 'streaming',
    routePath: StreamingRoute.quiz2.path,
    difficulty: 2,
  ),
  Stage(
    id: 'streaming_quiz3',
    category: 'streaming',
    routePath: StreamingRoute.quiz3.path,
    difficulty: 3,
  ),
  Stage(
    id: 'streaming_quiz4',
    category: 'streaming',
    routePath: StreamingRoute.quiz4.path,
    difficulty: 4,
  ),
  // マップカテゴリー
  Stage(
    id: 'map_quiz1',
    category: 'map',
    routePath: MapRoute.quiz1.path,
    difficulty: 1,
  ),
  Stage(
    id: 'map_quiz2',
    category: 'map',
    routePath: MapRoute.quiz2.path,
    difficulty: 2,
  ),
  Stage(
    id: 'map_quiz3',
    category: 'map',
    routePath: MapRoute.quiz3.path,
    difficulty: 3,
  ),
  Stage(
    id: 'map_quiz4',
    category: 'map',
    routePath: MapRoute.quiz4.path,
    difficulty: 4,
  ),
  // アラームカテゴリー
  Stage(
    id: 'alarm_quiz1',
    category: 'alarm',
    routePath: AlarmRoute.quiz1.path,
    difficulty: 1,
  ),
  Stage(
    id: 'alarm_quiz2',
    category: 'alarm',
    routePath: AlarmRoute.quiz2.path,
    difficulty: 2,
  ),
  Stage(
    id: 'alarm_quiz3',
    category: 'alarm',
    routePath: AlarmRoute.quiz3.path,
    difficulty: 3,
  ),
  Stage(
    id: 'alarm_quiz4',
    category: 'alarm',
    routePath: AlarmRoute.quiz4.path,
    difficulty: 4,
  ),
  // 決済カテゴリー
  Stage(
    id: 'payment_quiz1',
    category: 'payment',
    routePath: PaymentRoute.quiz1.path,
    difficulty: 1,
  ),
  Stage(
    id: 'payment_quiz2',
    category: 'payment',
    routePath: PaymentRoute.quiz2.path,
    difficulty: 2,
  ),
  Stage(
    id: 'payment_quiz3',
    category: 'payment',
    routePath: PaymentRoute.quiz3.path,
    difficulty: 3,
  ),
  Stage(
    id: 'payment_quiz4',
    category: 'payment',
    routePath: PaymentRoute.quiz4.path,
    difficulty: 4,
  ),
  // メールカテゴリー
  Stage(
    id: 'mail_quiz1',
    category: 'mail',
    routePath: MailRoute.quiz1.path,
    difficulty: 1,
  ),
  Stage(
    id: 'mail_quiz2',
    category: 'mail',
    routePath: MailRoute.quiz2.path,
    difficulty: 2,
  ),
  Stage(
    id: 'mail_quiz3',
    category: 'mail',
    routePath: MailRoute.quiz3.path,
    difficulty: 3,
  ),
  Stage(
    id: 'mail_quiz4',
    category: 'mail',
    routePath: MailRoute.quiz4.path,
    difficulty: 4,
  ),
  // ニュースカテゴリー
  Stage(
    id: 'news_quiz1',
    category: 'news',
    routePath: NewsRoute.quiz1.path,
    difficulty: 1,
  ),
  Stage(
    id: 'news_quiz2',
    category: 'news',
    routePath: NewsRoute.quiz2.path,
    difficulty: 2,
  ),
  Stage(
    id: 'news_quiz3',
    category: 'news',
    routePath: NewsRoute.quiz3.path,
    difficulty: 3,
  ),
  Stage(
    id: 'news_quiz4',
    category: 'news',
    routePath: NewsRoute.quiz4.path,
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
