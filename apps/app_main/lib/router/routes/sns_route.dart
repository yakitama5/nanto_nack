import '../../config/route_path_constants.dart';

/// SNSカテゴリのルート定義
enum SnsRoute {
  list(kSnsListPath),
  quiz1(kSnsQuiz1Path),
  quiz2(kSnsQuiz2Path),
  quiz3(kSnsQuiz3Path),
  quiz4(kSnsQuiz4Path);

  const SnsRoute(this.path);

  /// ルートパス文字列
  final String path;
}
