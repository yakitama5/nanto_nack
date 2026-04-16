/// マップカテゴリーのルートパスEnum。
enum MapRoute {
  list('/play/map'),
  quiz1('/play/map/quiz1'),
  quiz2('/play/map/quiz2'),
  quiz3('/play/map/quiz3'),
  quiz4('/play/map/quiz4');

  const MapRoute(this.path);
  final String path;
}
