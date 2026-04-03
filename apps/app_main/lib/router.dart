import 'package:alarm/alarm.dart';
import 'package:chat/chat.dart';
import 'package:payment/payment.dart';
import 'package:go_router/go_router.dart';
import 'package:map/map.dart';
import 'package:shopping/shopping.dart';
import 'package:streaming/streaming.dart';

import 'presentation/home/home_screen.dart';
import 'presentation/play/category_list_screen.dart';
import 'presentation/play/stage_list_screen.dart';
import 'presentation/settings/settings_screen.dart';

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
    // マップカテゴリー
    GoRoute(
      path: '/map/quiz1',
      builder: (context, state) => ShowLocationQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    GoRoute(
      path: '/map/quiz2',
      builder: (context, state) => SearchPlaceQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    GoRoute(
      path: '/map/quiz3',
      builder: (context, state) => StartNavigationQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    GoRoute(
      path: '/map/quiz4',
      builder: (context, state) => SavePlaceQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    // アラームカテゴリー
    GoRoute(
      path: '/alarm/quiz1',
      builder: (context, state) => AddAlarmQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    GoRoute(
      path: '/alarm/quiz2',
      builder: (context, state) => SetWeekdaysQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    GoRoute(
      path: '/alarm/quiz3',
      builder: (context, state) => DisableSnoozeQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    GoRoute(
      path: '/alarm/quiz4',
      builder: (context, state) => DeleteAlarmQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    // 決済カテゴリー
    GoRoute(
      path: '/payment/quiz1',
      builder: (context, state) => ShowQrQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    GoRoute(
      path: '/payment/quiz2',
      builder: (context, state) => RevealBalanceQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    GoRoute(
      path: '/payment/quiz3',
      builder: (context, state) => SendMoneyQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    GoRoute(
      path: '/payment/quiz4',
      builder: (context, state) => ViewHistoryQuizScreen(
        onCompleted: () => context.pop(),
      ),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
