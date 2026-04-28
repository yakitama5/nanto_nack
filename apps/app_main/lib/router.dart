import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'application/router_notifier.dart';
import 'presentation/home/home_screen.dart';
import 'presentation/maintenance/maintenance_screen.dart';
import 'presentation/play/category_list_screen.dart';
import 'presentation/settings/settings_screen.dart';
import 'presentation/splash/splash_screen.dart';
import 'presentation/support/support_screen.dart';
import 'router/alarm_router.dart';
import 'router/matching_router.dart';
import 'router/calendar_router.dart';
import 'router/chat_router.dart';
import 'router/comic_router.dart';
import 'router/sns_router.dart';
import 'router/mail_router.dart';
import 'router/map_router.dart';
import 'router/news_router.dart';
import 'router/payment_router.dart';
import 'router/todo_router.dart';
import 'router/shopping_router.dart';
import 'router/streaming_router.dart';

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
        routes: [
          ...shoppingRoutes,
          ...chatRoutes,
          ...comicRoutes,
          ...streamingRoutes,
          ...mapRoutes,
          ...alarmRoutes,
          ...paymentRoutes,
          ...mailRoutes,
          ...newsRoutes,
          ...calendarRoutes,
          ...snsRoutes,
          ...todoRoutes,
          ...matchingRoutes,
        ],
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
