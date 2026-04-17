import 'dart:async';

import 'package:clock/clock.dart';
import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../application/quiz_calendar_use_case.dart';
import '../domain/entities/calendar_event.dart';
import '../infrastructure/calendar_quiz_repository_provider.dart';
import 'calendar_quiz_state.dart';
import 'calendar_quiz_type.dart';

/// カレンダークイズ Notifier の Provider（全4クイズ共通）
///
/// Family で [CalendarQuizType] を受け取り、クイズごとに独立した状態を管理する。
/// ```dart
/// ref.watch(calendarQuizNotifierProvider(CalendarQuizType.quiz1))
/// ref.read(calendarQuizNotifierProvider(CalendarQuizType.quiz1).notifier).startQuiz()
/// ```
final calendarQuizNotifierProvider =
    NotifierProvider.autoDispose.family<CalendarQuizNotifier, CalendarQuizState,
        CalendarQuizType>(
  CalendarQuizNotifier.new,
);

/// カレンダークイズの状態管理 Notifier
class CalendarQuizNotifier
    extends AutoDisposeFamilyNotifier<CalendarQuizState, CalendarQuizType> {
  static const _useCase = QuizCalendarUseCase();
  late CrCalendarController _controller;
  Timer? _timer;

  /// cr_calendar のコントローラ（画面から参照するために公開）
  CrCalendarController get controller => _controller;

  @override
  CalendarQuizState build(CalendarQuizType arg) {
    // clock.now() でテスト時に差し替え可能な現在時刻を取得
    final now = clock.now();
    final initialState = CalendarQuizState.initial(arg, now);

    // onSwipe は (int year, int month) を受け取る（cr_calendar 1.3.0 の仕様）
    _controller = CrCalendarController(
      onSwipe: (int year, int month) {
        if (state.status != QuizStatus.playing) return;
        final newMonth = DateTime(year, month);
        state = state.copyWith(focusedMonth: newMonth);
        _checkClearCondition();
      },
    );

    ref.onDispose(() {
      _timer?.cancel();
      _controller.dispose();
    });

    return initialState;
  }

  /// クイズを開始する
  void startQuiz() {
    _timer?.cancel();
    // clock.now() でテスト差し替え可能にする
    final now = clock.now();
    final initialState = CalendarQuizState.initial(arg, now);
    state = initialState.copyWith(
      status: QuizStatus.playing,
      startedAt: now,
    );

    // Quiz4: 初期月が3年後のため、コントローラをその月に移動する
    if (arg == CalendarQuizType.quiz4) {
      _controller.goToDate(state.initialMonth);
    }

    ref.read(analyticsServiceProvider).logQuizStarted(quizId: arg.quizId);
    _startTimer();
  }

  /// 指定日付に新しい予定を追加する（Quiz2のクリア条件）
  void addEvent(DateTime date, String title) {
    if (state.status != QuizStatus.playing) return;
    final newEvent = _createEvent(date, title);
    final newEvents = [...state.events, newEvent];
    state = state.copyWith(events: newEvents);
    _checkClearCondition();
  }

  /// 予定を別の日付に移動する（Quiz3のクリア条件）
  void moveEvent(String eventId, DateTime newDate) {
    if (state.status != QuizStatus.playing) return;
    final eventIndex = state.events.indexWhere((e) => e.id == eventId);
    if (eventIndex == -1) return;

    final event = state.events[eventIndex];
    final duration = event.end.difference(event.begin);
    final newBegin = DateTime(
      newDate.year,
      newDate.month,
      newDate.day,
      event.begin.hour,
      event.begin.minute,
    );
    final movedEvent = event.copyWith(
      begin: newBegin,
      end: newBegin.add(duration),
    );

    final newEvents = [...state.events];
    newEvents[eventIndex] = movedEvent;
    state = state.copyWith(events: newEvents);
    _checkClearCondition();
  }

  /// AppBarの「今日」ボタンを押して今月へジャンプする（Quiz4のクリア条件）
  void jumpToToday() {
    if (state.status != QuizStatus.playing) return;
    // clock.now() でテスト差し替え可能にする
    final now = clock.now();
    final today = DateTime(now.year, now.month);
    // goToDate で指定月へ移動（cr_calendar 1.3.0 の公式API）
    _controller.goToDate(today);
    state = state.copyWith(focusedMonth: today);
    _checkClearCondition();
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
      ref.read(analyticsServiceProvider).logQuizGivenUp(quizId: arg.quizId),
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } on Exception catch (error, stackTrace) {
      appLogger.e('giveUp save failed', error: error, stackTrace: stackTrace);
    }
  }

  /// クイズをリトライする
  void retry() {
    _timer?.cancel();
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: arg.quizId);
    final now = clock.now();
    final initialState = CalendarQuizState.initial(arg, now);
    state = initialState.copyWith(
      status: QuizStatus.playing,
      startedAt: now,
    );
    if (arg == CalendarQuizType.quiz4) {
      _controller.goToDate(state.initialMonth);
    }
    _startTimer();
  }

  // ---- Private helpers ----

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
    } on Exception catch (error, stackTrace) {
      appLogger.e('timeUp save failed', error: error, stackTrace: stackTrace);
    }
  }

  void _checkClearCondition() {
    if (state.status != QuizStatus.playing) return;

    final isClear = switch (arg) {
      CalendarQuizType.quiz1 => _useCase.isClearQuiz1(
          focusedMonth: state.focusedMonth,
          initialMonth: state.initialMonth,
        ),
      CalendarQuizType.quiz2 => _useCase.isClearQuiz2(
          events: state.events,
          targetMonth: state.initialMonth,
        ),
      CalendarQuizType.quiz3 => _useCase.isClearQuiz3(
          events: state.events,
          originalDate: state.quizStartTime,
        ),
      CalendarQuizType.quiz4 => _useCase.isClearQuiz4(
          focusedMonth: state.focusedMonth,
          now: state.quizStartTime,
        ),
    };
    if (!isClear) return;

    _timer?.cancel();
    final elapsed = _elapsed;
    state = state.copyWith(
      status: QuizStatus.correct,
      elapsedMs: elapsed,
    );
    // haptic は ref を使わないため呼び出し可能
    hapticFeedback.playSuccessFeedback();
    // ignore: discarded_futures
    _saveResult(isCleared: true, elapsedMs: elapsed);
  }

  Future<void> _saveResult({
    required bool isCleared,
    required int elapsedMs,
  }) async {
    // autoDispose Provider のため、await をまたいで ref.read を使う前に
    // 必要な参照を変数に取り出しておく（dispose 後のアクセスを防ぐ）
    final analyticsService = ref.read(analyticsServiceProvider);
    final repo = ref.read(calendarQuizRepositoryProvider);

    if (isCleared) {
      await analyticsService.logQuizCompleted(
        quizId: arg.quizId,
        score: state.score,
        failureCount: state.failureCount,
        clearTimeMs: elapsedMs,
      );
    }
    await repo.saveResult(
      quizId: arg.quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
  }

  /// 新しい予定を生成する
  CalendarEvent _createEvent(DateTime date, String title) {
    return CalendarEvent(
      id: 'calendar_added_${date.millisecondsSinceEpoch}',
      title: title,
      begin: DateTime(date.year, date.month, date.day, 9),
      end: DateTime(date.year, date.month, date.day, 10),
      color: Colors.blue,
    );
  }
}
