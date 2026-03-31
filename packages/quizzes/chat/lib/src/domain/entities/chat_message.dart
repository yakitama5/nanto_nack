/// チャットメッセージエンティティ
class ChatMessage {
  const ChatMessage({
    required this.id,
    required this.text,
    required this.isMine,
    required this.sentAt,
    this.isStamp = false,
    this.stampId,
    this.isDeleted = false,
  });

  final String id;

  /// メッセージ本文（カスタム言語で表示する英語テキスト）
  final String text;

  /// 自分のメッセージかどうか
  final bool isMine;

  final DateTime sentAt;

  /// スタンプメッセージかどうか
  final bool isStamp;

  /// スタンプ ID（isStamp が true の場合）
  final String? stampId;

  /// 削除済みかどうか
  final bool isDeleted;

  ChatMessage copyWith({
    String? id,
    String? text,
    bool? isMine,
    DateTime? sentAt,
    bool? isStamp,
    String? stampId,
    bool? isDeleted,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      text: text ?? this.text,
      isMine: isMine ?? this.isMine,
      sentAt: sentAt ?? this.sentAt,
      isStamp: isStamp ?? this.isStamp,
      stampId: stampId ?? this.stampId,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
