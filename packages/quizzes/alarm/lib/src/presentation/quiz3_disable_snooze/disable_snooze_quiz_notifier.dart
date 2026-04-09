import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../application/quiz_disable_snooze_use_case.dart';
import '../../domain/alarm_catalog.dart';
import '../../infrastructure/alarm_quiz_repository_provider.dart';
import 'disable_snooze_quiz_state.dart';

final disableSnoozeQuizProvider = AutoDisposeNotifierProvider<
    DisableSnoozeQuizNotifier, DisableSnoozeQuizState>(
  DisableSnoozeQuizNotifier.new,
);

/// Quiz 3「スヌーズをオフにする」のNotifier
class DisableSnoozeQuizNotifier
    extends AutoDisposeNotifier<DisableSnoozeQuizState> {
  static const _quizId = 'alarm_quiz3';
  static const _timeLimitSeconds = 60;
  // Quiz3の対象アラーム：一番上（1番目）のアラーム
  static const _targetAlarmId = 'alarm_1';

  final _useCase = const QuizDisableSnoozeUseCase();
  Timer? _timer;

  @override
  DisableSnoozeQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return DisableSnoozeQuizState.initial(
      alarm: AlarmCatalog.initialAlarms[0],
      timeLimitSeconds: _timeLimitSeconds,
    );
  }

  /// クイズを開始する
  void startQuiz() {
    _timer?.cancel();
    state = DisableSnoozeQuizState.initial(
      alarm: AlarmCatalog.initialAlarms[0],
      timeLimitSeconds: _timeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  /// アラームをタップ → 編集フォームを表示（タップしたアラームをドラフトとして設定）
  void tapAlarm(String alarmId) {
    if (state.status != QuizStatus.playing) return;
    final alarm = AlarmCatalog.initialAlarms.firstWhere(
      (a) => a.id == alarmId,
      orElse: () => AlarmCatalog.initialAlarms[0],
    );
    state = state.copyWith(draftAlarm: alarm, showEditForm: true);
  }

  /// キャンセルボタン → 一覧へ戻る（ドラフトを対象アラームにリセット）
  void tapCancel() {
    state = state.copyWith(
      showEditForm: false,
      draftAlarm: AlarmCatalog.initialAlarms[0],
    );
  }

  /// スヌーズトグルを操作
  void toggleSnooze(bool enabled) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      draftAlarm: state.draftAlarm.copyWith(snoozeEnabled: enabled),
    );
  }

  /// 時刻変更コールバック
  void changeTime(int hour, int minute) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      draftAlarm: state.draftAlarm.copyWith(hour: hour, minute: minute),
    );
  }

  /// 保存ボタンをタップ
  Future<void> tapSave() async {
    if (state.status != QuizStatus.playing) return;

    final isTargetAlarm = state.draftAlarm.id == _targetAlarmId;
    final isClear = _useCase.isClear(
      snoozeEnabled: state.draftAlarm.snoozeEnabled,
      saved: true,
    );

    if (isTargetAlarm && isClear) {
      // 正解：対象アラームのスヌーズがオフになっている
      _timer?.cancel();
      final elapsed = _elapsed;
      state = state.copyWith(
        saved: true,
        status: QuizStatus.correct,
        elapsedMs: elapsed,
      );
      await hapticFeedback.playSuccessFeedback();
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } else if (!isTargetAlarm) {
      // 不正解（終了）：対象外アラームを変更した
      _timer?.cancel();
      final elapsed = _elapsed;
      state = state.copyWith(
        status: QuizStatus.incorrect,
        elapsedMs: elapsed,
        failureCount: state.failureCount + 1,
      );
      await hapticFeedback.playErrorFeedback();
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } else {
      // 不正解（継続）：対象アラームだがスヌーズがまだオン
      state = state.copyWith(
        saved: true,
        failureCount: state.failureCount + 1,
      );
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
    state = DisableSnoozeQuizState.initial(
      alarm: AlarmCatalog.initialAlarms[0],
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
