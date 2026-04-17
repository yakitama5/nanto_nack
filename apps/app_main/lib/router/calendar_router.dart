import 'package:calendar/calendar.dart';
import 'package:go_router/go_router.dart';

import '../presentation/play/stage_list_screen.dart';
import 'routes/calendar_route.dart';

/// カレンダーカテゴリのルート定義
List<GoRoute> get calendarRoutes => [
      GoRoute(
        path: CalendarRoute.list.path.replaceFirst('/play/', ''),
        builder: (context, state) =>
            const StageListScreen(categoryId: 'calendar'),
        routes: [
          GoRoute(
            path: CalendarRoute.quiz1.path.split('/').last,
            builder: (context, state) => CalendarQuizScreen(
              quizType: CalendarQuizType.quiz1,
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: CalendarRoute.quiz2.path.split('/').last,
            builder: (context, state) => CalendarQuizScreen(
              quizType: CalendarQuizType.quiz2,
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: CalendarRoute.quiz3.path.split('/').last,
            builder: (context, state) => CalendarQuizScreen(
              quizType: CalendarQuizType.quiz3,
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: CalendarRoute.quiz4.path.split('/').last,
            builder: (context, state) => CalendarQuizScreen(
              quizType: CalendarQuizType.quiz4,
              onCompleted: () => context.pop(),
            ),
          ),
        ],
      ),
    ];
