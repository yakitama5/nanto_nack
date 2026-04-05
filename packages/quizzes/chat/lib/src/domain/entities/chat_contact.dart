/// チャット連絡先エンティティ
class ChatContact {
  const ChatContact({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.lastMessageAt,
    this.unreadCount = 0,
    this.isOnline = false,
  });

  final String id;

  /// 連絡先名（カスタム言語で表示する英語テキスト）
  final String name;

  /// 最後のメッセージ（カスタム言語で表示する英語テキスト）
  final String lastMessage;

  final DateTime lastMessageAt;
  final int unreadCount;
  final bool isOnline;

  ChatContact copyWith({
    String? id,
    String? name,
    String? lastMessage,
    DateTime? lastMessageAt,
    int? unreadCount,
    bool? isOnline,
  }) {
    return ChatContact(
      id: id ?? this.id,
      name: name ?? this.name,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageAt: lastMessageAt ?? this.lastMessageAt,
      unreadCount: unreadCount ?? this.unreadCount,
      isOnline: isOnline ?? this.isOnline,
    );
  }
}
