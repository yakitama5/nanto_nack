import '../../config/route_path_constants.dart';

/// マップカテゴリーのルートパスEnum。
enum MapRoute {
  list(kMapListPath),
  quiz1(kMapQuiz1Path),
  quiz2(kMapQuiz2Path),
  quiz3(kMapQuiz3Path),
  quiz4(kMapQuiz4Path);

  const MapRoute(this.path);
  final String path;
}
