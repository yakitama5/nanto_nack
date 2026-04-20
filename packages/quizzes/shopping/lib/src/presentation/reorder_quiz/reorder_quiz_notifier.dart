import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/application/quiz_reorder_use_case.dart';
import 'package:shopping/src/domain/shopping_quiz_config.dart';
import 'package:system/system.dart';
import 'package:shopping/src/domain/entities/cart_item.dart';
import 'package:shopping/src/domain/entities/shopping_cart.dart';
import 'package:shopping/src/infrastructure/shopping_quiz_repository_provider.dart';
import 'package:shopping/src/presentation/reorder_quiz/reorder_quiz_state.dart';

final reorderQuizProvider =
    AutoDisposeNotifierProvider<ReorderQuizNotifier, ReorderQuizState>(
  ReorderQuizNotifier.new,
);

class ReorderQuizNotifier extends AutoDisposeNotifier<ReorderQuizState> {
  static const _quizId = 'shopping_quiz3';
  // ヒント使用時のペナルティ
  static const _hintPenaltyFailureCount = 2;
  // クイズのターゲット商品ID（「直近で注文した商品」）
  static const _targetItemId = 'snack_chips';
  static const _targetItemPrice = 148;

  final _useCase = const QuizReorderUseCase();
  Timer? _timer;

  @override
  ReorderQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return ReorderQuizState.initial();
  }

  void startQuiz() {
    _timer?.cancel();
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      cart: const ShoppingCart(),
      isPurchased: false,
      remainingSeconds: ShoppingQuizConfig.reorderTimeLimitSeconds,
      hintUsed: false,
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  void addToCart(CartItem item) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(cart: state.cart.addItem(item));
  }

  void removeFromCart(String itemId) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(cart: state.cart.removeItem(itemId));
  }

  void updateQuantity(String itemId, int quantity) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      cart: state.cart.updateQuantity(itemId, quantity),
    );
  }

  /// 注文履歴の「もう一度買う」ボタンからターゲット商品をカートに追加
  void reorderFromHistory() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      cart: state.cart.addItem(
        const CartItem(
          id: _targetItemId,
          price: _targetItemPrice,
          quantity: 1,
        ),
      ),
    );
  }

  /// ヒントを使用する（ターゲット商品をハイライト + ペナルティ付与）
  void useHint() {
    if (state.status != QuizStatus.playing || state.hintUsed) return;
    state = state.copyWith(
      hintUsed: true,
      failureCount: state.failureCount + _hintPenaltyFailureCount,
    );
  }

  Future<void> purchase() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();

    final newState = state.copyWith(isPurchased: true);
    final elapsed = newState.startedAt != null
        ? clock.now().difference(newState.startedAt!).inMilliseconds
        : 0;

    final reason = _useCase.failureReason(
      cart: newState.cart,
      isPurchased: true,
      targetItemId: _targetItemId,
    );

    if (reason == null) {
      await hapticFeedback.playSuccessFeedback();
      state = newState.copyWith(
        status: QuizStatus.correct,
        elapsedMs: elapsed,
      );
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } else {
      await hapticFeedback.playErrorFeedback();
      state = newState.copyWith(
        status: QuizStatus.incorrect,
        failureCount: state.failureCount + 1,
        elapsedMs: elapsed,
      );
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    }
  }

  /// クイズを諦める（中止）
  Future<void> giveUp() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;
    state = state.copyWith(
      status: QuizStatus.giveUp,
      remainingSeconds: 0,
      elapsedMs: elapsed,
    );
    unawaited(
      ref.read(analyticsServiceProvider).logQuizGivenUp(quizId: _quizId),
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (_) {
      // 結果保存の失敗はUIに影響させない
    }
  }

  void retry() {
    _timer?.cancel();
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: _quizId);
    state = ReorderQuizState.initial(
      targetItemId: _targetItemId,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    _startTimer();
  }

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
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;
    state = state.copyWith(
      status: QuizStatus.timeUp,
      remainingSeconds: 0,
      elapsedMs: elapsed,
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (_) {
      // 結果保存の失敗はUIに影響させない
    }
  }

  Future<void> _saveResult({
    required bool isCleared,
    required int elapsedMs,
  }) async {
    if (isCleared) {
      await ref.read(analyticsServiceProvider).logQuizCompleted(
            quizId: _quizId,
            score: state.score,
            failureCount: state.failureCount,
            clearTimeMs: elapsedMs,
          );
    }
    final repo = ref.read(shoppingQuizRepositoryProvider);
    await repo.saveResult(
      quizId: _quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
  }
}
