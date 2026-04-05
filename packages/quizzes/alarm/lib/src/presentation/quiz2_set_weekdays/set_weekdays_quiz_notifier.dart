import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../application/quiz_set_weekdays_use_case.dart';
import '../../domain/alarm_catalog.dart';
import '../../infrastructure/alarm_quiz_repository_provider.dart';
import 'set_weekdays_quiz_state.dart';

final setWeekdaysQuizProvider = AutoDisposeNotifierProvider<
    SetWeekdaysQuizNotifier, SetWeekdaysQuizState>(
  SetWeekdaysQuizNotifier.new,
);

/// Quiz 2「平日繰り返しを設定する」のNotifier
class SetWeekdaysQuizNotifier
    extends AutoDisposeNotifier<SetWeekdaysQuizState> {
  static const _quizId = 'alarm_quiz2';
  static const _timeLimitSeconds = 45;

  final _useCase = const QuizSetWeekdaysUseCase();
  Timer? _timer;

  @override
  SetWeekdaysQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return SetWeekdaysQuizState.initial(
      draft: AlarmCatalog.newAlarmDefault,
      timeLimitSeconds: _timeLimitSeconds,
    );
  }

  /// クイズを開始する
  void startQuiz() {
    _timer?.cancel();
    state = SetWeekdaysQuizState.initial(
      draft: AlarmCatalog.newAlarmDefault,
      timeLimitSeconds: _timeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    _startTimer();
  }

  /// 曜日ボタンをタップ
  Future<void> toggleDay(int dayIndex) async {
    if (state.status != QuizStatus.playing) return;

    final current = Set<int>.from(state.draftAlarm.activeDays);
    if (current.contains(dayIndex)) {
      current.remove(dayIndex);
    } else {
      current.add(dayIndex);
    }
    final updated = state.draftAlarm.copyWith(activeDays: current);
    state = state.copyWith(draftAlarm: updated);

    final isClear = _useCase.isClear(activeDays: current);
    if (isClear) {
      _timer?.cancel();
      final elapsed = _elapsed;
      state = state.copyWith(
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
    state = SetWeekdaysQuizState.initial(
      draft: AlarmCatalog.newAlarmDefault,
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
    final repo = ref.read(alarmQuizRepositoryProvider);
    await repo.saveResult(
      quizId: _quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
  }
}
