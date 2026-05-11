import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../infrastructure/weather_quiz_repository_provider.dart';
import '../weather_app_notifier.dart';
import 'radar_map_quiz_state.dart';

final radarMapQuizProvider =
    AutoDisposeNotifierProvider<RadarMapQuizNotifier, RadarMapQuizState>(
  RadarMapQuizNotifier.new,
);

class RadarMapQuizNotifier extends AutoDisposeNotifier<RadarMapQuizState> {
  static const _quizId = 'weather_quiz4';
  Timer? _timer;

  @override
  RadarMapQuizState build() {
    ref.onDispose(() => _timer?.cancel());

    // weatherAppProviderをlistenし、isRadarMapOpenedがtrueになったらクリア判定。
    // openRadarMap()が呼ばれた時点でクリア条件を満たす。
    ref.listen(weatherAppProvider, (prev, next) {
      if (state.status != QuizStatus.playing) {
        return;
      }
      if (prev?.isRadarMapOpened != true && next.isRadarMapOpened) {
        unawaited(_onClear());
      }
    });

    return RadarMapQuizState.initial();
  }

  void startQuiz() {
    if (state.status != QuizStatus.idle) {
      return;
    }
    // clock.now()を使用（DateTime.now()は使用禁止）
    state = RadarMapQuizState.initial().copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    unawaited(
      ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId),
    );
    _startTimer();
  }

  void useHint() {
    if (state.status != QuizStatus.playing || state.hintUsed) {
      return;
    }
    state = state.copyWith(hintUsed: true);
  }

  Future<void> giveUp() async {
    if (state.status != QuizStatus.playing) {
      return;
    }
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
    await _saveResult(isCleared: false, elapsedMs: elapsed);
  }

  void retry() {
    _timer?.cancel();
    unawaited(
      ref.read(analyticsServiceProvider).logQuizRetried(quizId: _quizId),
    );
    state = RadarMapQuizState.initial();
    ref.invalidate(weatherAppProvider);
  }

  Future<void> _onClear() async {
    _timer?.cancel();
    final elapsed = _elapsed();
    state = state.copyWith(
      status: QuizStatus.correct,
      elapsedMs: elapsed,
    );
    unawaited(hapticFeedback.playSuccessFeedback());
    await _saveResult(isCleared: true, elapsedMs: elapsed);
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
    final elapsed = _elapsed();
    state = state.copyWith(
      status: QuizStatus.timeUp,
      remainingSeconds: 0,
      elapsedMs: elapsed,
    );
    await _saveResult(isCleared: false, elapsedMs: elapsed);
  }

  int _elapsed() => state.startedAt != null
      // clock.now()を使用（DateTime.now()は使用禁止）
      ? clock.now().difference(state.startedAt!).inMilliseconds
      : 0;

  Future<void> _saveResult({
    required bool isCleared,
    required int elapsedMs,
  }) async {
    final repo = ref.read(weatherQuizRepositoryProvider);
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
