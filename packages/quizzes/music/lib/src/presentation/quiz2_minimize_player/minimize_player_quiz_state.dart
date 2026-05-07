import 'package:quiz_core/quiz_core.dart';

import '../../domain/music_quiz_config.dart';
import '../music_app_state.dart';

class MinimizePlayerQuizState extends QuizStateBase {
  const MinimizePlayerQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.musicState,
    required this.remainingSeconds,
  });

  final MusicAppState musicState;
  final int remainingSeconds;

  MinimizePlayerQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    MusicAppState? musicState,
    int? remainingSeconds,
  }) {
    return MinimizePlayerQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      musicState: musicState ?? this.musicState,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }

  factory MinimizePlayerQuizState.initial() => const MinimizePlayerQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        musicState: MusicAppState.initial,
        remainingSeconds: MusicQuizConfig.quiz2TimeLimitSeconds,
      );
}
