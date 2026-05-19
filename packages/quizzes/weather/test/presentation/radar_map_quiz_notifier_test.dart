import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:weather/src/infrastructure/weather_quiz_repository.dart';
import 'package:weather/src/infrastructure/weather_quiz_repository_provider.dart';
import 'package:weather/src/presentation/quiz4_radar_map/radar_map_quiz_notifier.dart';
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

  group('RadarMapQuizNotifier', () {
    test('初期状態はidleである', () {
      expect(container.read(radarMapQuizProvider).status, QuizStatus.idle);
    });

    test('startQuiz()でstatusがplayingになる', () {
      container.read(radarMapQuizProvider.notifier).startQuiz();
      expect(container.read(radarMapQuizProvider).status, QuizStatus.playing);
    });

    test('useHint()でhintUsedがtrueになる', () {
      container.read(radarMapQuizProvider.notifier).startQuiz();
      container.read(radarMapQuizProvider.notifier).useHint();
      expect(container.read(radarMapQuizProvider).hintUsed, isTrue);
    });

    test('giveUp()でstatusがgiveUpになる', () async {
      container.read(radarMapQuizProvider.notifier).startQuiz();
      await container.read(radarMapQuizProvider.notifier).giveUp();
      expect(container.read(radarMapQuizProvider).status, QuizStatus.giveUp);
    });

    test('giveUp()でリポジトリにisCleared=falseが保存される', () async {
      container.read(radarMapQuizProvider.notifier).startQuiz();
      await container.read(radarMapQuizProvider.notifier).giveUp();
      verify(
        () => mockRepo.saveResult(
          quizId: 'weather_quiz4',
          isCleared: false,
          clearTimeMs: null,
          score: 0,
          failureCount: 0,
        ),
      ).called(1);
    });

    test('openRadarMap()が呼ばれるとcorrectになる', () async {
      final sub = container.listen(
        radarMapQuizProvider,
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      await withClock(Clock.fixed(DateTime(2026, 3, 31, 12)), () async {
        container.read(radarMapQuizProvider.notifier).startQuiz();

        // レーダーマップを開いてクリア条件を満たす
        container.read(weatherAppProvider.notifier).openRadarMap();

        await Future<void>.delayed(const Duration(milliseconds: 100));

        expect(container.read(radarMapQuizProvider).status, QuizStatus.correct);
      });
    });

    test('correctになったときリポジトリにisCleared=trueが保存される', () async {
      final sub = container.listen(
        radarMapQuizProvider,
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      await withClock(Clock.fixed(DateTime(2026, 3, 31, 12)), () async {
        container.read(radarMapQuizProvider.notifier).startQuiz();
        container.read(weatherAppProvider.notifier).openRadarMap();
        await Future<void>.delayed(const Duration(milliseconds: 100));

        verify(
          () => mockRepo.saveResult(
            quizId: 'weather_quiz4',
            isCleared: true,
            clearTimeMs: any(named: 'clearTimeMs'),
            score: any(named: 'score'),
            failureCount: 0,
          ),
        ).called(1);
      });
    });

    test('playing状態でない時にopenRadarMapしてもcorrectにならない', () async {
      final sub = container.listen(
        radarMapQuizProvider,
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      // idle状態でopenRadarMap
      container.read(weatherAppProvider.notifier).openRadarMap();
      await Future<void>.delayed(const Duration(milliseconds: 50));

      expect(container.read(radarMapQuizProvider).status, QuizStatus.idle);
    });

    test('retry()でstatusとweatherAppProviderがリセットされる', () async {
      container.read(radarMapQuizProvider.notifier).startQuiz();
      await container.read(radarMapQuizProvider.notifier).giveUp();
      container.read(radarMapQuizProvider.notifier).retry();

      expect(container.read(radarMapQuizProvider).status, QuizStatus.idle);
    });
  });
}
