import '../../config/route_path_constants.dart';

/// メールカテゴリーのルートパスEnum。
enum MailRoute {
  list(kMailListPath),
  quiz1(kMailQuiz1Path),
  quiz2(kMailQuiz2Path),
  quiz3(kMailQuiz3Path),
  quiz4(kMailQuiz4Path);

  const MailRoute(this.path);
  final String path;
}
