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

  /// スワイプ削除を確定（flutter_slidable が状態管理するため notifier では削除のみ行う）
  Future<void> confirmDelete(String alarmId) async {
    if (state.status != QuizStatus.playing) return;

    final updatedAlarms =
        state.alarms.where((a) => a.id != alarmId).toList();
    final updatedDeleted = {...state.deletedAlarmIds, alarmId};

    state = state.copyWith(
      alarms: updatedAlarms,
      deletedAlarmIds: updatedDeleted,
    );

    final isClear = _useCase.isClear(
      alarmDeleted: updatedDeleted.contains(_targetAlarmId),
    );

    if (isClear) {
      // 正解：対象アラーム（alarm_1）が削除された
      _timer?.cancel();
      final elapsed = _elapsed;
      state = state.copyWith(
        status: QuizStatus.correct,
        elapsedMs: elapsed,
      );
      await hapticFeedback.playSuccessFeedback();
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } else if (alarmId != _targetAlarmId) {
      // 不正解（終了）：間違ったアラームを削除した
      _timer?.cancel();
      final elapsed = _elapsed;
      state = state.copyWith(
        status: QuizStatus.incorrect,
        elapsedMs: elapsed,
        failureCount: state.failureCount + 1,
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
    final prevFailureCount = state.failureCount;
    state = DeleteAlarmQuizState.initial(
      alarms: AlarmCatalog.initialAlarms,
      timeLimitSeconds: _timeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      failureCount: prevFailureCount,
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
