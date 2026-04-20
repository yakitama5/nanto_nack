/// TODOアプリのタスクエンティティ
class TodoItem {
  const TodoItem({
    required this.id,
    required this.title,
    required this.order,
    this.isCompleted = false,
    this.isImportant = false,
  });

  /// タスクの一意ID
  final String id;

  /// タスク名
  final String title;

  /// 完了フラグ（初期値 false）
  final bool isCompleted;

  /// 重要フラグ（初期値 false）
  final bool isImportant;

  /// 表示順序
  final int order;

  TodoItem copyWith({
    String? id,
    String? title,
    bool? isCompleted,
    bool? isImportant,
    int? order,
  }) {
    return TodoItem(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      isImportant: isImportant ?? this.isImportant,
      order: order ?? this.order,
    );
  }
}
