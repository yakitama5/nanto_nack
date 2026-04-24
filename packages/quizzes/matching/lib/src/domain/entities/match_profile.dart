import 'dart:collection';

/// マッチングアプリのプロフィールエンティティ
class MatchProfile {
  const MatchProfile({
    required this.id,
    required this.name,
    required this.age,
    required this.bio,
    required List<String> emojis,
  }) : _emojis = emojis;

  final String id;

  /// プロフィール名（英語。UIではカスタム言語に変換して表示）
  final String name;

  /// 年齢
  final int age;

  /// 自己紹介文（英語。UIではカスタム言語に変換して表示）
  final String bio;

  final List<String> _emojis;

  /// プロフィール表示用絵文字リスト（読み取り専用）
  UnmodifiableListView<String> get emojis => UnmodifiableListView(_emojis);

  MatchProfile copyWith({
    String? id,
    String? name,
    int? age,
    String? bio,
    List<String>? emojis,
  }) {
    return MatchProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      bio: bio ?? this.bio,
      emojis: emojis ?? _emojis,
    );
  }
}
