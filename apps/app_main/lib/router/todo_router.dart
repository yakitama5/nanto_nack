import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/todo.dart';

import '../application/stage_list_provider.dart';
import '../config/route_path_constants.dart';
import '../domain/category.dart';
import '../presentation/play/stage_list_screen.dart';
import 'routes/todo_route.dart';

/// TODOクイズの設定
class _TodoQuizConfig {
  const _TodoQuizConfig({
    required this.path,
    required this.absolutePath,
    required this.type,
  });

  final String path;
  final String absolutePath;
  final TodoQuizType type;
}

List<GoRoute> get todoRoutes => [
  GoRoute(
    path: kTodoSegment,
    builder: (context, state) =>
        const StageListScreen(category: QuizCategory.todo),
    routes: [
      // TODOクイズの設定リスト
      ..._buildTodoQuizRoutes(),
    ],
  ),
];

/// TODOクイズの GoRoute リストを生成
List<GoRoute> _buildTodoQuizRoutes() {
  const configs = <_TodoQuizConfig>[
    _TodoQuizConfig(
      path: kTodoQuiz1Segment,
      absolutePath: kTodoQuiz1Path,
      type: TodoQuizType.complete,
    ),
    _TodoQuizConfig(
      path: kTodoQuiz2Segment,
      absolutePath: kTodoQuiz2Path,
      type: TodoQuizType.reorder,
    ),
    _TodoQuizConfig(
      path: kTodoQuiz3Segment,
      absolutePath: kTodoQuiz3Path,
      type: TodoQuizType.markImportant,
    ),
    _TodoQuizConfig(
      path: kTodoQuiz4Segment,
      absolutePath: kTodoQuiz4Path,
      type: TodoQuizType.uncomplete,
    ),
  ];

  return configs
      .map(
        (config) => GoRoute(
          path: config.path,
          builder: (context, state) => TodoQuizScreen(
            type: config.type,
            onCompleted: () {
              // stageListProvider を明示的に invalidate してクリア結果を即反映する。
              // context.go() の push Future 完了タイミングに依存しない防御的実装。
              ProviderScope.containerOf(context, listen: false)
                  .invalidate(stageListProvider);
              context.go(TodoRoute.list.path);
            },
            onBack: () => context.go(TodoRoute.list.path),
            onRestart: () => context.pushReplacement(config.absolutePath),
          ),
        ),
      )
      .toList();
}
