import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../application/quiz_delete_alarm_use_case.dart';
import '../../domain/alarm_catalog.dart';
import '../../infrastructure/alarm_quiz_repository_provider.dart';
import 'delete_alarm_quiz_state.dart';

final deleteAlarmQuizProvider = AutoDisposeNotifierProvider<
    DeleteAlarmQuizNotifier, DeleteAlarmQuizState>(
  DeleteAlarmQuizNotifier.new,
);

/// Quiz 4「アラームを削除する」のNotifier
class DeleteAlarmQuizNotifier
    extends AutoDisposeNotifier<DeleteAlarmQuizState> {
  static const _quizId = 'alarm_quiz4';
  static const _timeLimitSeconds = 45;
  static const _targetAlarmId = 'alarm_1';

  final _useCase = const QuizDeleteAlarmUseCase();
  Timer? _timer;

  @override
  DeleteAlarmQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return DeleteAlarmQuizState.initial(
      alarms: AlarmCatalog.initialAlarms,
      timeLimitSeconds: _timeLimitSeconds,
    );
  }

  /// クイズを開始する
  void startQuiz() {
    _timer?.cancel();
    state = DeleteAlarmQuizState.initial(
      alarms: AlarmCatalog.initialAlarms,
      timeLimitSeconds: _timeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  /// アラームを左スワイプ
  void swipeAlarm(String alarmId) {
    if (state.status != QuizStatus.playing) return;
    if (state.swipedAlarmId == alarmId) {
      // 同じアイテムを再スワイプで閉じる
      state = state.copyWith(clearSwipedAlarmId: true);
    } else {
      state = state.copyWith(swipedAlarmId: alarmId);
    }
  }

  /// 削除ボタンをタップして確定
  Future<void> confirmDelete(String alarmId) async {
    if (state.status != QuizStatus.playing) return;

    final updatedAlarms =
        state.alarms.where((a) => a.id != alarmId).toList();
    final updatedDeleted = {...state.deletedAlarmIds, alarmId};

    state = state.copyWith(
      alarms: updatedAlarms,
      deletedAlarmIds: updatedDeleted,
      clearSwipedAlarmId: true,
    );

    final isClear = _useCase.isClear(
      alarmDeleted: updatedDeleted.contains(_targetAlarmId),
    );

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
    state = DeleteAlarmQuizState.initial(
      alarms: AlarmCatalog.initialAlarms,
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
