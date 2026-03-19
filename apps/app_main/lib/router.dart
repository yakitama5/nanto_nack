import 'package:go_router/go_router.dart';

import 'presentation/home/home_screen.dart';
import 'presentation/shopping/shopping_stub_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/shopping/water',
      builder: (context, state) =>
          const ShoppingStubScreen(quizId: 'shopping_water', title: '水を2つ買おう'),
    ),
    GoRoute(
      path: '/shopping/cart',
      builder: (context, state) =>
          const ShoppingStubScreen(quizId: 'shopping_cart', title: 'カートを確認しよう'),
    ),
    GoRoute(
      path: '/shopping/checkout',
      builder: (context, state) => const ShoppingStubScreen(
        quizId: 'shopping_checkout',
        title: '購入を完了しよう',
      ),
    ),
  ],
);
