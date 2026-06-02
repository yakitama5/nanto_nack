import 'package:finance/finance.dart';
import 'package:go_router/go_router.dart';

import '../domain/category.dart';
import '../presentation/play/stage_list_screen.dart';

List<GoRoute> get financeRoutes => [
      GoRoute(
        path: 'finance',
        builder: (context, state) =>
            const StageListScreen(category: QuizCategory.finance),
        routes: [
          GoRoute(
            path: 'quiz1',
            builder: (context, state) => PanChartQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz2',
            builder: (context, state) => ZoomChartQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz3',
            builder: (context, state) => TouchChartQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz4',
            builder: (context, state) => ChangePeriodQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
        ],
      ),
    ];
