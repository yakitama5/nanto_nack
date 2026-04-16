import 'package:go_router/go_router.dart';
import 'package:news/news.dart';

import '../presentation/play/stage_list_screen.dart';
import 'routes/news_route.dart';

/// ニュースクイズの設定
class _NewsQuizConfig {
  const _NewsQuizConfig({
    required this.path,
    required this.type,
    required this.restartTarget,
  });

  final String path;
  final NewsQuizType type;
  final String restartTarget;
}

List<GoRoute> get newsRoutes => [
  GoRoute(
    path: 'news',
    builder: (context, state) => const StageListScreen(categoryId: 'news'),
    routes: [
      // ニュースクイズの設定リスト
      ..._buildNewsQuizRoutes(),
    ],
  ),
];

/// ニュースクイズの GoRoute リストを生成
List<GoRoute> _buildNewsQuizRoutes() {
  const configs = <_NewsQuizConfig>[
    _NewsQuizConfig(
      path: 'quiz1',
      type: NewsQuizType.refresh,
      restartTarget: 'quiz1',
    ),
    _NewsQuizConfig(
      path: 'quiz2',
      type: NewsQuizType.category,
      restartTarget: 'quiz2',
    ),
    _NewsQuizConfig(
      path: 'quiz3',
      type: NewsQuizType.fontSize,
      restartTarget: 'quiz3',
    ),
    _NewsQuizConfig(
      path: 'quiz4',
      type: NewsQuizType.hideArticle,
      restartTarget: 'quiz4',
    ),
  ];

  return configs
      .map(
        (config) => GoRoute(
          path: config.path,
          builder: (context, state) => NewsQuizScreen(
            type: config.type,
            onCompleted: () => context.go(NewsRoute.list.path),
            onBack: () => context.go(NewsRoute.list.path),
            onRestart: () => context.pushReplacement(
              '${NewsRoute.list.path}/${config.restartTarget}',
            ),
          ),
        ),
      )
      .toList();
}
