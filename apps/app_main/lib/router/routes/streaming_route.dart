/// 動画カテゴリーのルートパスEnum。
enum StreamingRoute {
  list('/play/streaming'),
  quiz1('/play/streaming/quiz1'),
  quiz2('/play/streaming/quiz2'),
  quiz3('/play/streaming/quiz3'),
  quiz4('/play/streaming/quiz4');

  const StreamingRoute(this.path);
  final String path;
}
