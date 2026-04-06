import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/infrastructure/streaming_quiz_repository.dart';
import 'package:streaming/src/infrastructure/streaming_quiz_repository_provider.dart';
import 'package:streaming/src/presentation/quiz1_subtitle/subtitle_quiz_notifier.dart';
import 'package:system/system.dart';

class MockStreamingQuizRepository extends Mock implements StreamingQuizRepository {}

class MockAnalyticsService extends Mock implements AnalyticsService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockStreamingQuizRepository mockRepo;
  late MockAnalyticsService mockAnalytics;
  late ProviderContainer container;

  setUp(() {
    mockRepo = MockStreamingQuizRepository();
    mockAnalytics = MockAnalyticsService();

    // Mocking the repository calls
    when(() => mockRepo.saveResult(
          quizId: any(named: 'quizId'),
          isCleared: any(named: 'isCleared'),
          clearTimeMs: any(named: 'clearTimeMs'),
          score: any(named: 'score'),
          failureCount: any(named: 'failureCount'),
        )).thenAnswer((_) async {});

    when(() => mockAnalytics.logQuizStarted(quizId: any(named: 'quizId')))
        .thenAnswer((_) async {});
    when(() => mockAnalytics.logQuizCompleted(
          quizId: any(named: 'quizId'),
          score: any(named: 'score'),
          failureCount: any(named: 'failureCount'),
          clearTimeMs: any(named: 'clearTimeMs'),
        )).thenAnswer((_) async {});
    when(() => mockAnalytics.logQuizGivenUp(quizId: any(named: 'quizId')))
        .thenAnswer((_) async {});
    when(() => mockAnalytics.logQuizRetried(quizId: any(named: 'quizId')))
        .thenAnswer((_) async {});

    container = ProviderContainer(
      overrides: [
        streamingQuizRepositoryProvider.overrideWithValue(mockRepo),
        analyticsServiceProvider.overrideWithValue(mockAnalytics),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('SubtitleQuizNotifier', () {
    test('initial state is idle', () {
      final state = container.read(subtitleQuizProvider);
      expect(state.status, QuizStatus.idle);
      expect(state.video.subtitlesEnabled, isFalse);
    });

    test('startQuiz changes status to playing', () {
      container.read(subtitleQuizProvider.notifier).startQuiz();
      final state = container.read(subtitleQuizProvider);
      expect(state.status, QuizStatus.playing);
    });

    test('tapCC toggles subtitles and clears the quiz if clear condition is met', () async {
      // AutoDisposeプロバイダーが非同期処理中にdisposeされないようリスナーを保持
      final sub = container.listen(subtitleQuizProvider, (_, __) {}, fireImmediately: true);
      addTearDown(sub.close);

      await withClock(Clock.fixed(DateTime(2026, 3, 31, 12, 0, 0)), () async {
        container.read(subtitleQuizProvider.notifier).startQuiz();

        // Wait 1 second
        await Future<void>.delayed(const Duration(seconds: 1));

        await container.read(subtitleQuizProvider.notifier).tapCC();
        
        final state = container.read(subtitleQuizProvider);
        expect(state.video.subtitlesEnabled, isTrue);
        expect(state.status, QuizStatus.correct);
        
        verify(() => mockRepo.saveResult(
              quizId: 'streaming_quiz1',
              isCleared: true,
              clearTimeMs: any(named: 'clearTimeMs'),
              score: any(named: 'score'),
              failureCount: 0,
            )).called(1);
      });
    });

    test('giveUp changes status to giveUp', () async {
      container.read(subtitleQuizProvider.notifier).startQuiz();
      await container.read(subtitleQuizProvider.notifier).giveUp();
      
      final state = container.read(subtitleQuizProvider);
      expect(state.status, QuizStatus.giveUp);
      
      verify(() => mockRepo.saveResult(
            quizId: 'streaming_quiz1',
            isCleared: false,
            clearTimeMs: null,
            score: 0,
            failureCount: 0,
          )).called(1);
    });
  });
}
