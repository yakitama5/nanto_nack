import 'package:chat/chat.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping/shopping.dart';
import 'package:streaming/streaming.dart';

import 'presentation/home/home_screen.dart';
import 'presentation/play/category_list_screen.dart';
import 'presentation/play/stage_list_screen.dart';
import 'presentation/settings/settings_screen.dart';
import 'presentation/shopping/shopping_stub_screen.dart';

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
    // ショッピングカテゴリー
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
    GoRoute(
      path: '/shopping/reorder',
      builder: (context, state) => ReorderQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    // チャットカテゴリー
    GoRoute(
      path: '/chat/quiz1',
      builder: (context, state) => SendMessageQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    GoRoute(
      path: '/chat/quiz2',
      builder: (context, state) => SendStampQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    GoRoute(
      path: '/chat/quiz3',
      builder: (context, state) => DeleteMessageQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    GoRoute(
      path: '/chat/quiz4',
      builder: (context, state) => CreateGroupQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    // 動画カテゴリー
    GoRoute(
      path: '/streaming/quiz1',
      builder: (context, state) => SubtitleQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    GoRoute(
      path: '/streaming/quiz2',
      builder: (context, state) => SkipSeekQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    GoRoute(
      path: '/streaming/quiz3',
      builder: (context, state) => PlaybackSpeedQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    GoRoute(
      path: '/streaming/quiz4',
      builder: (context, state) => OfflineSaveQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    // マップカテゴリー（準備中）
    GoRoute(
      path: '/map/quiz1',
      builder: (context, state) => const ShoppingStubScreen(
        quizId: 'map_quiz1',
        title: 'マップ Quiz 1',
      ),
    ),
    GoRoute(
      path: '/map/quiz2',
      builder: (context, state) => const ShoppingStubScreen(
        quizId: 'map_quiz2',
        title: 'マップ Quiz 2',
      ),
    ),
    GoRoute(
      path: '/map/quiz3',
      builder: (context, state) => const ShoppingStubScreen(
        quizId: 'map_quiz3',
        title: 'マップ Quiz 3',
      ),
    ),
    GoRoute(
      path: '/map/quiz4',
      builder: (context, state) => const ShoppingStubScreen(
        quizId: 'map_quiz4',
        title: 'マップ Quiz 4',
      ),
    ),
    // アラームカテゴリー（準備中）
    GoRoute(
      path: '/alarm/quiz1',
      builder: (context, state) => const ShoppingStubScreen(
        quizId: 'alarm_quiz1',
        title: 'アラーム Quiz 1',
      ),
    ),
    GoRoute(
      path: '/alarm/quiz2',
      builder: (context, state) => const ShoppingStubScreen(
        quizId: 'alarm_quiz2',
        title: 'アラーム Quiz 2',
      ),
    ),
    GoRoute(
      path: '/alarm/quiz3',
      builder: (context, state) => const ShoppingStubScreen(
        quizId: 'alarm_quiz3',
        title: 'アラーム Quiz 3',
      ),
    ),
    GoRoute(
      path: '/alarm/quiz4',
      builder: (context, state) => const ShoppingStubScreen(
        quizId: 'alarm_quiz4',
        title: 'アラーム Quiz 4',
      ),
    ),
    // 決済カテゴリー（準備中）
    GoRoute(
      path: '/payment/quiz1',
      builder: (context, state) => const ShoppingStubScreen(
        quizId: 'payment_quiz1',
        title: '決済 Quiz 1',
      ),
    ),
    GoRoute(
      path: '/payment/quiz2',
      builder: (context, state) => const ShoppingStubScreen(
        quizId: 'payment_quiz2',
        title: '決済 Quiz 2',
      ),
    ),
    GoRoute(
      path: '/payment/quiz3',
      builder: (context, state) => const ShoppingStubScreen(
        quizId: 'payment_quiz3',
        title: '決済 Quiz 3',
      ),
    ),
    GoRoute(
      path: '/payment/quiz4',
      builder: (context, state) => const ShoppingStubScreen(
        quizId: 'payment_quiz4',
        title: '決済 Quiz 4',
      ),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
