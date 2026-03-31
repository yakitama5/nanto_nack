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
  // ショッピングカテゴリー
  Stage(
    id: 'shopping_water',
    title: '水を2つ買おう',
    description: 'ECサイトで水を2つカートに入れて購入してください',
    category: 'shopping',
    routePath: '/shopping/water',
    difficulty: 1,
  ),
  Stage(
    id: 'shopping_checkout',
    title: '購入手続きを完了しよう',
    description: '住所入力・支払い方法選択・注文確認の3ステップを完了してください',
    category: 'shopping',
    routePath: '/shopping/checkout',
    difficulty: 2,
  ),
  Stage(
    id: 'shopping_reorder',
    title: '直近の注文を再注文しよう',
    description: '注文履歴から直近で注文した商品をもう一度購入してください',
    category: 'shopping',
    routePath: '/shopping/reorder',
    difficulty: 3,
  ),
  Stage(
    id: 'shopping_cart',
    title: 'カートの合計金額を選ぼう',
    description: 'カート内の商品の合計金額を4択から選んでください',
    category: 'shopping',
    routePath: '/shopping/cart',
    difficulty: 5,
  ),
  // チャットカテゴリー（準備中）
  Stage(
    id: 'chat_quiz1',
    title: 'メッセージを送ろう',
    description: 'チャットアプリでメッセージを送信してください',
    category: 'chat',
    routePath: '/chat/quiz1',
    difficulty: 1,
  ),
  Stage(
    id: 'chat_quiz2',
    title: 'スタンプを送ろう',
    description: 'チャットアプリでスタンプを送信してください',
    category: 'chat',
    routePath: '/chat/quiz2',
    difficulty: 2,
  ),
  Stage(
    id: 'chat_quiz3',
    title: 'メッセージを削除しよう',
    description: '送信したメッセージを削除してください',
    category: 'chat',
    routePath: '/chat/quiz3',
    difficulty: 3,
  ),
  Stage(
    id: 'chat_quiz4',
    title: 'グループを作ろう',
    description: '新しいグループチャットを作成してください',
    category: 'chat',
    routePath: '/chat/quiz4',
    difficulty: 4,
  ),
  // 動画カテゴリー（準備中）
  Stage(
    id: 'streaming_quiz1',
    title: '動画を再生しよう',
    description: '動画アプリで動画を再生してください',
    category: 'streaming',
    routePath: '/streaming/quiz1',
    difficulty: 1,
  ),
  Stage(
    id: 'streaming_quiz2',
    title: '動画をシェアしよう',
    description: '動画アプリで動画をシェアしてください',
    category: 'streaming',
    routePath: '/streaming/quiz2',
    difficulty: 2,
  ),
  Stage(
    id: 'streaming_quiz3',
    title: '動画をお気に入りに追加しよう',
    description: '動画アプリで動画をお気に入りリストに追加してください',
    category: 'streaming',
    routePath: '/streaming/quiz3',
    difficulty: 3,
  ),
  Stage(
    id: 'streaming_quiz4',
    title: '動画の字幕をオンにしよう',
    description: '動画アプリで字幕機能をオンにしてください',
    category: 'streaming',
    routePath: '/streaming/quiz4',
    difficulty: 4,
  ),
  // マップカテゴリー（準備中）
  Stage(
    id: 'map_quiz1',
    title: '現在地を表示しよう',
    description: '地図アプリで現在地を表示してください',
    category: 'map',
    routePath: '/map/quiz1',
    difficulty: 1,
  ),
  Stage(
    id: 'map_quiz2',
    title: '目的地を検索しよう',
    description: '地図アプリで目的地を検索してください',
    category: 'map',
    routePath: '/map/quiz2',
    difficulty: 2,
  ),
  Stage(
    id: 'map_quiz3',
    title: 'ルートを案内しよう',
    description: '地図アプリでルート案内を開始してください',
    category: 'map',
    routePath: '/map/quiz3',
    difficulty: 3,
  ),
  Stage(
    id: 'map_quiz4',
    title: '場所をお気に入りに追加しよう',
    description: '地図アプリで場所をお気に入りに保存してください',
    category: 'map',
    routePath: '/map/quiz4',
    difficulty: 4,
  ),
  // アラームカテゴリー（準備中）
  Stage(
    id: 'alarm_quiz1',
    title: 'アラームを設定しよう',
    description: '時計アプリでアラームを設定してください',
    category: 'alarm',
    routePath: '/alarm/quiz1',
    difficulty: 1,
  ),
  Stage(
    id: 'alarm_quiz2',
    title: 'アラームを止めよう',
    description: '鳴っているアラームを止めてください',
    category: 'alarm',
    routePath: '/alarm/quiz2',
    difficulty: 2,
  ),
  Stage(
    id: 'alarm_quiz3',
    title: 'スヌーズをオフにしよう',
    description: 'アラームのスヌーズ機能をオフにしてください',
    category: 'alarm',
    routePath: '/alarm/quiz3',
    difficulty: 3,
  ),
  Stage(
    id: 'alarm_quiz4',
    title: 'タイマーを設定しよう',
    description: '時計アプリでカウントダウンタイマーを設定してください',
    category: 'alarm',
    routePath: '/alarm/quiz4',
    difficulty: 4,
  ),
  // 決済カテゴリー（準備中）
  Stage(
    id: 'payment_quiz1',
    title: 'QRコードを表示しよう',
    description: '決済アプリでQRコードを表示してください',
    category: 'payment',
    routePath: '/payment/quiz1',
    difficulty: 1,
  ),
  Stage(
    id: 'payment_quiz2',
    title: '残高を確認しよう',
    description: '決済アプリで残高を確認してください',
    category: 'payment',
    routePath: '/payment/quiz2',
    difficulty: 2,
  ),
  Stage(
    id: 'payment_quiz3',
    title: 'チャージしよう',
    description: '決済アプリでチャージしてください',
    category: 'payment',
    routePath: '/payment/quiz3',
    difficulty: 3,
  ),
  Stage(
    id: 'payment_quiz4',
    title: '送金しよう',
    description: '決済アプリで送金操作を完了してください',
    category: 'payment',
    routePath: '/payment/quiz4',
    difficulty: 5,
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
