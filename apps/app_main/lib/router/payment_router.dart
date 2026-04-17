import 'package:go_router/go_router.dart';
import 'package:payment/payment.dart';

import '../domain/category.dart';
import '../presentation/play/stage_list_screen.dart';

List<GoRoute> get paymentRoutes => [
  GoRoute(
    path: 'payment',
    builder: (context, state) =>
        const StageListScreen(category: QuizCategory.payment),
    routes: [
      GoRoute(
        path: 'quiz1',
        builder: (context, state) => ShowQrQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: 'quiz2',
        builder: (context, state) => RevealBalanceQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: 'quiz3',
        builder: (context, state) => SendMoneyQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
      GoRoute(
        path: 'quiz4',
        builder: (context, state) => ChangePaymentMethodQuizScreen(
          onCompleted: () => context.pop(),
        ),
      ),
    ],
  ),
];
