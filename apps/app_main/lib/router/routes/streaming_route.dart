import '../../config/route_path_constants.dart';

/// 動画カテゴリーのルートパスEnum。
enum StreamingRoute {
  list(kStreamingListPath),
  quiz1(kStreamingQuiz1Path),
  quiz2(kStreamingQuiz2Path),
  quiz3(kStreamingQuiz3Path),
  quiz4(kStreamingQuiz4Path);

  const StreamingRoute(this.path);
  final String path;
}
