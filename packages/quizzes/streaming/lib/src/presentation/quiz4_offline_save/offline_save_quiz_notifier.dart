import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/application/quiz_offline_save_use_case.dart';
import 'package:system/system.dart';
import 'package:streaming/src/domain/streaming_catalog.dart';
import 'package:streaming/src/infrastructure/streaming_quiz_repository_provider.dart';
import 'package:streaming/src/presentation/quiz4_offline_save/offline_save_quiz_state.dart';

final offlineSaveQuizProvider =
    AutoDisposeNotifierProvider<OfflineSaveQuizNotifier, OfflineSaveQuizState>(
  OfflineSaveQuizNotifier.new,
);

class OfflineSaveQuizNotifier extends AutoDisposeNotifier<OfflineSaveQuizState> {
  static const _quizId = 'streaming_quiz4';
  static const _timeLimitSeconds = 90;

  final _useCase = const QuizOfflineSaveUseCase();
  Timer? _timer;

  @override
  OfflineSaveQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return OfflineSaveQuizState.initial(
      video: StreamingCatalog.videos[3].copyWith(quality: '360p'), // 初期画質を低く設定
      timeLimitSeconds: _timeLimitSeconds,
    );
  }

  void startQuiz() {
    _timer?.cancel();
    state = OfflineSaveQuizState.initial(
      video: StreamingCatalog.videos[3].copyWith(quality: '360p'),
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

  void tapSettings() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(isSettingsOpen: true);
  }

  void dismissSettings() {
    state = state.copyWith(isSettingsOpen: false, isQualityListOpen: false);
  }

  void tapQualityMenu() {
    state = state.copyWith(isQualityListOpen: true);
  }

  void backToSettings() {
    state = state.copyWith(isQualityListOpen: false);
  }

  Future<void> selectQuality(String quality) async {
    if (state.status != QuizStatus.playing) return;
    
    final updatedVideo = state.video.copyWith(quality: quality);
    state = state.copyWith(
      video: updatedVideo,
      isSettingsOpen: false,
      isQualityListOpen: false,
    );
    _checkClear();
  }

  Future<void> tapDownload() async {
    if (state.status != QuizStatus.playing) return;

    final isHighestQuality =
        state.video.quality == '2160p' || state.video.quality == '1080p';

    if (!isHighestQuality) {
      // 最高画質でない場合は不正解（高画質を選んでからダウンロードする必要がある）
      _timer?.cancel();
      final elapsed = state.startedAt != null
          ? clock.now().difference(state.startedAt!).inMilliseconds
          : 0;
      state = state.copyWith(
        status: QuizStatus.incorrect,
        elapsedMs: elapsed,
        failureCount: state.failureCount + 1,
      );
      try {
        await _saveResult(isCleared: false, elapsedMs: elapsed);
      } catch (_) {}
      return;
    }

    final updatedVideo =
        state.video.copyWith(isDownloaded: !state.video.isDownloaded);
    state = state.copyWith(video: updatedVideo);
    _checkClear();
  }

  void _checkClear() {
    final isClear = _useCase.isClear(
      quality: state.video.quality,
      isDownloaded: state.video.isDownloaded,
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
    state = OfflineSaveQuizState.initial(
      video: StreamingCatalog.videos[3].copyWith(quality: '360p'),
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
