import 'package:quiz_core/quiz_core.dart';
import 'package:todo/src/domain/todo_item.dart';
import 'package:todo/src/domain/todo_quiz_config.dart';
import 'package:todo/src/presentation/todo_app_state.dart';

/// TODOクイズ共通の状態
///
/// Quiz1〜4 すべてで共通して使用する。
class TodoQuizState extends QuizStateBase {
  const TodoQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.todoApp,
    required this.remainingSeconds,
    this.hintUsed = false,
  });

  final TodoAppState todoApp;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// ヒントを使用済みかどうか
  final bool hintUsed;

  TodoQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    TodoAppState? todoApp,
    int? remainingSeconds,
    bool? hintUsed,
  }) {
    return TodoQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      todoApp: todoApp ?? this.todoApp,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      hintUsed: hintUsed ?? this.hintUsed,
    );
  }

  factory TodoQuizState.initial({
    required List<TodoItem> initialItems,
  }) =>
      TodoQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        todoApp: TodoAppState.initial(items: initialItems),
        remainingSeconds: TodoQuizConfig.timeLimitSeconds,
        hintUsed: false,
      );
}
