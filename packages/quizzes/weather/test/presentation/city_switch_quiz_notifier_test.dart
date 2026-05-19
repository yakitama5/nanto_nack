import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:weather/src/infrastructure/weather_quiz_repository.dart';
import 'package:weather/src/infrastructure/weather_quiz_repository_provider.dart';
import 'package:weather/src/presentation/quiz1_city_switch/city_switch_quiz_notifier.dart';
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

  group('CitySwitchQuizNotifier', () {
    test('初期状態はidleである', () {
      final state = container.read(citySwitchQuizProvider);
      expect(state.status, QuizStatus.idle);
      expect(state.hintUsed, isFalse);
    });

    test('startQuiz()でstatusがplayingになる', () {
      container.read(citySwitchQuizProvider.notifier).startQuiz();
      final state = container.read(citySwitchQuizProvider);
      expect(state.status, QuizStatus.playing);
      expect(state.startedAt, isNotNull);
    });

    test('idle状態でstartQuizを2回呼んでも状態は変わらない', () {
      container.read(citySwitchQuizProvider.notifier).startQuiz();
      final firstState = container.read(citySwitchQuizProvider);
      container.read(citySwitchQuizProvider.notifier).startQuiz();
      final secondState = container.read(citySwitchQuizProvider);
      // 2回目のstartQuizはplayingなので無視される
      expect(secondState.startedAt, firstState.startedAt);
    });

    test('useHint()でhintUsedがtrueになる', () {
      container.read(citySwitchQuizProvider.notifier).startQuiz();
      container.read(citySwitchQuizProvider.notifier).useHint();
      final state = container.read(citySwitchQuizProvider);
      expect(state.hintUsed, isTrue);
    });

    test('idle状態でuseHint()は無視される', () {
      container.read(citySwitchQuizProvider.notifier).useHint();
      final state = container.read(citySwitchQuizProvider);
      expect(state.hintUsed, isFalse);
    });

    test('giveUp()でstatusがgiveUpになる', () async {
      container.read(citySwitchQuizProvider.notifier).startQuiz();
      await container.read(citySwitchQuizProvider.notifier).giveUp();
      final state = container.read(citySwitchQuizProvider);
      expect(state.status, QuizStatus.giveUp);
      expect(state.remainingSeconds, 0);
    });

    test('giveUp()でリポジトリにisCleared=falseが保存される', () async {
      container.read(citySwitchQuizProvider.notifier).startQuiz();
      await container.read(citySwitchQuizProvider.notifier).giveUp();
      verify(
        () => mockRepo.saveResult(
          quizId: 'weather_quiz1',
          isCleared: false,
          clearTimeMs: null,
          score: 0,
          failureCount: 0,
        ),
      ).called(1);
    });

    test('retry()でstatusがidleにリセットされる', () async {
      container.read(citySwitchQuizProvider.notifier).startQuiz();
      await container.read(citySwitchQuizProvider.notifier).giveUp();
      container.read(citySwitchQuizProvider.notifier).retry();
      final state = container.read(citySwitchQuizProvider);
      expect(state.status, QuizStatus.idle);
      expect(state.hintUsed, isFalse);
    });

    test('都市インデックスが0以外に変わったらcorrectになる', () async {
      // AutoDisposeプロバイダーをリスナーで保持する
      final sub = container.listen(
        citySwitchQuizProvider,
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      await withClock(Clock.fixed(DateTime(2026, 3, 31, 12)), () async {
        container.read(citySwitchQuizProvider.notifier).startQuiz();

        // 都市を変更してクリア条件を満たす
        container.read(weatherAppProvider.notifier).changeCity(1);

        // 非同期処理の完了を待つ
        await Future<void>.delayed(const Duration(milliseconds: 100));

        final state = container.read(citySwitchQuizProvider);
        expect(state.status, QuizStatus.correct);
      });
    });

    test('correctになったときリポジトリにisCleared=trueが保存される', () async {
      final sub = container.listen(
        citySwitchQuizProvider,
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      await withClock(Clock.fixed(DateTime(2026, 3, 31, 12)), () async {
        container.read(citySwitchQuizProvider.notifier).startQuiz();
        container.read(weatherAppProvider.notifier).changeCity(1);
        await Future<void>.delayed(const Duration(milliseconds: 100));

        verify(
          () => mockRepo.saveResult(
            quizId: 'weather_quiz1',
            isCleared: true,
            clearTimeMs: any(named: 'clearTimeMs'),
            score: any(named: 'score'),
            failureCount: 0,
          ),
        ).called(1);
      });
    });

    test('playing状態でない時に都市変更してもcorrectにならない', () async {
      final sub = container.listen(
        citySwitchQuizProvider,
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      // idle状態のまま都市変更
      container.read(weatherAppProvider.notifier).changeCity(1);
      await Future<void>.delayed(const Duration(milliseconds: 50));

      final state = container.read(citySwitchQuizProvider);
      expect(state.status, QuizStatus.idle);
    });

    test('elapsedMsがclock.now()を使って計算される', () async {
      final sub = container.listen(
        citySwitchQuizProvider,
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      final startTime = DateTime(2026, 3, 31, 12);
      await withClock(Clock.fixed(startTime), () async {
        container.read(citySwitchQuizProvider.notifier).startQuiz();
      });

      // 1秒後にクリア
      final clearTime = startTime.add(const Duration(seconds: 1));
      await withClock(Clock.fixed(clearTime), () async {
        container.read(weatherAppProvider.notifier).changeCity(2);
        await Future<void>.delayed(const Duration(milliseconds: 50));
      });

      final state = container.read(citySwitchQuizProvider);
      expect(state.elapsedMs, closeTo(1000, 50));
    });
  });
}
