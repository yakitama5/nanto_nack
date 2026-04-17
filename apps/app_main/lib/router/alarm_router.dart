import 'package:alarm/alarm.dart';
import 'package:go_router/go_router.dart';

import '../presentation/play/stage_list_screen.dart';
import 'routes/alarm_route.dart';

List<GoRoute> get alarmRoutes => [
  GoRoute(
    path: AlarmRoute.list.path.replaceFirst('/play/', ''),
    builder: (context, state) => const StageListScreen(categoryId: 'alarm'),
    routes: [
      GoRoute(
        path: AlarmRoute.quiz1.path.split('/').last,
        builder: (context, state) => AddAlarmQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: AlarmRoute.quiz2.path.split('/').last,
        builder: (context, state) => SetWeekdaysQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: AlarmRoute.quiz3.path.split('/').last,
        builder: (context, state) => DisableSnoozeQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: AlarmRoute.quiz4.path.split('/').last,
        builder: (context, state) => DeleteAlarmQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
    ],
  ),
];
