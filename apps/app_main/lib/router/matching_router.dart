import 'package:go_router/go_router.dart';
import 'package:matching/matching.dart';

import '../config/route_path_constants.dart';
import '../domain/category.dart';
import '../presentation/play/stage_list_screen.dart';

extension _MatchingQuizTypeRoute on MatchingQuizType {
  String get segment => switch (this) {
        MatchingQuizType.swipeRight => kMatchingQuiz1Segment,
        MatchingQuizType.swipeLeft => kMatchingQuiz2Segment,
        MatchingQuizType.viewPhoto => kMatchingQuiz3Segment,
        MatchingQuizType.superLike => kMatchingQuiz4Segment,
      };
}

List<GoRoute> get matchingRoutes => [
      GoRoute(
        path: kMatchingSegment,
        builder: (context, state) =>
            const StageListScreen(category: QuizCategory.matching),
        routes: [
          for (final type in MatchingQuizType.values)
            GoRoute(
              path: type.segment,
              builder: (context, state) => MatchingQuizScreen(
                type: type,
                onCompleted: () => context.pop(),
              ),
            ),
        ],
      ),
    ];
