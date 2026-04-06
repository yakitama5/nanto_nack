import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../application/quiz_save_place_use_case.dart';
import '../../domain/map_catalog.dart';
import '../../infrastructure/map_quiz_repository_provider.dart';
import 'save_place_quiz_state.dart';

final savePlaceQuizProvider =
    AutoDisposeNotifierProvider<SavePlaceQuizNotifier, SavePlaceQuizState>(
  SavePlaceQuizNotifier.new,
);

/// Quiz 4「場所をお気に入りに追加する」のNotifier
class SavePlaceQuizNotifier extends AutoDisposeNotifier<SavePlaceQuizState> {
  static const _quizId = 'map_quiz4';
  static const _timeLimitSeconds = 60;

  final _useCase = const QuizSavePlaceUseCase();
  Timer? _timer;

  @override
  SavePlaceQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return SavePlaceQuizState.initial(
      place: MapCatalog.destination,
      timeLimitSeconds: _timeLimitSeconds,
    );
  }

  /// クイズを開始する
  void startQuiz() {
    _timer?.cancel();
    state = SavePlaceQuizState.initial(
      place: MapCatalog.destination,
      timeLimitSeconds: _timeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  /// 星ボタン（お気に入り）をタップ
  Future<void> tapFavorite() async {
    if (state.status != QuizStatus.playing) return;

    final newFavorite = !state.place.isFavorite;
    final isClear = _useCase.isClear(isFavorite: newFavorite);
    final updatedPlace = state.place.copyWith(isFavorite: newFavorite);

    if (isClear) {
      _timer?.cancel();
      final elapsed = _elapsed;
      state = state.copyWith(
        place: updatedPlace,
        status: QuizStatus.correct,
        elapsedMs: elapsed,
      );
      await hapticFeedback.playSuccessFeedback();
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } else {
      state = state.copyWith(place: updatedPlace);
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
    state = SavePlaceQuizState.initial(
      place: MapCatalog.destination,
      timeLimitSeconds: _timeLimitSeconds,
    ).copyWith(
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
