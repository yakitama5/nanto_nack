import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/infrastructure/streaming_quiz_repository.dart';
import 'package:streaming/src/infrastructure/streaming_quiz_repository_provider.dart';
import 'package:streaming/src/presentation/quiz3_playback_speed/playback_speed_quiz_notifier.dart';

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

  group('PlaybackSpeedQuizNotifier', () {
    test('selectSpeed updates speed and clears if 2x', () async {
      container.read(playbackSpeedQuizProvider.notifier).startQuiz();
      
      await container.read(playbackSpeedQuizProvider.notifier).selectSpeed(2.0);
      
      final state = container.read(playbackSpeedQuizProvider);
      expect(state.video.playbackSpeed, 2.0);
      expect(state.status, QuizStatus.correct);
      verify(() => mockRepo.saveResult(
            quizId: 'streaming_quiz3',
            isCleared: true,
            clearTimeMs: any(named: 'clearTimeMs'),
            score: any(named: 'score'),
            failureCount: 0,
          )).called(1);
    });

    test('longPressStart/End toggles 2x speed and clears if condition met', () async {
      container.read(playbackSpeedQuizProvider.notifier).startQuiz();
      
      container.read(playbackSpeedQuizProvider.notifier).longPressStart();
      
      final state = container.read(playbackSpeedQuizProvider);
      expect(state.video.playbackSpeed, 2.0);
      expect(state.status, QuizStatus.correct);
      
      // status is correct, so longPressEnd should not reset it to 1.0
      container.read(playbackSpeedQuizProvider.notifier).longPressEnd();
      expect(container.read(playbackSpeedQuizProvider).video.playbackSpeed, 2.0);
    });
  });
}
