import 'package:alarm/alarm.dart';
import 'package:chat/chat.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payment/payment.dart';
import 'package:go_router/go_router.dart';
import 'package:map/map.dart';
import 'package:shopping/shopping.dart';
import 'package:streaming/streaming.dart';

import 'application/router_notifier.dart';
import 'presentation/home/home_screen.dart';
import 'presentation/maintenance/maintenance_screen.dart';
import 'presentation/play/category_list_screen.dart';
import 'presentation/play/stage_list_screen.dart';
import 'presentation/settings/settings_screen.dart';
import 'presentation/splash/splash_screen.dart';
import 'presentation/support/support_screen.dart';
import 'presentation/tutorial/tutorial_water_quiz_screen.dart';

List<NavigatorObserver> _buildRouterObservers() {
  try {
    return [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)];
  } catch (_) {
    // Firebase が初期化されていない場合（テスト環境等）はオブザーバーなしで起動
    return [];
  }
}

/// GoRouter を Riverpod で管理する Provider。
///
/// [RouterNotifier] を [refreshListenable] に渡すことで、
/// システム状態（メンテナンス等）の変化時に redirect が再評価される。
final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider);

  return GoRouter(
    initialLocation: '/splash',
    observers: _buildRouterObservers(),
    refreshListenable: notifier,
    redirect: notifier.redirect,
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/maintenance',
        builder: (context, state) => const MaintenanceScreen(),
      ),
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
        builder: (context, state) => SendStampQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: '/chat/quiz2',
        builder: (context, state) => ReactionQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: '/chat/quiz3',
        builder: (context, state) => SendImageQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: '/chat/quiz4',
        builder: (context, state) => CancelMessageQuizScreen(
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
        builder: (context, state) => ShowSchoolInfoQuizScreen(
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
        builder: (context, state) => ChangePaymentMethodQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/support',
        builder: (context, state) => const SupportScreen(),
      ),
    ],
  );
});
