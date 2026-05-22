import 'package:clock/clock.dart';
import 'package:delivery/src/domain/delivery_view_state.dart';
import 'package:delivery/src/infrastructure/delivery_quiz_repository.dart';
import 'package:delivery/src/infrastructure/delivery_quiz_repository_provider.dart';
import 'package:delivery/src/presentation/delivery_app_notifier.dart';
import 'package:delivery/src/presentation/quiz1_find_pizza/find_pizza_quiz_notifier.dart';
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

  group('FindPizzaQuizNotifier', () {
    test('初期状態は idle である', () {
      final state = container.read(findPizzaQuizProvider);
      expect(state.status, QuizStatus.idle);
      expect(state.hintUsed, isFalse);
    });

    test('startQuiz() で status が playing になる', () {
      container.read(findPizzaQuizProvider.notifier).startQuiz();
      final state = container.read(findPizzaQuizProvider);
      expect(state.status, QuizStatus.playing);
      expect(state.startedAt, isNotNull);
    });

    test('useHint() で hintUsed が true になる', () {
      container.read(findPizzaQuizProvider.notifier).startQuiz();
      container.read(findPizzaQuizProvider.notifier).useHint();
      final state = container.read(findPizzaQuizProvider);
      expect(state.hintUsed, isTrue);
    });

    test('giveUp() で status が giveUp になる', () async {
      container.read(findPizzaQuizProvider.notifier).startQuiz();
      await container.read(findPizzaQuizProvider.notifier).giveUp();
      final state = container.read(findPizzaQuizProvider);
      expect(state.status, QuizStatus.giveUp);
      expect(state.remainingSeconds, 0);
    });

    test('pizza カテゴリをタップすると correct になる', () async {
      final sub = container.listen(
        findPizzaQuizProvider,
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      // deliveryAppProvider も保持する
      final appSub = container.listen(
        deliveryAppProvider(DeliveryViewState.browsing),
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(appSub.close);

      await withClock(Clock.fixed(DateTime(2026, 5, 19, 12)), () async {
        container.read(findPizzaQuizProvider.notifier).startQuiz();
        container
            .read(deliveryAppProvider(DeliveryViewState.browsing).notifier)
            .tapCategory('pizza');

        await Future<void>.delayed(const Duration(milliseconds: 100));
        final state = container.read(findPizzaQuizProvider);
        expect(state.status, QuizStatus.correct);
      });
    });

    test('pizza 以外のカテゴリをタップしても correct にならない', () async {
      final sub = container.listen(
        findPizzaQuizProvider,
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      final appSub = container.listen(
        deliveryAppProvider(DeliveryViewState.browsing),
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(appSub.close);

      container.read(findPizzaQuizProvider.notifier).startQuiz();
      container
          .read(deliveryAppProvider(DeliveryViewState.browsing).notifier)
          .tapCategory('burger');

      await Future<void>.delayed(const Duration(milliseconds: 100));
      final state = container.read(findPizzaQuizProvider);
      expect(state.status, QuizStatus.playing);
    });

    test('retry() で状態が idle にリセットされる', () async {
      container.read(findPizzaQuizProvider.notifier).startQuiz();
      await container.read(findPizzaQuizProvider.notifier).giveUp();
      container.read(findPizzaQuizProvider.notifier).retry();
      final state = container.read(findPizzaQuizProvider);
      expect(state.status, QuizStatus.idle);
      expect(state.hintUsed, isFalse);
    });
  });
}
