import 'package:go_router/go_router.dart';
import 'package:sns/sns.dart';

import '../domain/category.dart';
import '../presentation/play/stage_list_screen.dart';
import 'routes/sns_route.dart';

/// SNSカテゴリのルート定義
List<GoRoute> get snsRoutes => [
  GoRoute(
    path: SnsRoute.list.path.replaceFirst('/play/', ''),
    builder: (context, state) =>
        const StageListScreen(category: QuizCategory.sns),
    routes: [
      GoRoute(
        path: SnsRoute.quiz1.path.split('/').last,
        builder: (context, state) => SnsQuizScreen(
          quizType: SnsQuizType.quiz1,
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: SnsRoute.quiz2.path.split('/').last,
        builder: (context, state) => SnsQuizScreen(
          quizType: SnsQuizType.quiz2,
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: SnsRoute.quiz3.path.split('/').last,
        builder: (context, state) => SnsQuizScreen(
          quizType: SnsQuizType.quiz3,
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: SnsRoute.quiz4.path.split('/').last,
        builder: (context, state) => SnsQuizScreen(
          quizType: SnsQuizType.quiz4,
          onCompleted: () => context.pop(),
        ),
      ),
    ],
  ),
];
