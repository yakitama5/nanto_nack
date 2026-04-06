/// RemoteConfig の `daily_tips` で配信される Tips のモデル
class Tip {
  const Tip({
    required this.id,
    required this.title,
    required this.content,
  });

  factory Tip.fromJson(Map<String, dynamic> json) {
    return Tip(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
    );
  }

  final int id;
  final String title;
  final String content;

  Tip copyWith({int? id, String? title, String? content}) {
    return Tip(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }
}
