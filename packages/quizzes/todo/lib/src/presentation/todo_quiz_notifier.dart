import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/src/domain/todo_catalog.dart';
import 'package:todo/src/domain/todo_item.dart';
import 'package:todo/src/domain/todo_quiz_config.dart';
import 'package:todo/src/infrastructure/todo_quiz_repository_provider.dart';
import 'package:todo/src/presentation/todo_app_state.dart';
import 'package:todo/src/presentation/todo_quiz_state.dart';
import 'package:todo/src/presentation/todo_quiz_type.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

/// TODOクイズの統合 Provider。
///
/// [TodoQuizType] を family 引数に渡すことで Quiz1〜4 のどれかを指定する。
/// ```dart
/// ref.watch(todoQuizProvider(TodoQuizType.complete))
/// ref.read(todoQuizProvider(TodoQuizType.complete).notifier).toggleCompletion('todo_buy_milk')
/// ```
final todoQuizProvider = NotifierProvider.autoDispose
    .family<TodoQuizNotifier, TodoQuizState, TodoQuizType>(
  TodoQuizNotifier.new,
);

/// TODOクイズ共通の Notifier。
///
/// Quiz1〜4 のすべての挙動を1つにまとめ、クイズ種別 ([arg]) によって
/// クリア条件を切り替える。
class TodoQuizNotifier
    extends AutoDisposeFamilyNotifier<TodoQuizState, TodoQuizType> {
  Timer? _timer;

  /// クイズ種別に対応する永続化ID
  String get _quizId => switch (arg) {
        TodoQuizType.complete => 'todo_quiz1',
        TodoQuizType.reorder => 'todo_quiz2',
        TodoQuizType.markImportant => 'todo_quiz3',
        TodoQuizType.uncomplete => 'todo_quiz4',
      };

  /// Quiz4のみ todo_meeting_prep を isCompleted=true で初期化する
  List<TodoItem> get _initialItems =>
      TodoCatalog.items(forQuiz4: arg == TodoQuizType.uncomplete);

  @override
  TodoQuizState build(TodoQuizType arg) {
    ref.onDispose(() => _timer?.cancel());
    return TodoQuizState.initial(initialItems: _initialItems);
  }

  // ─────────────────────────────────────────────
  // 共通アクション
  // ─────────────────────────────────────────────

  void startQuiz() {
    _timer?.cancel();
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      remainingSeconds: TodoQuizConfig.timeLimitSeconds,
      todoApp: TodoAppState.initial(items: _initialItems),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  Future<void> giveUp() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();
    final elapsed = _elapsed;
    state = state.copyWith(status: QuizStatus.giveUp, elapsedMs: elapsed);
    unawaited(
      ref.read(analyticsServiceProvider).logQuizGivenUp(quizId: _quizId),
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (error, stackTrace) {
      appLogger.e(
        '[TodoQuizNotifier] giveUp: _saveResult failed',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  void retry() {
    if (state.status == QuizStatus.playing) return;
    _timer?.cancel();
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: _quizId);
    state = TodoQuizState.initial(initialItems: _initialItems).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    _startTimer();
  }

  // ─────────────────────────────────────────────
  // Quiz1 / Quiz4: 完了切り替え
  // ─────────────────────────────────────────────

  /// タスクの完了/未完了を切り替える。
  ///
  /// - Quiz1: todo_buy_milk が isCompleted=true になったらクリア
  /// - Quiz4: todo_meeting_prep が isCompleted=false に戻ったらクリア
  void toggleCompletion(String id) {
    if (state.status != QuizStatus.playing) return;

    final target = state.todoApp.todos.where((t) => t.id == id).firstOrNull;
    if (target == null) return;

    final updated = state.todoApp.todos
        .map((t) => t.id == id ? t.copyWith(isCompleted: !t.isCompleted) : t)
        .toList();
    state = state.copyWith(
      todoApp: state.todoApp.copyWith(todos: updated),
    );

    // クリア判定
    final newCompleted = !target.isCompleted;
    if (arg == TodoQuizType.complete &&
        id == TodoQuizConfig.quiz1TargetId &&
        newCompleted) {
      _onClear();
    } else if (arg == TodoQuizType.uncomplete &&
        id == TodoQuizConfig.quiz4TargetId &&
        !newCompleted) {
      _onClear();
    }
  }

  // ─────────────────────────────────────────────
  // Quiz2: タスクの並び替え
  // ─────────────────────────────────────────────

  /// 未完了リスト内でタスクを並び替える。
  ///
  /// ReorderableListView から渡される oldIndex/newIndex を受け取り、
  /// 未完了タスクの order を付け直す。
  /// Quiz2: reorder 後に todo_planning_doc が未完了リスト先頭（index=0）になったらクリア。
  void reorderTodo(int oldIndex, int newIndex) {
    if (state.status != QuizStatus.playing) return;

    // ReorderableListView のコールバック仕様に合わせてインデックスを補正する。
    // 下方向に移動する場合、newIndex は実際の挿入位置より1大きい値になる。
    final adjustedNewIndex = newIndex > oldIndex ? newIndex - 1 : newIndex;

    final incompletes = state.todoApp.incompleteTodos;
    if (oldIndex < 0 ||
        oldIndex >= incompletes.length ||
        adjustedNewIndex < 0 ||
        adjustedNewIndex >= incompletes.length) return;

    // 並び替えロジック: 指定インデックスの要素を新しい位置に移動する
    final mutable = List<TodoItem>.from(incompletes);
    final item = mutable.removeAt(oldIndex);
    mutable.insert(adjustedNewIndex, item);

    // order を 0 から振り直す
    final withNewOrder = mutable.asMap().entries.map((e) {
      return e.value.copyWith(order: e.key);
    }).toList();

    // 完了済みタスクに新しい order を末尾から割り当てる
    final completed = state.todoApp.completedTodos;
    final completedWithOrder = completed.asMap().entries.map((e) {
      return e.value.copyWith(order: withNewOrder.length + e.key);
    }).toList();

    final allTodos = [...withNewOrder, ...completedWithOrder];
    state = state.copyWith(
      todoApp: state.todoApp.copyWith(todos: allTodos),
    );

    // クリア判定: Quiz2 で todo_planning_doc が未完了リスト先頭 (index=0) になったか
    if (arg == TodoQuizType.reorder) {
      final newIncompletes = state.todoApp.incompleteTodos;
      if (newIncompletes.isNotEmpty &&
          newIncompletes.first.id == TodoQuizConfig.quiz2TargetId) {
        _onClear();
      }
    }
  }

  // ─────────────────────────────────────────────
  // Quiz3: 重要マーク切り替え
  // ─────────────────────────────────────────────

  /// タスクの重要フラグを切り替える。
  ///
  /// Quiz3: todo_rent_payment が isImportant=true になったらクリア。
  void toggleImportant(String id) {
    if (state.status != QuizStatus.playing) return;

    final target = state.todoApp.todos.where((t) => t.id == id).firstOrNull;
    if (target == null) return;

    final updated = state.todoApp.todos
        .map((t) => t.id == id ? t.copyWith(isImportant: !t.isImportant) : t)
        .toList();
    state = state.copyWith(
      todoApp: state.todoApp.copyWith(todos: updated),
    );

    // クリア判定
    final newImportant = !target.isImportant;
    if (arg == TodoQuizType.markImportant &&
        id == TodoQuizConfig.quiz3TargetId &&
        newImportant) {
      _onClear();
    }
  }

  // ─────────────────────────────────────────────
  // 完了済みアコーディオン
  // ─────────────────────────────────────────────

  /// 「完了済み」アコーディオンの開閉を切り替える
  void toggleCompletedListExpansion() {
    state = state.copyWith(
      todoApp: state.todoApp.copyWith(
        isCompletedListExpanded: !state.todoApp.isCompletedListExpanded,
      ),
    );
  }

  // ─────────────────────────────────────────────
  // Private helpers
  // ─────────────────────────────────────────────

  int get _elapsed => state.startedAt != null
      ? clock.now().difference(state.startedAt!).inMilliseconds
      : 0;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.status != QuizStatus.playing) {
        _timer?.cancel();
        return;
      }
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
    state = state.copyWith(status: QuizStatus.timeUp, elapsedMs: elapsed);
    unawaited(
      ref.read(analyticsServiceProvider).logQuizGivenUp(quizId: _quizId),
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (error, stackTrace) {
      appLogger.e(
        '[TodoQuizNotifier] _onTimeUp: _saveResult failed',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// クリア処理
  ///
  /// autoDispose により dispose 後に ref.read すると例外になるため、
  /// 永続化処理を先に完了させてから haptic を再生する。
  Future<void> _onClear() async {
    _timer?.cancel();
    final elapsed = _elapsed;
    state = state.copyWith(status: QuizStatus.correct, elapsedMs: elapsed);
    try {
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } catch (error, stackTrace) {
      appLogger.e(
        '[TodoQuizNotifier] _onClear: _saveResult failed',
        error: error,
        stackTrace: stackTrace,
      );
    } finally {
      await hapticFeedback.playSuccessFeedback();
    }
  }

  Future<void> _saveResult({
    required bool isCleared,
    required int elapsedMs,
  }) async {
    // autoDispose のため await 後に ref.read すると dispose 済み例外が発生する。
    // 必要なリソースをすべて await の前に取り出しておく。
    final repo = ref.read(todoQuizRepositoryProvider);
    final score = state.score;
    final failureCount = state.failureCount;
    if (isCleared) {
      await ref.read(analyticsServiceProvider).logQuizCompleted(
            quizId: _quizId,
            score: score,
            failureCount: failureCount,
            clearTimeMs: elapsedMs,
          );
    }
    await repo.saveResult(
      quizId: _quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? score : 0,
      failureCount: failureCount,
    );
  }
}
