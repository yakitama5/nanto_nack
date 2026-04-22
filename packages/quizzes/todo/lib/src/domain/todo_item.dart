/// TODOアプリのタスクエンティティ
class TodoItem {
  const TodoItem({
    required this.id,
    required this.titleKey,
    required this.emoji,
    required this.order,
    this.isCompleted = false,
    this.isImportant = false,
  });

  /// タスクの一意ID
  final String id;

  /// タスク名のi18nキー（slangのcommon.tasksに対応するキー名）
  final String titleKey;

  /// タスク内容を視覚的に示す絵文字（テキストが難読化されていても内容を推測できるようにする）
  final String emoji;

  /// 完了フラグ（初期値 false）
  final bool isCompleted;

  /// 重要フラグ（初期値 false）
  final bool isImportant;

  /// 表示順序
  final int order;

  TodoItem copyWith({
    String? id,
    String? titleKey,
    String? emoji,
    bool? isCompleted,
    bool? isImportant,
    int? order,
  }) {
    return TodoItem(
      id: id ?? this.id,
      titleKey: titleKey ?? this.titleKey,
      emoji: emoji ?? this.emoji,
      isCompleted: isCompleted ?? this.isCompleted,
      isImportant: isImportant ?? this.isImportant,
      order: order ?? this.order,
    );
  }
}
