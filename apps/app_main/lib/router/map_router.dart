import 'package:go_router/go_router.dart';
import 'package:map/map.dart';

import '../presentation/play/stage_list_screen.dart';

List<GoRoute> get mapRoutes => [
      GoRoute(
        path: 'map',
        builder: (context, state) =>
            const StageListScreen(categoryId: 'map'),
        routes: [
          GoRoute(
            path: 'quiz1',
            builder: (context, state) => ShowLocationQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz2',
            builder: (context, state) => ShowSchoolInfoQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz3',
            builder: (context, state) => StartNavigationQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz4',
            builder: (context, state) => SavePlaceQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
        ],
      ),
    ];
