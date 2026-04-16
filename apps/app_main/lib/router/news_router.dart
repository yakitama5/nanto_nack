import 'package:go_router/go_router.dart';
import 'package:news/news.dart';

import '../presentation/play/stage_list_screen.dart';
import 'routes/news_route.dart';

List<GoRoute> get newsRoutes => [
      GoRoute(
        path: 'news',
        builder: (context, state) =>
            const StageListScreen(categoryId: 'news'),
        routes: [
          GoRoute(
            path: 'quiz1',
            builder: (context, state) => NewsQuizScreen(
              type: NewsQuizType.refresh,
              onCompleted: () => context.go(NewsRoute.list.path),
              onBack: () => context.go(NewsRoute.list.path),
              onRestart: () => context.go(NewsRoute.quiz1.path),
            ),
          ),
          GoRoute(
            path: 'quiz2',
            builder: (context, state) => NewsQuizScreen(
              type: NewsQuizType.category,
              onCompleted: () => context.go(NewsRoute.list.path),
              onBack: () => context.go(NewsRoute.list.path),
              onRestart: () => context.go(NewsRoute.quiz2.path),
            ),
          ),
          GoRoute(
            path: 'quiz3',
            builder: (context, state) => NewsQuizScreen(
              type: NewsQuizType.fontSize,
              onCompleted: () => context.go(NewsRoute.list.path),
              onBack: () => context.go(NewsRoute.list.path),
              onRestart: () => context.go(NewsRoute.quiz3.path),
            ),
          ),
          GoRoute(
            path: 'quiz4',
            builder: (context, state) => NewsQuizScreen(
              type: NewsQuizType.hideArticle,
              onCompleted: () => context.go(NewsRoute.list.path),
              onBack: () => context.go(NewsRoute.list.path),
              onRestart: () => context.go(NewsRoute.quiz4.path),
            ),
          ),
        ],
      ),
    ];
