import 'package:comic/comic.dart';
import 'package:go_router/go_router.dart';

import '../domain/category.dart';
import '../presentation/play/stage_list_screen.dart';

List<GoRoute> get comicRoutes => [
      GoRoute(
        path: 'comic',
        builder: (context, state) =>
            const StageListScreen(category: QuizCategory.comic),
        routes: [
          GoRoute(
            path: 'quiz1',
            builder: (context, state) => ComicQuizScreen(
              type: ComicQuizType.quiz1,
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz2',
            builder: (context, state) => ComicQuizScreen(
              type: ComicQuizType.quiz2,
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz3',
            builder: (context, state) => ComicQuizScreen(
              type: ComicQuizType.quiz3,
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz4',
            builder: (context, state) => ComicQuizScreen(
              type: ComicQuizType.quiz4,
              onCompleted: () => context.pop(),
            ),
          ),
        ],
      ),
    ];
