import '../../config/route_path_constants.dart';

/// マッチングカテゴリーのルートパスEnum。
enum MatchingRoute {
  list(kMatchingListPath),
  quiz1(kMatchingQuiz1Path),
  quiz2(kMatchingQuiz2Path),
  quiz3(kMatchingQuiz3Path),
  quiz4(kMatchingQuiz4Path);

  const MatchingRoute(this.path);
  final String path;
}
