import 'package:go_router/go_router.dart';
import 'package:music/music.dart';

import '../domain/category.dart';
import '../presentation/play/stage_list_screen.dart';

List<GoRoute> get musicRoutes => [
      GoRoute(
        path: 'music',
        builder: (context, state) =>
            const StageListScreen(category: QuizCategory.music),
        routes: [
          GoRoute(
            path: 'quiz1',
            builder: (context, state) => NextSongQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz2',
            builder: (context, state) => MinimizePlayerQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz3',
            builder: (context, state) => OneRepeatQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz4',
            builder: (context, state) => LyricsQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
        ],
      ),
    ];
