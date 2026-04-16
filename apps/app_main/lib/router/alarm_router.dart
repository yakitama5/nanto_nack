import 'package:alarm/alarm.dart';
import 'package:go_router/go_router.dart';

import '../presentation/play/stage_list_screen.dart';

List<GoRoute> get alarmRoutes => [
      GoRoute(
        path: 'alarm',
        builder: (context, state) =>
            const StageListScreen(categoryId: 'alarm'),
        routes: [
          GoRoute(
            path: 'quiz1',
            builder: (context, state) => AddAlarmQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz2',
            builder: (context, state) => SetWeekdaysQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz3',
            builder: (context, state) => DisableSnoozeQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz4',
            builder: (context, state) => DeleteAlarmQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
        ],
      ),
    ];
