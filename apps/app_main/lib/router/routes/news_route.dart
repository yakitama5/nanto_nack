/// ニュースカテゴリーのルートパスEnum。
enum NewsRoute {
  list('/play/news'),
  quiz1('/play/news/quiz1'),
  quiz2('/play/news/quiz2'),
  quiz3('/play/news/quiz3'),
  quiz4('/play/news/quiz4');

  const NewsRoute(this.path);
  final String path;
}
