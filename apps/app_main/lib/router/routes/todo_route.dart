import '../../config/route_path_constants.dart';

/// TODOカテゴリーのルートパスEnum。
enum TodoRoute {
  list(kTodoListPath),
  quiz1(kTodoQuiz1Path),
  quiz2(kTodoQuiz2Path),
  quiz3(kTodoQuiz3Path),
  quiz4(kTodoQuiz4Path);

  const TodoRoute(this.path);
  final String path;
}
