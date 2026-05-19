import 'package:go_router/go_router.dart';
import 'package:weather/weather.dart';

import '../domain/category.dart';
import '../presentation/play/stage_list_screen.dart';

List<GoRoute> get weatherRoutes => [
      GoRoute(
        path: 'weather',
        builder: (context, state) =>
            const StageListScreen(category: QuizCategory.weather),
        routes: [
          GoRoute(
            path: 'quiz1',
            builder: (context, state) => CitySwitchQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz2',
            builder: (context, state) => PullRefreshQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz3',
            builder: (context, state) => ExpandForecastQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz4',
            builder: (context, state) => RadarMapQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
        ],
      ),
    ];
