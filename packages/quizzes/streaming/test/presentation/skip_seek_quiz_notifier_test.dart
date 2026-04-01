import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/infrastructure/streaming_quiz_repository.dart';
import 'package:streaming/src/infrastructure/streaming_quiz_repository_provider.dart';
import 'package:streaming/src/presentation/quiz2_skip_seek/skip_seek_quiz_notifier.dart';

class MockStreamingQuizRepository extends Mock implements StreamingQuizRepository {}

void main() {
  late MockStreamingQuizRepository mockRepo;
  late ProviderContainer container;

  setUp(() {
    mockRepo = MockStreamingQuizRepository();
    
    when(() => mockRepo.saveResult(
          quizId: any(named: 'quizId'),
          isCleared: any(named: 'isCleared'),
          clearTimeMs: any(named: 'clearTimeMs'),
          score: any(named: 'score'),
          failureCount: any(named: 'failureCount'),
        )).thenAnswer((_) async {});

    container = ProviderContainer(
      overrides: [
        streamingQuizRepositoryProvider.overrideWithValue(mockRepo),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('SkipSeekQuizNotifier', () {
    test('tapNext changes video and sets isSkipped', () {
      container.read(skipSeekQuizProvider.notifier).startQuiz();
      final initialVideoId = container.read(skipSeekQuizProvider).video.id;
      
      container.read(skipSeekQuizProvider.notifier).tapNext();
      
      final state = container.read(skipSeekQuizProvider);
      expect(state.video.id, isNot(initialVideoId));
      expect(state.isSkipped, isTrue);
    });

    test('onSeek updates progress and clears if condition met', () async {
      container.read(skipSeekQuizProvider.notifier).startQuiz();
      container.read(skipSeekQuizProvider.notifier).tapNext();
      
      // Seek to 50%
      container.read(skipSeekQuizProvider.notifier).onSeek(0.5);
      
      final state = container.read(skipSeekQuizProvider);
      expect(state.status, QuizStatus.correct);
      verify(() => mockRepo.saveResult(
            quizId: 'streaming_quiz2',
            isCleared: true,
            clearTimeMs: any(named: 'clearTimeMs'),
            score: any(named: 'score'),
            failureCount: 0,
          )).called(1);
    });
  });
}
