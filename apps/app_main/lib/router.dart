import 'package:go_router/go_router.dart';
import 'package:shopping/shopping.dart';

import 'presentation/home/home_screen.dart';
import 'presentation/play/category_list_screen.dart';
import 'presentation/play/stage_list_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/play',
      builder: (context, state) => const CategoryListScreen(),
    ),
    GoRoute(
      path: '/play/:category',
      builder: (context, state) => StageListScreen(
        categoryId: state.pathParameters['category']!,
      ),
    ),
    GoRoute(
      path: '/shopping/water',
      builder: (context, state) => WaterQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    GoRoute(
      path: '/shopping/cart',
      builder: (context, state) => CartQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    GoRoute(
      path: '/shopping/checkout',
      builder: (context, state) => CheckoutQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
  ],
);
