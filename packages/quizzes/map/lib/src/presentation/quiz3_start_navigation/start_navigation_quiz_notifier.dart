import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../application/quiz_start_navigation_use_case.dart';
import '../../domain/entities/map_place.dart';
import '../../infrastructure/map_quiz_repository_provider.dart';
import 'start_navigation_quiz_state.dart';

final startNavigationQuizProvider = AutoDisposeNotifierProvider<
    StartNavigationQuizNotifier, StartNavigationQuizState>(
  StartNavigationQuizNotifier.new,
);

/// Quiz 3「目的地と交通手段を選んでルートを案内する」のNotifier
class StartNavigationQuizNotifier
    extends AutoDisposeNotifier<StartNavigationQuizState> {
  static const _quizId = 'map_quiz3';

  final _useCase = const QuizStartNavigationUseCase();
  Timer? _timer;

  @override
  StartNavigationQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return StartNavigationQuizState.initial();
  }

  /// クイズを開始する
  void startQuiz() {
    _timer?.cancel();
    state = StartNavigationQuizState.initial().copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  /// 目的地のピンをタップした
  Future<void> selectPlace(MapPlace place) async {
    if (state.status != QuizStatus.playing) return;

    // 正誤に関わらず選択状態を更新してルートパネルを表示する。
    // 正誤判定は「案内を開始」ボタンタップ時にまとめて行う。
    state = state.copyWith(
      selectedPlace: place,
      showDirections: true,
    );
  }

  /// 交通手段を選択した
  Future<void> selectTransport(int transportIndex) async {
    if (state.status != QuizStatus.playing) return;
    if (!state.showDirections) return;

    // 正誤に関わらず選択状態を更新する。
    // 正誤判定は「案内を開始」ボタンタップ時にまとめて行う。
    state = state.copyWith(selectedTransportIndex: transportIndex);
  }

  /// 「案内を開始」ボタンをタップ → 目的地と交通手段の両方を検証して判定
  Future<void> tapStartNavigation() async {
    if (state.status != QuizStatus.playing) return;
    if (state.selectedTransportIndex == null) return;
    if (state.selectedPlace == null) return;

    _timer?.cancel();
    final elapsed = _elapsed;

    final isCorrectDestination =
        _useCase.isCorrectDestination(state.selectedPlace!.id);
    final isCorrectTransport =
        _useCase.isCorrectTransport(state.selectedTransportIndex!);

    if (isCorrectDestination && isCorrectTransport) {
      state = state.copyWith(
        navigationStarted: true,
        status: QuizStatus.correct,
        elapsedMs: elapsed,
      );
      await hapticFeedback.playSuccessFeedback();
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } else {
      state = state.copyWith(
        status: QuizStatus.incorrect,
        failureCount: state.failureCount + 1,
        elapsedMs: elapsed,
      );
      await hapticFeedback.playErrorFeedback();
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    }
  }

  /// 諦めてクイズを終了する
  Future<void> giveUp() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();
    final elapsed = _elapsed;
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
    } on Exception catch (_) {}
  }

  /// クイズをリトライする
  void retry() {
    _timer?.cancel();
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: _quizId);
    state = StartNavigationQuizState.initial().copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    _startTimer();
  }

  int get _elapsed => state.startedAt != null
      ? clock.now().difference(state.startedAt!).inMilliseconds
      : 0;

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
    final elapsed = _elapsed;
    state = state.copyWith(
      status: QuizStatus.timeUp,
      remainingSeconds: 0,
      elapsedMs: elapsed,
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } on Exception catch (_) {}
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
    final repo = ref.read(mapQuizRepositoryProvider);
    await repo.saveResult(
      quizId: _quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
  }
}
