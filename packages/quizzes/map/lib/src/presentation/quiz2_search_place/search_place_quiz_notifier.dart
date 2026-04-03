import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../application/quiz_search_place_use_case.dart';
import '../../domain/entities/map_place.dart';
import '../../infrastructure/map_quiz_repository_provider.dart';
import 'search_place_quiz_state.dart';

final searchPlaceQuizProvider = AutoDisposeNotifierProvider<
    SearchPlaceQuizNotifier, SearchPlaceQuizState>(
  SearchPlaceQuizNotifier.new,
);

/// Quiz 2「目的地を検索する」のNotifier
class SearchPlaceQuizNotifier
    extends AutoDisposeNotifier<SearchPlaceQuizState> {
  static const _quizId = 'map_quiz2';
  static const _timeLimitSeconds = 60;

  final _useCase = const QuizSearchPlaceUseCase();
  Timer? _timer;

  @override
  SearchPlaceQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return SearchPlaceQuizState.initial(timeLimitSeconds: _timeLimitSeconds);
  }

  /// クイズを開始する
  void startQuiz() {
    _timer?.cancel();
    state = SearchPlaceQuizState.initial(
      timeLimitSeconds: _timeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    _startTimer();
  }

  /// 検索バーをタップして入力開始
  void tapSearch() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(searchQuery: 'search');
  }

  /// 場所を選択した
  Future<void> selectPlace(MapPlace place) async {
    if (state.status != QuizStatus.playing) return;

    final isClear = _useCase.isClear(placeSelected: true);
    if (isClear) {
      _timer?.cancel();
      final elapsed = _elapsed;
      state = state.copyWith(
        selectedPlace: place,
        searchQuery: place.name,
        status: QuizStatus.correct,
        elapsedMs: elapsed,
      );
      await hapticFeedback.playSuccessFeedback();
      await _saveResult(isCleared: true, elapsedMs: elapsed);
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
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } on Exception catch (_) {}
  }

  /// クイズをリトライする
  void retry() {
    _timer?.cancel();
    state = SearchPlaceQuizState.initial(
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
