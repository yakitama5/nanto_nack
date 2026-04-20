import 'dart:collection';

import 'package:todo/src/domain/todo_item.dart';

/// TODOアプリの共通UI状態
///
/// 各クイズの状態クラスに埋め込んで使用する。
/// [todos] は不変ビューとして公開し、外部からの直接変更を防ぐ。
class TodoAppState {
  TodoAppState({
    required List<TodoItem> todos,
    required this.isCompletedListExpanded,
  }) : todos = UnmodifiableListView(List.from(todos));

  /// 全タスクのリスト（読み取り専用）
  final UnmodifiableListView<TodoItem> todos;

  /// 「完了済み」アコーディオンが開いているかどうか（初期値 false）
  final bool isCompletedListExpanded;

  factory TodoAppState.initial({required List<TodoItem> items}) =>
      TodoAppState(
        todos: items,
        isCompletedListExpanded: false,
      );

  /// 未完了タスク（order 昇順）
  List<TodoItem> get incompleteTodos {
    final result = todos.where((t) => !t.isCompleted).toList()
      ..sort((a, b) => a.order.compareTo(b.order));
    return result;
  }

  /// 完了済みタスク
  List<TodoItem> get completedTodos =>
      todos.where((t) => t.isCompleted).toList();

  TodoAppState copyWith({
    List<TodoItem>? todos,
    bool? isCompletedListExpanded,
  }) {
    return TodoAppState(
      todos: todos != null ? List.from(todos) : this.todos.toList(),
      isCompletedListExpanded:
          isCompletedListExpanded ?? this.isCompletedListExpanded,
    );
  }
}
