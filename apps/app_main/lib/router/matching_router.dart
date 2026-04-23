import 'package:go_router/go_router.dart';
import 'package:matching/matching.dart';

import '../domain/category.dart';
import '../presentation/play/stage_list_screen.dart';

List<GoRoute> get matchingRoutes => [
      GoRoute(
        path: 'matching',
        builder: (context, state) =>
            const StageListScreen(category: QuizCategory.matching),
        routes: [
          GoRoute(
            path: 'quiz1',
            builder: (context, state) => MatchingQuizScreen(
              type: MatchingQuizType.swipeRight,
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz2',
            builder: (context, state) => MatchingQuizScreen(
              type: MatchingQuizType.swipeLeft,
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz3',
            builder: (context, state) => MatchingQuizScreen(
              type: MatchingQuizType.viewPhoto,
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz4',
            builder: (context, state) => MatchingQuizScreen(
              type: MatchingQuizType.superLike,
              onCompleted: () => context.pop(),
            ),
          ),
        ],
      ),
    ];
