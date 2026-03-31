import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/application/quiz_subtitle_use_case.dart';
import 'package:streaming/src/domain/streaming_catalog.dart';
import 'package:streaming/src/infrastructure/streaming_quiz_repository_provider.dart';
import 'package:streaming/src/presentation/quiz4_subtitle/subtitle_quiz_state.dart';

final subtitleQuizProvider = AutoDisposeNotifierProvider<
    SubtitleQuizNotifier, SubtitleQuizState>(
  SubtitleQuizNotifier.new,
);

class SubtitleQuizNotifier extends AutoDisposeNotifier<SubtitleQuizState> {
  static const _quizId = 'streaming_quiz4';
  static const _timeLimitSeconds = 90;

  final _useCase = const QuizSubtitleUseCase();
  Timer? _timer;

  @override
  SubtitleQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return SubtitleQuizState.initial(
      video: StreamingCatalog.featuredVideo,
      timeLimitSeconds: _timeLimitSeconds,
    );
  }

  void startQuiz() {
    _timer?.cancel();
    state = SubtitleQuizState.initial(
      video: StreamingCatalog.featuredVideo,
      timeLimitSeconds: _timeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    _startTimer();
  }

  void tapMore() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(isMoreMenuOpen: true);
  }

  void dismissMoreMenu() {
    state = state.copyWith(isMoreMenuOpen: false);
  }

  Future<void> tapSubtitleToggle() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;

    final updatedVideo =
        state.video.copyWith(subtitlesEnabled: !state.video.subtitlesEnabled);
    final isClear =
        _useCase.isClear(subtitlesEnabled: updatedVideo.subtitlesEnabled);
    state = state.copyWith(
      video: updatedVideo,
      isMoreMenuOpen: false,
      status: isClear ? QuizStatus.correct : state.status,
      elapsedMs: isClear ? elapsed : state.elapsedMs,
    );

    if (isClear) {
      await hapticFeedback.playSuccessFeedback();
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } else {
      _startTimer();
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
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (_) {}
  }

  void retry() {
    _timer?.cancel();
    state = SubtitleQuizState.initial(
      video: StreamingCatalog.featuredVideo,
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
  }
}
