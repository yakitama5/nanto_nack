/// チャットカテゴリーのルートパスEnum。
enum ChatRoute {
  list('/play/chat'),
  quiz1('/play/chat/quiz1'),
  quiz2('/play/chat/quiz2'),
  quiz3('/play/chat/quiz3'),
  quiz4('/play/chat/quiz4');

  const ChatRoute(this.path);
  final String path;
}
