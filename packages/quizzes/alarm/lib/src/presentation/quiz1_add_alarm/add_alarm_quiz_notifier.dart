import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../application/quiz_add_alarm_use_case.dart';
import '../../domain/alarm_catalog.dart';
import '../../infrastructure/alarm_quiz_repository_provider.dart';
import 'add_alarm_quiz_state.dart';

final addAlarmQuizProvider =
    AutoDisposeNotifierProvider<AddAlarmQuizNotifier, AddAlarmQuizState>(
  AddAlarmQuizNotifier.new,
);

/// Quiz 1「アラームを追加する」のNotifier
class AddAlarmQuizNotifier extends AutoDisposeNotifier<AddAlarmQuizState> {
  static const _quizId = 'alarm_quiz1';
  static const _timeLimitSeconds = 30;

  final _useCase = const QuizAddAlarmUseCase();
  Timer? _timer;

  @override
  AddAlarmQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return AddAlarmQuizState.initial(
      draft: AlarmCatalog.newAlarmDefault,
      timeLimitSeconds: _timeLimitSeconds,
    );
  }

  /// クイズを開始する
  void startQuiz() {
    _timer?.cancel();
    state = AddAlarmQuizState.initial(
      draft: AlarmCatalog.newAlarmDefault,
      timeLimitSeconds: _timeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    _startTimer();
  }

  /// ＋ボタンをタップ → 編集フォームへ
  void tapAdd() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(showEditForm: true);
  }

  /// 保存ボタンをタップ → クリア
  Future<void> tapSave() async {
    if (state.status != QuizStatus.playing) return;

    final isClear = _useCase.isClear(alarmSaved: true);
    if (isClear) {
      _timer?.cancel();
      final elapsed = _elapsed;
      state = state.copyWith(
        alarmSaved: true,
        status: QuizStatus.correct,
        elapsedMs: elapsed,
      );
      await hapticFeedback.playSuccessFeedback();
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    }
  }

  /// キャンセルボタン → 一覧へ戻る
  void tapCancel() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(showEditForm: false);
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
    state = AddAlarmQuizState.initial(
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
