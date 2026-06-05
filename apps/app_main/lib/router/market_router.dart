import 'package:go_router/go_router.dart';
import 'package:market/market.dart';

import '../domain/category.dart';
import '../presentation/play/stage_list_screen.dart';

List<GoRoute> get marketRoutes => [
      GoRoute(
        path: 'market',
        builder: (context, state) =>
            const StageListScreen(category: QuizCategory.market),
        routes: [
          GoRoute(
            path: 'quiz1',
            builder: (context, state) => SwipeImageQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz2',
            builder: (context, state) => LikeQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz3',
            builder: (context, state) => SellerQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz4',
            builder: (context, state) => BuyQuizScreen(
              onCompleted: () => context.pop(),
            ),
          ),
        ],
      ),
    ];
