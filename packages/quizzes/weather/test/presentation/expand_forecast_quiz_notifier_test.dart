import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:weather/src/infrastructure/weather_quiz_repository.dart';
import 'package:weather/src/infrastructure/weather_quiz_repository_provider.dart';
import 'package:weather/src/presentation/quiz3_expand_forecast/expand_forecast_quiz_notifier.dart';
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

  group('ExpandForecastQuizNotifier', () {
    test('初期状態はidleである', () {
      expect(
        container.read(expandForecastQuizProvider).status,
        QuizStatus.idle,
      );
    });

    test('startQuiz()でstatusがplayingになる', () {
      container.read(expandForecastQuizProvider.notifier).startQuiz();
      expect(
        container.read(expandForecastQuizProvider).status,
        QuizStatus.playing,
      );
    });

    test('giveUp()でstatusがgiveUpになる', () async {
      container.read(expandForecastQuizProvider.notifier).startQuiz();
      await container.read(expandForecastQuizProvider.notifier).giveUp();
      expect(
        container.read(expandForecastQuizProvider).status,
        QuizStatus.giveUp,
      );
    });

    test('expandedDateがnull→非nullに変化するとcorrectになる', () async {
      final sub = container.listen(
        expandForecastQuizProvider,
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      await withClock(Clock.fixed(DateTime(2026, 3, 31, 12)), () async {
        container.read(expandForecastQuizProvider.notifier).startQuiz();

        // expandedDateをnull→非nullに変化させる
        final date = DateTime(2026, 4, 2);
        container.read(weatherAppProvider.notifier).expandDailyForecast(date);

        await Future<void>.delayed(const Duration(milliseconds: 100));

        expect(
          container.read(expandForecastQuizProvider).status,
          QuizStatus.correct,
        );
      });
    });

    test('correctになったときリポジトリにisCleared=trueが保存される', () async {
      final sub = container.listen(
        expandForecastQuizProvider,
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      await withClock(Clock.fixed(DateTime(2026, 3, 31, 12)), () async {
        container.read(expandForecastQuizProvider.notifier).startQuiz();
        container
            .read(weatherAppProvider.notifier)
            .expandDailyForecast(DateTime(2026, 4, 2));
        await Future<void>.delayed(const Duration(milliseconds: 100));

        verify(
          () => mockRepo.saveResult(
            quizId: 'weather_quiz3',
            isCleared: true,
            clearTimeMs: any(named: 'clearTimeMs'),
            score: any(named: 'score'),
            failureCount: 0,
          ),
        ).called(1);
      });
    });

    test('retry()でweatherAppProviderがリセットされexpandedDateがnullになる', () async {
      container.read(expandForecastQuizProvider.notifier).startQuiz();
      await container.read(expandForecastQuizProvider.notifier).giveUp();
      container.read(expandForecastQuizProvider.notifier).retry();

      expect(
        container.read(expandForecastQuizProvider).status,
        QuizStatus.idle,
      );
    });
  });
}
