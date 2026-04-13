import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/application/quiz_subtitle_use_case.dart';
import 'package:system/system.dart';
import 'package:streaming/src/domain/streaming_catalog.dart';
import 'package:streaming/src/domain/streaming_quiz_config.dart';
import 'package:streaming/src/infrastructure/streaming_quiz_repository_provider.dart';
import 'package:streaming/src/presentation/quiz1_subtitle/subtitle_quiz_state.dart';

final subtitleQuizProvider = AutoDisposeNotifierProvider<
    SubtitleQuizNotifier, SubtitleQuizState>(
  SubtitleQuizNotifier.new,
);

class SubtitleQuizNotifier extends AutoDisposeNotifier<SubtitleQuizState> {
  static const _quizId = 'streaming_quiz1';

  final _useCase = const QuizSubtitleUseCase();
  Timer? _timer;

  @override
  SubtitleQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return SubtitleQuizState.initial(
      video: StreamingCatalog.featuredVideo,
      timeLimitSeconds: StreamingQuizConfig.quiz1SubtitleTimeLimitSeconds,
    );
  }

  void startQuiz() {
    _timer?.cancel();
    state = SubtitleQuizState.initial(
      video: StreamingCatalog.featuredVideo,
      timeLimitSeconds: StreamingQuizConfig.quiz1SubtitleTimeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  Future<void> tapCC() async {
    if (state.status != QuizStatus.playing) return;
    
    final updatedVideo =
        state.video.copyWith(subtitlesEnabled: !state.video.subtitlesEnabled);
    
    final isClear =
        _useCase.isClear(subtitlesEnabled: updatedVideo.subtitlesEnabled);

    if (isClear) {
      _timer?.cancel();
      final elapsed = state.startedAt != null
          ? clock.now().difference(state.startedAt!).inMilliseconds
          : 0;
      state = state.copyWith(
        video: updatedVideo,
        status: QuizStatus.correct,
        elapsedMs: elapsed,
      );
      unawaited(hapticFeedback.playSuccessFeedback());
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } else {
      state = state.copyWith(video: updatedVideo);
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

  void tapLike() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      video: state.video.copyWith(isLiked: !state.video.isLiked),
    );
  }

  void tapDislike() {
    if (state.status != QuizStatus.playing) return;
    // 低評価トグル（視覚フィードバックのみ）
  }

  void tapShare() {
    if (state.status != QuizStatus.playing) return;
    // シェアアクション（状態変更なし）
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

  void retry() {
    _timer?.cancel();
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: _quizId);
    state = SubtitleQuizState.initial(
      video: StreamingCatalog.featuredVideo,
      timeLimitSeconds: StreamingQuizConfig.quiz1SubtitleTimeLimitSeconds,
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
