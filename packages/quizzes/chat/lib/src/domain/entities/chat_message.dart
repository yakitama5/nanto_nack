/// null をセンチネルとして区別するためのユニークな定数
const _absent = Object();

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
    this.reaction,
    this.isImage = false,
    this.imagePath,
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

  /// リアクション絵文字（nullable）。
  /// 相手のメッセージに付いたリアクションを保持する。
  final String? reaction;

  /// 画像メッセージかどうか
  final bool isImage;

  /// 画像ファイルのパス（isImage が true かつ端末から選択された場合）
  final String? imagePath;

  /// [reaction] は nullable フィールドのため、明示的に null に戻せるよう
  /// sentinel パターン（_absent）を使用している。
  ChatMessage copyWith({
    String? id,
    String? text,
    bool? isMine,
    DateTime? sentAt,
    bool? isStamp,
    String? stampId,
    bool? isDeleted,
    // ignore: avoid_annotating_with_dynamic
    Object? reaction = _absent,
    bool? isImage,
    String? imagePath,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      text: text ?? this.text,
      isMine: isMine ?? this.isMine,
      sentAt: sentAt ?? this.sentAt,
      isStamp: isStamp ?? this.isStamp,
      stampId: stampId ?? this.stampId,
      isDeleted: isDeleted ?? this.isDeleted,
      reaction: identical(reaction, _absent)
          ? this.reaction
          : reaction as String?,
      isImage: isImage ?? this.isImage,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
