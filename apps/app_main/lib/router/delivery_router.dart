import 'package:delivery/delivery.dart';
import 'package:go_router/go_router.dart';

import '../domain/category.dart';
import '../presentation/play/stage_list_screen.dart';

List<GoRoute> get deliveryRoutes => [
      GoRoute(
        path: 'delivery',
        builder: (context, state) =>
            const StageListScreen(category: QuizCategory.delivery),
        routes: [
          GoRoute(
            path: 'quiz1',
            builder: (context, state) => FindPizzaQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz2',
            builder: (context, state) => IncrementQuantityQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz3',
            builder: (context, state) => TapCartQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz4',
            builder: (context, state) => ExpandTrackingQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
        ],
      ),
    ];
