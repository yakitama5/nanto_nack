import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:weather/src/infrastructure/weather_quiz_repository.dart';
import 'package:weather/src/infrastructure/weather_quiz_repository_provider.dart';
import 'package:weather/src/presentation/quiz2_pull_refresh/pull_refresh_quiz_notifier.dart';
import 'package:weather/src/presentation/weather_app_notifier.dart';
import 'package:system/system.dart';

class _MockWeatherQuizRepository extends Mock
    implements WeatherQuizRepository {}

class _MockAnalyticsService extends Mock implements AnalyticsService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockWeatherQuizRepository mockRepo;
  late _MockAnalyticsService mockAnalytics;
  late ProviderContainer container;

  setUp(() {
    mockRepo = _MockWeatherQuizRepository();
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
        weatherQuizRepositoryProvider.overrideWithValue(mockRepo),
        analyticsServiceProvider.overrideWithValue(mockAnalytics),
      ],
    );
  });

  tearDown(() => container.dispose());

  group('PullRefreshQuizNotifier', () {
    test('初期状態はidleである', () {
      final state = container.read(pullRefreshQuizProvider);
      expect(state.status, QuizStatus.idle);
    });

    test('startQuiz()でstatusがplayingになる', () {
      container.read(pullRefreshQuizProvider.notifier).startQuiz();
      expect(container.read(pullRefreshQuizProvider).status, QuizStatus.playing);
    });

    test('useHint()でhintUsedがtrueになる', () {
      container.read(pullRefreshQuizProvider.notifier).startQuiz();
      container.read(pullRefreshQuizProvider.notifier).useHint();
      expect(container.read(pullRefreshQuizProvider).hintUsed, isTrue);
    });

    test('giveUp()でstatusがgiveUpになりリポジトリに保存される', () async {
      container.read(pullRefreshQuizProvider.notifier).startQuiz();
      await container.read(pullRefreshQuizProvider.notifier).giveUp();

      expect(
        container.read(pullRefreshQuizProvider).status,
        QuizStatus.giveUp,
      );
      verify(
        () => mockRepo.saveResult(
          quizId: 'weather_quiz2',
          isCleared: false,
          clearTimeMs: null,
          score: 0,
          failureCount: 0,
        ),
      ).called(1);
    });

    test('リフレッシュ開始でcorrectになる', () async {
      final sub = container.listen(
        pullRefreshQuizProvider,
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      await withClock(Clock.fixed(DateTime(2026, 3, 31, 12)), () async {
        container.read(pullRefreshQuizProvider.notifier).startQuiz();

        // refreshWeather()でisRefreshingがtrueになりクリア判定
        unawaited(
          container.read(weatherAppProvider.notifier).refreshWeather(),
        );

        await Future<void>.delayed(const Duration(milliseconds: 100));

        expect(
          container.read(pullRefreshQuizProvider).status,
          QuizStatus.correct,
        );
      });
    });
  });
}
