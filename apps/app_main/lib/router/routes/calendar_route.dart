import '../../config/route_path_constants.dart';

/// カレンダーカテゴリーのルートパスEnum。
enum CalendarRoute {
  list(kCalendarListPath),
  quiz1(kCalendarQuiz1Path),
  quiz2(kCalendarQuiz2Path),
  quiz3(kCalendarQuiz3Path),
  quiz4(kCalendarQuiz4Path);

  const CalendarRoute(this.path);
  final String path;
}
