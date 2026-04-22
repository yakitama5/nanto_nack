import 'package:go_router/go_router.dart';
import 'package:todo/todo.dart';

import '../domain/category.dart';
import '../presentation/play/stage_list_screen.dart';

List<GoRoute> get todoRoutes => [
  GoRoute(
    path: 'todo',
    builder: (context, state) =>
        const StageListScreen(category: QuizCategory.todo),
    routes: [
      GoRoute(
        path: 'quiz1',
        builder: (context, state) => TodoQuizScreen(
          type: TodoQuizType.complete,
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: 'quiz2',
        builder: (context, state) => TodoQuizScreen(
          type: TodoQuizType.reorder,
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: 'quiz3',
        builder: (context, state) => TodoQuizScreen(
          type: TodoQuizType.markImportant,
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: 'quiz4',
        builder: (context, state) => TodoQuizScreen(
          type: TodoQuizType.uncomplete,
          onCompleted: () => context.pop(),
        ),
      ),
    ],
  ),
];
