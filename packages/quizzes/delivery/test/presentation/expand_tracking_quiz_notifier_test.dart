import 'dart:async';

import 'package:clock/clock.dart';
import 'package:delivery/src/domain/delivery_quiz_config.dart';
import 'package:delivery/src/domain/delivery_view_state.dart';
import 'package:delivery/src/infrastructure/delivery_quiz_repository.dart';
import 'package:delivery/src/infrastructure/delivery_quiz_repository_provider.dart';
import 'package:delivery/src/presentation/delivery_app_notifier.dart';
import 'package:delivery/src/presentation/quiz4_expand_tracking/expand_tracking_quiz_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

class _MockDeliveryQuizRepository extends Mock
    implements DeliveryQuizRepository {}

class _MockAnalyticsService extends Mock implements AnalyticsService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockDeliveryQuizRepository mockRepo;
  late _MockAnalyticsService mockAnalytics;
  late ProviderContainer container;

  setUp(() {
    mockRepo = _MockDeliveryQuizRepository();
    mockAnalytics = _MockAnalyticsService();

    when(
      () => mockRepo.saveResult(
        quizId: any(named: 'quizId'),
        isCleared: any(named: 'isCleared'),
        clearTimeMs: any(named: 'clearTimeMs'),
        score: any(named: 'score'),
        failureCount: any(named: 'failureCount'),
      ),
    ).thenAnswer((_) async {});

    when(
      () => mockAnalytics.logQuizStarted(quizId: any(named: 'quizId')),
    ).thenAnswer((_) async {});
    when(
      () => mockAnalytics.logQuizCompleted(
        quizId: any(named: 'quizId'),
        score: any(named: 'score'),
        failureCount: any(named: 'failureCount'),
        clearTimeMs: any(named: 'clearTimeMs'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => mockAnalytics.logQuizGivenUp(quizId: any(named: 'quizId')),
    ).thenAnswer((_) async {});
    when(
      () => mockAnalytics.logQuizRetried(quizId: any(named: 'quizId')),
    ).thenAnswer((_) async {});

    container = ProviderContainer(
      overrides: [
        deliveryQuizRepositoryProvider.overrideWithValue(mockRepo),
        analyticsServiceProvider.overrideWithValue(mockAnalytics),
      ],
    );
  });

  tearDown(() => container.dispose());

  group('ExpandTrackingQuizNotifier', () {
    test('初期状態は idle である', () {
      final state = container.read(expandTrackingQuizProvider);
      expect(state.status, QuizStatus.idle);
    });

    test('startQuiz() で status が playing になる', () {
      container.read(expandTrackingQuizProvider.notifier).startQuiz();
      final state = container.read(expandTrackingQuizProvider);
      expect(state.status, QuizStatus.playing);
    });

    test(
      'trackingSheetExtent が ${DeliveryQuizConfig.trackingClearExtent} 以上で correct になる',
      () async {
        final completer = Completer<void>();
        final sub = container.listen(
          expandTrackingQuizProvider,
          (_, next) {
            if (next.status == QuizStatus.correct) completer.complete();
          },
          fireImmediately: true,
        );
        addTearDown(sub.close);

        final appSub = container.listen(
          deliveryAppProvider(DeliveryViewState.tracking),
          (_, _a) {},
          fireImmediately: true,
        );
        addTearDown(appSub.close);

        await withClock(Clock.fixed(DateTime(2026, 5, 19, 12)), () async {
          container.read(expandTrackingQuizProvider.notifier).startQuiz();
          container
              .read(
                deliveryAppProvider(DeliveryViewState.tracking).notifier,
              )
              .updateTrackingSheetExtent(0.8);

          await completer.future;
          final state = container.read(expandTrackingQuizProvider);
          expect(state.status, QuizStatus.correct);
        });
      },
    );

    test('閾値未満では correct にならない', () async {
      final sub = container.listen(
        expandTrackingQuizProvider,
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      final appSub = container.listen(
        deliveryAppProvider(DeliveryViewState.tracking),
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(appSub.close);

      container.read(expandTrackingQuizProvider.notifier).startQuiz();
      container
          .read(deliveryAppProvider(DeliveryViewState.tracking).notifier)
          .updateTrackingSheetExtent(0.5);

      await Future<void>.delayed(const Duration(milliseconds: 100));
      final state = container.read(expandTrackingQuizProvider);
      expect(state.status, QuizStatus.playing);
    });
  });
}
