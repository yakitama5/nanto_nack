import 'package:go_router/go_router.dart';
import 'package:news/news.dart';

import '../domain/category.dart';
import '../presentation/play/stage_list_screen.dart';

List<GoRoute> get newsRoutes => [
  GoRoute(
    path: 'news',
    builder: (context, state) =>
        const StageListScreen(category: QuizCategory.news),
    routes: [
      GoRoute(
        path: 'quiz1',
        builder: (context, state) => NewsQuizScreen(
          type: NewsQuizType.refresh,
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: 'quiz2',
        builder: (context, state) => NewsQuizScreen(
          type: NewsQuizType.category,
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: 'quiz3',
        builder: (context, state) => NewsQuizScreen(
          type: NewsQuizType.fontSize,
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: 'quiz4',
        builder: (context, state) => NewsQuizScreen(
          type: NewsQuizType.hideArticle,
          onCompleted: () => context.pop(),
        ),
      ),
    ],
  ),
];
