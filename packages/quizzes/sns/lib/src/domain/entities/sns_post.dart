import 'package:flutter/foundation.dart';

/// SNS投稿データモデル
@immutable
class SnsPost {
  /// コンストラクタ
  const SnsPost({
    required this.id,
    required this.userName,
    required this.userId,
    required this.content,
    this.imageUrl,
    required this.isLiked,
    required this.avatarColor,
  });

  /// 投稿の一意識別子
  final String id;

  /// 投稿者の表示名
  final String userName;

  /// 投稿者のユーザーID（@始まり）
  final String userId;

  /// 投稿本文
  final String content;

  /// 画像識別子（'cat' など）。null の場合は画像なし。
  final String? imageUrl;

  /// いいね済みかどうか
  final bool isLiked;

  /// プロフィールアイコンの背景色（ARGB int値）
  final int avatarColor;

  /// 指定フィールドを差し替えた新インスタンスを返す
  SnsPost copyWith({
    String? id,
    String? userName,
    String? userId,
    String? content,
    String? imageUrl,
    bool? isLiked,
    int? avatarColor,
  }) {
    return SnsPost(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      userId: userId ?? this.userId,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      isLiked: isLiked ?? this.isLiked,
      avatarColor: avatarColor ?? this.avatarColor,
    );
  }
}
