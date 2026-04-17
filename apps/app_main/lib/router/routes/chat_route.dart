import '../../config/route_path_constants.dart';

/// チャットカテゴリーのルートパスEnum。
enum ChatRoute {
  list(kChatListPath),
  quiz1(kChatQuiz1Path),
  quiz2(kChatQuiz2Path),
  quiz3(kChatQuiz3Path),
  quiz4(kChatQuiz4Path);

  const ChatRoute(this.path);
  final String path;
}
