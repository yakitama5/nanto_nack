import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/infrastructure/streaming_quiz_repository.dart';
import 'package:streaming/src/infrastructure/streaming_quiz_repository_provider.dart';
import 'package:streaming/src/presentation/quiz4_offline_save/offline_save_quiz_notifier.dart';
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

  group('OfflineSaveQuizNotifier', () {
    test('selectQuality updates quality', () async {
      container.read(offlineSaveQuizProvider.notifier).startQuiz();
      
      await container.read(offlineSaveQuizProvider.notifier).selectQuality('1080p');
      
      final state = container.read(offlineSaveQuizProvider);
      expect(state.video.quality, '1080p');
      expect(state.status, QuizStatus.playing); // Not cleared yet because isDownloaded is false
    });

    test('tapDownload toggles isDownloaded', () async {
      container.read(offlineSaveQuizProvider.notifier).startQuiz();
      
      await container.read(offlineSaveQuizProvider.notifier).tapDownload();
      
      final state = container.read(offlineSaveQuizProvider);
      expect(state.video.isDownloaded, isTrue);
    });

    test('clears when both condition met', () async {
      container.read(offlineSaveQuizProvider.notifier).startQuiz();
      
      await container.read(offlineSaveQuizProvider.notifier).selectQuality('2160p');
      await container.read(offlineSaveQuizProvider.notifier).tapDownload();
      
      final state = container.read(offlineSaveQuizProvider);
      expect(state.status, QuizStatus.correct);
      verify(() => mockRepo.saveResult(
            quizId: 'streaming_quiz4',
            isCleared: true,
            clearTimeMs: any(named: 'clearTimeMs'),
            score: any(named: 'score'),
            failureCount: 0,
          )).called(1);
    });
  });
}
