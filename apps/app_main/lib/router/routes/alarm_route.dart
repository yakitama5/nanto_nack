/// アラームカテゴリーのルートパスEnum。
enum AlarmRoute {
  list('/play/alarm'),
  quiz1('/play/alarm/quiz1'),
  quiz2('/play/alarm/quiz2'),
  quiz3('/play/alarm/quiz3'),
  quiz4('/play/alarm/quiz4');

  const AlarmRoute(this.path);
  final String path;
}
