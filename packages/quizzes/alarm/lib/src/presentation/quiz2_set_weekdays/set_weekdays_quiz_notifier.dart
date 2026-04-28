import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

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
  // Quiz2の対象アラーム：真ん中（2番目）のアラーム
  static const _targetAlarmId = 'alarm_2';

  final _useCase = const QuizSetWeekdaysUseCase();
  Timer? _timer;

  @override
  SetWeekdaysQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    // Quiz2では最初にアラーム一覧を表示し、alarm_2（真ん中）をタップさせる
    return SetWeekdaysQuizState.initial(
      draft: AlarmCatalog.initialAlarms[1],
    );
  }

  /// クイズを開始する
  void startQuiz() {
    if (state.status != QuizStatus.idle) return;
    state = SetWeekdaysQuizState.initial(
      draft: AlarmCatalog.initialAlarms[1],
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
      orElse: () => AlarmCatalog.initialAlarms[1],
    );
    state = state.copyWith(draftAlarm: alarm, showEditForm: true);
  }

  /// キャンセルボタン → 一覧へ戻る（ドラフトを対象アラームにリセット）
  void tapCancel() {
    state = state.copyWith(
      showEditForm: false,
      draftAlarm: AlarmCatalog.initialAlarms[1],
    );
  }

  /// 曜日ボタンをタップ（選択状態をトグル、正誤判定は保存時に行う）
  void toggleDay(int dayIndex) {
    if (state.status != QuizStatus.playing) return;

    final current = Set<int>.from(state.draftAlarm.activeDays);
    if (current.contains(dayIndex)) {
      current.remove(dayIndex);
    } else {
      current.add(dayIndex);
    }
    final updated = state.draftAlarm.copyWith(activeDays: current);
    state = state.copyWith(draftAlarm: updated);
  }

  /// 保存ボタンをタップ → 正誤判定
  Future<void> tapSave() async {
    if (state.status != QuizStatus.playing) return;

    final isTargetAlarm = state.draftAlarm.id == _targetAlarmId;
    final hasCorrectDays =
        _useCase.isClear(activeDays: state.draftAlarm.activeDays);

    if (isTargetAlarm && hasCorrectDays) {
      // 正解：対象アラームに平日（月〜金）のみが選択されている
      _timer?.cancel();
      final elapsed = _elapsed;
      state = state.copyWith(status: QuizStatus.correct, elapsedMs: elapsed);
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
      // 不正解（継続）：対象アラームだが曜日選択が間違っている
      state = state.copyWith(failureCount: state.failureCount + 1);
    }
  }

  /// 時刻変更コールバック
  void changeTime(int hour, int minute) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      draftAlarm: state.draftAlarm.copyWith(hour: hour, minute: minute),
    );
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
    state = SetWeekdaysQuizState.initial(
      draft: AlarmCatalog.initialAlarms[1],
    ).copyWith(failureCount: prevFailureCount);
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
