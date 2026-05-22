import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../domain/delivery_quiz_config.dart';
import '../../domain/delivery_view_state.dart';
import '../../infrastructure/delivery_quiz_repository_provider.dart';
import '../delivery_app_notifier.dart';
import 'find_pizza_quiz_state.dart';

final findPizzaQuizProvider =
    AutoDisposeNotifierProvider<FindPizzaQuizNotifier, FindPizzaQuizState>(
  FindPizzaQuizNotifier.new,
);

class FindPizzaQuizNotifier extends AutoDisposeNotifier<FindPizzaQuizState> {
  static const _quizId = 'delivery_quiz1';
  Timer? _timer;

  @override
  FindPizzaQuizState build() {
    ref.onDispose(() => _timer?.cancel());

    // deliveryAppProvider(browsing) を listen し、
    // pizza カテゴリがタップされたらクリア判定を行う。
    ref.listen(deliveryAppProvider(DeliveryViewState.browsing), (prev, next) {
      if (state.status != QuizStatus.playing) return;
      if (next.lastTappedCategoryId == DeliveryQuizConfig.pizzaCategoryId &&
          prev?.lastTappedCategoryId != next.lastTappedCategoryId) {
        unawaited(_onClear());
      }
    });

    return FindPizzaQuizState.initial();
  }

  void startQuiz() {
    if (state.status != QuizStatus.idle) return;
    // clock.now() を使用（DateTime.now() は使用禁止）
    state = FindPizzaQuizState.initial().copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    unawaited(
      ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId),
    );
    _startTimer();
  }

  void useHint() {
    if (state.status != QuizStatus.playing || state.hintUsed) return;
    state = state.copyWith(hintUsed: true);
  }

  Future<void> giveUp() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();
    final elapsed = _elapsed();
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
    } catch (_) {}
  }

  void retry() {
    _timer?.cancel();
    unawaited(
      ref.read(analyticsServiceProvider).logQuizRetried(quizId: _quizId),
    );
    state = FindPizzaQuizState.initial();
    ref.read(deliveryAppProvider(DeliveryViewState.browsing).notifier).reset();
  }

  Future<void> _onClear() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();
    final elapsed = _elapsed();
    state = state.copyWith(
      status: QuizStatus.correct,
      elapsedMs: elapsed,
    );
    unawaited(hapticFeedback.playSuccessFeedback());
    try {
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } catch (_) {}
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final remaining = state.remainingSeconds - 1;
      if (remaining <= 0) {
        _timer?.cancel();
        unawaited(_onTimeUp());
      } else {
        state = state.copyWith(remainingSeconds: remaining);
      }
    });
  }

  Future<void> _onTimeUp() async {
    if (state.status != QuizStatus.playing) return;
    final elapsed = _elapsed();
    state = state.copyWith(
      status: QuizStatus.timeUp,
      remainingSeconds: 0,
      elapsedMs: elapsed,
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (_) {}
  }

  int _elapsed() => state.startedAt != null
      // clock.now() を使用（DateTime.now() は使用禁止）
      ? clock.now().difference(state.startedAt!).inMilliseconds
      : 0;

  Future<void> _saveResult({
    required bool isCleared,
    required int elapsedMs,
  }) async {
    final repo = ref.read(deliveryQuizRepositoryProvider);
    await repo.saveResult(
      quizId: _quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
    if (isCleared) {
      unawaited(
        ref.read(analyticsServiceProvider).logQuizCompleted(
              quizId: _quizId,
              score: state.score,
              failureCount: state.failureCount,
              clearTimeMs: elapsedMs,
            ),
      );
    }
  }
}
