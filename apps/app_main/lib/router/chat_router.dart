import 'package:chat/chat.dart';
import 'package:go_router/go_router.dart';

import '../domain/category.dart';
import '../presentation/play/stage_list_screen.dart';

List<GoRoute> get chatRoutes => [
  GoRoute(
    path: 'chat',
    builder: (context, state) =>
        const StageListScreen(category: QuizCategory.chat),
    routes: [
      GoRoute(
        path: 'quiz1',
        builder: (context, state) => SendStampQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: 'quiz2',
        builder: (context, state) => ReactionQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: 'quiz3',
        builder: (context, state) => SendImageQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: 'quiz4',
        builder: (context, state) => CancelMessageQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
    ],
  ),
];
