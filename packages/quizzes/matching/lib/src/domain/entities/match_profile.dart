import 'dart:collection';

/// マッチングアプリのプロフィールエンティティ
class MatchProfile {
  const MatchProfile({
    required this.id,
    required this.name,
    required this.age,
    required this.bio,
    required List<String> imageUrls,
  }) : _imageUrls = imageUrls;

  final String id;

  /// プロフィール名（英語。UIではカスタム言語に変換して表示）
  final String name;

  /// 年齢
  final int age;

  /// 自己紹介文（英語。UIではカスタム言語に変換して表示）
  final String bio;

  final List<String> _imageUrls;

  /// プロフィール画像URLリスト（読み取り専用）
  UnmodifiableListView<String> get imageUrls => UnmodifiableListView(_imageUrls);

  MatchProfile copyWith({
    String? id,
    String? name,
    int? age,
    String? bio,
    List<String>? imageUrls,
  }) {
    return MatchProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      bio: bio ?? this.bio,
      imageUrls: imageUrls ?? _imageUrls,
    );
  }
}
