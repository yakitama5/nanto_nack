import 'package:quiz_core/quiz_core.dart';

import '../domain/flea_market_item.dart';
import '../domain/market_quiz_config.dart';

// startedAt を null にリセットできるよう sentinel として使うオブジェクト
const _unsetStartedAt = Object();

class FleaMarketQuizState extends QuizStateBase {
  const FleaMarketQuizState._({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.item,
    required this.currentImageIndex,
    required this.isLiked,
    required this.sellerTapped,
    required this.buyButtonTapped,
    required this.remainingSeconds,
  });

  final FleaMarketItem item;

  /// 現在表示中の画像インデックス（0始まり）
  final int currentImageIndex;

  /// いいね状態
  final bool isLiked;

  /// 出品者プロフィールをタップしたか
  final bool sellerTapped;

  /// 購入ボタンをタップしたか
  final bool buyButtonTapped;

  final int remainingSeconds;

  factory FleaMarketQuizState.initial(FleaMarketItem item) {
    return FleaMarketQuizState._(
      status: QuizStatus.idle,
      failureCount: 0,
      elapsedMs: 0,
      startedAt: null,
      item: item,
      currentImageIndex: 0,
      isLiked: false,
      sellerTapped: false,
      buyButtonTapped: false,
      remainingSeconds: MarketQuizConfig.timeLimitSeconds,
    );
  }

  FleaMarketQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    // sentinel を使って「明示的な null」と「省略」を区別する。
    // copyWith(startedAt: null) でリセット可能にするため Object? を使用。
    Object? startedAt = _unsetStartedAt,
    FleaMarketItem? item,
    int? currentImageIndex,
    bool? isLiked,
    bool? sellerTapped,
    bool? buyButtonTapped,
    int? remainingSeconds,
  }) {
    return FleaMarketQuizState._(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      // sentinel と一致しない場合のみ新しい値（null も含む）を使用する
      startedAt: identical(startedAt, _unsetStartedAt)
          ? this.startedAt
          : startedAt as DateTime?,
      item: item ?? this.item,
      currentImageIndex: currentImageIndex ?? this.currentImageIndex,
      isLiked: isLiked ?? this.isLiked,
      sellerTapped: sellerTapped ?? this.sellerTapped,
      buyButtonTapped: buyButtonTapped ?? this.buyButtonTapped,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }
}
