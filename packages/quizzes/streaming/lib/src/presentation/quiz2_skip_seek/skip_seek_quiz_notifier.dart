import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/application/quiz_skip_seek_use_case.dart';
import 'package:system/system.dart';
import 'package:streaming/src/domain/streaming_catalog.dart';
import 'package:streaming/src/infrastructure/streaming_quiz_repository_provider.dart';
import 'package:streaming/src/presentation/quiz2_skip_seek/skip_seek_quiz_state.dart';

final skipSeekQuizProvider =
    AutoDisposeNotifierProvider<SkipSeekQuizNotifier, SkipSeekQuizState>(
  SkipSeekQuizNotifier.new,
);

class SkipSeekQuizNotifier extends AutoDisposeNotifier<SkipSeekQuizState> {
  static const _quizId = 'streaming_quiz2';
  static const _timeLimitSeconds = 45;

  final _useCase = const QuizSkipSeekUseCase();
  Timer? _timer;

  @override
  SkipSeekQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return SkipSeekQuizState.initial(
      video: StreamingCatalog.videos[1], // Quiz 2用の動画
      timeLimitSeconds: _timeLimitSeconds,
    );
  }

  void startQuiz() {
    _timer?.cancel();
    state = SkipSeekQuizState.initial(
      video: StreamingCatalog.videos[1],
      timeLimitSeconds: _timeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  void tapLike() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      video: state.video.copyWith(isLiked: !state.video.isLiked),
    );
  }

  void tapDislike() {
    if (state.status != QuizStatus.playing) return;
  }

  void tapShare() {
    if (state.status != QuizStatus.playing) return;
  }

  void tapSave() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      video: state.video.copyWith(isSaved: !state.video.isSaved),
    );
  }

  void tapDownload() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      video: state.video.copyWith(isDownloaded: !state.video.isDownloaded),
    );
  }

  void tapSettings() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(isSettingsOpen: true);
  }

  void dismissSettings() {
    state = state.copyWith(isSettingsOpen: false);
  }

  void tapNext() {
    if (state.status != QuizStatus.playing) return;
    
    // 次の動画（カタログの次のインデックスなど）へ切り替え
    final nextVideo = StreamingCatalog.videos[2];
    state = state.copyWith(
      video: nextVideo,
      isSkipped: true,
      progressSeconds: 0,
    );
    _checkClear();
  }

  void onSeek(double progress) {
    if (state.status != QuizStatus.playing) return;
    
    final progressSeconds = (state.video.durationSeconds * progress).round();
    state = state.copyWith(progressSeconds: progressSeconds);
    _checkClear();
  }

  void _checkClear() {
    final progress = state.video.durationSeconds > 0
        ? state.progressSeconds / state.video.durationSeconds
        : 0.0;
        
    final isClear = _useCase.isClear(
      isSkipped: state.isSkipped,
      progress: progress,
    );

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
    state = SkipSeekQuizState.initial(
      video: StreamingCatalog.videos[1],
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
