import 'package:go_router/go_router.dart';
import 'package:shopping/shopping.dart';

import '../domain/category.dart';
import '../presentation/play/stage_list_screen.dart';
import '../presentation/tutorial/tutorial_water_quiz_screen.dart';

List<GoRoute> get shoppingRoutes => [
  GoRoute(
    path: 'shopping',
    builder: (context, state) =>
        const StageListScreen(category: QuizCategory.shopping),
    routes: [
      GoRoute(
        path: 'water',
        builder: (context, state) {
          // extra == true の場合はチュートリアルモード（クイズ選択を経由せず直接遷移）
          final isTutorial = state.extra == true;
          if (isTutorial) {
            return const TutorialWaterQuizScreen();
          }
          return WaterQuizScreen(
            onCompleted: () => context.pop(),
          );
        },
      ),
      GoRoute(
        path: 'cart',
        builder: (context, state) => CartQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: 'checkout',
        builder: (context, state) => CheckoutQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: 'reorder',
        builder: (context, state) => ReorderQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
    ],
  ),
];
