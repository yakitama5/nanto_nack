import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/application/quiz_playback_speed_use_case.dart';
import 'package:system/system.dart';
import 'package:streaming/src/domain/streaming_catalog.dart';
import 'package:streaming/src/infrastructure/streaming_quiz_repository_provider.dart';
import 'package:streaming/src/presentation/quiz3_playback_speed/playback_speed_quiz_state.dart';

final playbackSpeedQuizProvider =
    AutoDisposeNotifierProvider<PlaybackSpeedQuizNotifier, PlaybackSpeedQuizState>(
  PlaybackSpeedQuizNotifier.new,
);

class PlaybackSpeedQuizNotifier extends AutoDisposeNotifier<PlaybackSpeedQuizState> {
  static const _quizId = 'streaming_quiz3';
  static const _timeLimitSeconds = 60;

  final _useCase = const QuizPlaybackSpeedUseCase();
  Timer? _timer;

  @override
  PlaybackSpeedQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return PlaybackSpeedQuizState.initial(
      video: StreamingCatalog.videos[2], // Quiz 3用の動画
      timeLimitSeconds: _timeLimitSeconds,
    );
  }

  void startQuiz() {
    _timer?.cancel();
    state = PlaybackSpeedQuizState.initial(
      video: StreamingCatalog.videos[2],
      timeLimitSeconds: _timeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  void tapSettings() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(isSettingsOpen: true);
  }

  void dismissSettings() {
    state = state.copyWith(isSettingsOpen: false, isSpeedListOpen: false);
  }

  void tapSpeedMenu() {
    state = state.copyWith(isSpeedListOpen: true);
  }

  void backToSettings() {
    state = state.copyWith(isSpeedListOpen: false);
  }

  Future<void> selectSpeed(double speed) async {
    if (state.status != QuizStatus.playing) return;
    
    final updatedVideo = state.video.copyWith(playbackSpeed: speed);
    state = state.copyWith(
      video: updatedVideo,
      isSettingsOpen: false,
      isSpeedListOpen: false,
    );
    _checkClear();
  }

  void longPressStart() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      video: state.video.copyWith(playbackSpeed: 2.0),
    );
    _checkClear();
  }

  void longPressEnd() {
    if (state.status != QuizStatus.playing) return;
    if (state.status == QuizStatus.correct) return;
    state = state.copyWith(
      video: state.video.copyWith(playbackSpeed: 1.0),
    );
  }

  void _checkClear() {
    final isClear = _useCase.isClear(playbackSpeed: state.video.playbackSpeed);

    if (isClear) {
      _timer?.cancel();
      final elapsed = state.startedAt != null
          ? clock.now().difference(state.startedAt!).inMilliseconds
          : 0;
      state = state.copyWith(
        status: QuizStatus.correct,
        elapsedMs: elapsed,
      );
      hapticFeedback.playSuccessFeedback();
      _saveResult(isCleared: true, elapsedMs: elapsed);
    }
  }

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
    } catch (_) {}
  }

  void retry() {
    _timer?.cancel();
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: _quizId);
    state = PlaybackSpeedQuizState.initial(
      video: StreamingCatalog.videos[2],
      timeLimitSeconds: _timeLimitSeconds,
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
    } catch (_) {}
  }

  Future<void> _saveResult({
    required bool isCleared,
    required int elapsedMs,
  }) async {
    final repo = ref.read(streamingQuizRepositoryProvider);
    await repo.saveResult(
      quizId: _quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
    if (isCleared) {
      unawaited(ref.read(analyticsServiceProvider).logQuizCompleted(
            quizId: _quizId,
            score: state.score,
            failureCount: state.failureCount,
            clearTimeMs: elapsedMs,
          ));
    }
  }
}
