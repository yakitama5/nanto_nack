import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../domain/flea_market_item.dart';
import '../domain/market_quiz_type.dart';
import '../infrastructure/market_quiz_repository_provider.dart';
import 'flea_market_quiz_state.dart';

/// フリマアプリのモック商品データ
final _mockItem = FleaMarketItem(
  id: 'vintage_denim_jacket',
  title: 'ヴィンテージデニムジャケット',
  price: 3800,
  // 表・横・裏の3枚を絵文字で表現（実際の画像の代替）
  imageEmojis: const ['👕', '🔄', '🏷️'],
  description: '古着屋で購入した1990年代のデニムジャケット。若干の使用感はありますが、目立った傷・汚れなし。サイズはMです。',
  sellerName: 'ビンテージ愛好家',
  sellerRating: 4.8,
);

/// riverpod_generator は禁止のため手動で Provider を定義する
final fleaMarketQuizProvider = AutoDisposeNotifierProvider.family<
    FleaMarketQuizNotifier, FleaMarketQuizState, MarketQuizType>(
  FleaMarketQuizNotifier.new,
);

class FleaMarketQuizNotifier
    extends AutoDisposeFamilyNotifier<FleaMarketQuizState, MarketQuizType> {
  Timer? _timer;

  @override
  FleaMarketQuizState build(MarketQuizType arg) {
    ref.onDispose(() => _timer?.cancel());
    return FleaMarketQuizState.initial(_mockItem);
  }

  void startQuiz() {
    if (state.status != QuizStatus.idle) return;
    // clock.now() を使用（DateTime.now() は禁止）
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: arg.quizId);
    _startTimer();
  }

  /// 画像インデックスを更新する（quiz1: 最後の画像まで到達でクリア）
  void updateImageIndex(int index) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(currentImageIndex: index);
    _checkClear();
  }

  /// いいねをトグルする（quiz2: いいね状態になったらクリア）
  void toggleLike() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(isLiked: !state.isLiked);
    _checkClear();
  }

  /// 出品者プロフィールをタップする（quiz3: タップでクリア）
  void tapSellerProfile() {
    if (state.status != QuizStatus.playing) return;
    if (state.sellerTapped) return;
    state = state.copyWith(sellerTapped: true);
    _checkClear();
  }

  /// 購入ボタンをタップする（quiz4: タップでクリア）
  void tapBuyButton() {
    if (state.status != QuizStatus.playing) return;
    if (state.buyButtonTapped) return;
    state = state.copyWith(buyButtonTapped: true);
    _checkClear();
  }

  Future<void> giveUp() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();
    final elapsed = _elapsed;
    state = state.copyWith(
      status: QuizStatus.giveUp,
      remainingSeconds: 0,
      elapsedMs: elapsed,
    );
    unawaited(
      ref.read(analyticsServiceProvider).logQuizGivenUp(quizId: arg.quizId),
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } on Exception catch (_) {}
  }

  void retry() {
    _timer?.cancel();
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: arg.quizId);
    state = FleaMarketQuizState.initial(_mockItem);
  }

  int get _elapsed => state.startedAt != null
      ? clock.now().difference(state.startedAt!).inMilliseconds
      : 0;

  void _checkClear() {
    if (state.status != QuizStatus.playing) return;
    if (!_isClear()) return;

    _timer?.cancel();
    final elapsed = _elapsed;
    state = state.copyWith(
      status: QuizStatus.correct,
      elapsedMs: elapsed,
    );
    unawaited(hapticFeedback.playSuccessFeedback());
    unawaited(_saveResult(isCleared: true, elapsedMs: elapsed));
  }

  bool _isClear() => switch (arg) {
        MarketQuizType.quiz1 =>
          state.currentImageIndex == state.item.imageEmojis.length - 1,
        MarketQuizType.quiz2 => state.isLiked,
        MarketQuizType.quiz3 => state.sellerTapped,
        MarketQuizType.quiz4 => state.buyButtonTapped,
      };

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final remaining = state.remainingSeconds - 1;
      if (remaining <= 0) {
        _timer?.cancel();
        _onTimeUp();
      } else {
        state = state.copyWith(remainingSeconds: remaining);
      }
    });
  }

  Future<void> _onTimeUp() async {
    // タイマーキャンセル後にキューに残ったtickが発火した場合や、
    // _checkClear() が既に correct へ遷移させた場合に上書きしないよう守る
    if (state.status != QuizStatus.playing) return;
    final elapsed = _elapsed;
    state = state.copyWith(
      status: QuizStatus.timeUp,
      remainingSeconds: 0,
      elapsedMs: elapsed,
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } on Exception catch (_) {}
  }

  Future<void> _saveResult({
    required bool isCleared,
    required int elapsedMs,
  }) async {
    if (isCleared) {
      await ref.read(analyticsServiceProvider).logQuizCompleted(
            quizId: arg.quizId,
            score: state.score,
            failureCount: state.failureCount,
            clearTimeMs: elapsedMs,
          );
    }
    final repo = ref.read(marketQuizRepositoryProvider);
    await repo.saveResult(
      quizId: arg.quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
  }
}
