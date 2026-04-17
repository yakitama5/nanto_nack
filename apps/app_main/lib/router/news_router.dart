import 'package:go_router/go_router.dart';
import 'package:news/news.dart';

import '../config/route_path_constants.dart';
import '../presentation/play/stage_list_screen.dart';
import 'routes/news_route.dart';

/// ニュースクイズの設定
class _NewsQuizConfig {
  const _NewsQuizConfig({
    required this.path,
    required this.absolutePath,
    required this.type,
  });

  final String path;
  final String absolutePath;
  final NewsQuizType type;
}

List<GoRoute> get newsRoutes => [
  GoRoute(
    path: kNewsSegment,
    builder: (context, state) =>
        const StageListScreen(categoryId: kNewsSegment),
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
      path: kNewsQuiz1Segment,
      absolutePath: kNewsQuiz1Path,
      type: NewsQuizType.refresh,
    ),
    _NewsQuizConfig(
      path: kNewsQuiz2Segment,
      absolutePath: kNewsQuiz2Path,
      type: NewsQuizType.category,
    ),
    _NewsQuizConfig(
      path: kNewsQuiz3Segment,
      absolutePath: kNewsQuiz3Path,
      type: NewsQuizType.fontSize,
    ),
    _NewsQuizConfig(
      path: kNewsQuiz4Segment,
      absolutePath: kNewsQuiz4Path,
      type: NewsQuizType.hideArticle,
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
            onRestart: () =>
                context.pushReplacement(config.absolutePath),
          ),
        ),
      )
      .toList();
}
