import 'package:go_router/go_router.dart';
import 'package:streaming/streaming.dart';

import '../presentation/play/stage_list_screen.dart';

List<GoRoute> get streamingRoutes => [
      GoRoute(
        path: 'streaming',
        builder: (context, state) =>
            const StageListScreen(categoryId: 'streaming'),
        routes: [
          GoRoute(
            path: 'quiz1',
            builder: (context, state) => SubtitleQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz2',
            builder: (context, state) => SkipSeekQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz3',
            builder: (context, state) => PlaybackSpeedQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz4',
            builder: (context, state) => OfflineSaveQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
        ],
      ),
    ];
