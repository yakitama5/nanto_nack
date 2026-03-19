/// 毎日ランダムに表示する UI/UX Tips エンティティ
class DailyTip {
  const DailyTip({
    required this.id,
    required this.title,
    required this.content,
  });

  final String id;
  final String title;
  final String content;

  DailyTip copyWith({
    String? id,
    String? title,
    String? content,
  }) {
    return DailyTip(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }
}
