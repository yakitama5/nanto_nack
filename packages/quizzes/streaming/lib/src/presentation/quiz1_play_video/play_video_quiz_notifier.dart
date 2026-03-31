import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/application/quiz_play_video_use_case.dart';
import 'package:streaming/src/domain/streaming_catalog.dart';
import 'package:streaming/src/infrastructure/streaming_quiz_repository_provider.dart';
import 'package:streaming/src/presentation/quiz1_play_video/play_video_quiz_state.dart';

final playVideoQuizProvider = AutoDisposeNotifierProvider<
    PlayVideoQuizNotifier, PlayVideoQuizState>(
  PlayVideoQuizNotifier.new,
);

class PlayVideoQuizNotifier extends AutoDisposeNotifier<PlayVideoQuizState> {
  static const _quizId = 'streaming_quiz1';
  static const _timeLimitSeconds = 60;

  final _useCase = const QuizPlayVideoUseCase();
  Timer? _quizTimer;
  Timer? _progressTimer;

  @override
  PlayVideoQuizState build() {
    ref.onDispose(() {
      _quizTimer?.cancel();
      _progressTimer?.cancel();
    });
    return PlayVideoQuizState.initial(
      video: StreamingCatalog.featuredVideo,
      timeLimitSeconds: _timeLimitSeconds,
    );
  }

  void startQuiz() {
    _quizTimer?.cancel();
    _progressTimer?.cancel();
    state = PlayVideoQuizState.initial(
      video: StreamingCatalog.featuredVideo,
      timeLimitSeconds: _timeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    _startQuizTimer();
  }

  Future<void> tapPlay() async {
    if (state.status != QuizStatus.playing) return;
    if (state.isPlaying) return;

    _quizTimer?.cancel();
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;

    final isClear = _useCase.isClear(isPlaying: true);
    state = state.copyWith(
      isPlaying: true,
      status: isClear ? QuizStatus.correct : state.status,
      elapsedMs: isClear ? elapsed : state.elapsedMs,
    );

    if (isClear) {
      await hapticFeedback.playSuccessFeedback();
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } else {
      _startProgressTimer();
      _startQuizTimer();
    }
  }

  Future<void> giveUp() async {
    if (state.status != QuizStatus.playing) return;
    _quizTimer?.cancel();
    _progressTimer?.cancel();
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;
    state = state.copyWith(
      status: QuizStatus.giveUp,
      remainingSeconds: 0,
      elapsedMs: elapsed,
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (_) {}
  }

  void retry() {
    _quizTimer?.cancel();
    _progressTimer?.cancel();
    state = PlayVideoQuizState.initial(
      video: StreamingCatalog.featuredVideo,
      timeLimitSeconds: _timeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    _startQuizTimer();
  }

  void _startQuizTimer() {
    _quizTimer?.cancel();
    _quizTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      final remaining = state.remainingSeconds - 1;
      if (remaining <= 0) {
        _quizTimer?.cancel();
        _progressTimer?.cancel();
        _onTimeUp();
      } else {
        state = state.copyWith(remainingSeconds: remaining);
      }
    });
  }

  void _startProgressTimer() {
    _progressTimer?.cancel();
    _progressTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.progressSeconds < state.video.durationSeconds) {
        state = state.copyWith(progressSeconds: state.progressSeconds + 1);
      } else {
        _progressTimer?.cancel();
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
  }
}
