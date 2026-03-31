import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/application/quiz_share_video_use_case.dart';
import 'package:streaming/src/domain/streaming_catalog.dart';
import 'package:streaming/src/infrastructure/streaming_quiz_repository_provider.dart';
import 'package:streaming/src/presentation/quiz2_share_video/share_video_quiz_state.dart';

final shareVideoQuizProvider = AutoDisposeNotifierProvider<
    ShareVideoQuizNotifier, ShareVideoQuizState>(
  ShareVideoQuizNotifier.new,
);

class ShareVideoQuizNotifier extends AutoDisposeNotifier<ShareVideoQuizState> {
  static const _quizId = 'streaming_quiz2';
  static const _timeLimitSeconds = 60;

  final _useCase = const QuizShareVideoUseCase();
  Timer? _timer;

  @override
  ShareVideoQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return ShareVideoQuizState.initial(
      video: StreamingCatalog.featuredVideo,
      timeLimitSeconds: _timeLimitSeconds,
    );
  }

  void startQuiz() {
    _timer?.cancel();
    state = ShareVideoQuizState.initial(
      video: StreamingCatalog.featuredVideo,
      timeLimitSeconds: _timeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    _startTimer();
  }

  void tapShare() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(isShareSheetOpen: true);
  }

  Future<void> confirmShare() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;

    final isClear = _useCase.isClear(isShared: true);
    state = state.copyWith(
      isShared: true,
      isShareSheetOpen: false,
      status: isClear ? QuizStatus.correct : state.status,
      elapsedMs: isClear ? elapsed : state.elapsedMs,
    );

    if (isClear) {
      await hapticFeedback.playSuccessFeedback();
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    }
  }

  void dismissShareSheet() {
    state = state.copyWith(isShareSheetOpen: false);
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
    state = ShareVideoQuizState.initial(
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
