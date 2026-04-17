import '../../config/route_path_constants.dart';

/// アラームカテゴリーのルートパスEnum。
enum AlarmRoute {
  list(kAlarmListPath),
  quiz1(kAlarmQuiz1Path),
  quiz2(kAlarmQuiz2Path),
  quiz3(kAlarmQuiz3Path),
  quiz4(kAlarmQuiz4Path);

  const AlarmRoute(this.path);
  final String path;
}
