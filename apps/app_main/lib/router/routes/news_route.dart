import '../../config/route_path_constants.dart';

/// ニュースカテゴリーのルートパスEnum。
enum NewsRoute {
  list(kNewsListPath),
  quiz1(kNewsQuiz1Path),
  quiz2(kNewsQuiz2Path),
  quiz3(kNewsQuiz3Path),
  quiz4(kNewsQuiz4Path);

  const NewsRoute(this.path);
  final String path;
}
