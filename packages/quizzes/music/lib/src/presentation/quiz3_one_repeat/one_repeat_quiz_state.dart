import 'package:quiz_core/quiz_core.dart';

import '../../domain/music_quiz_config.dart';
import '../music_app_state.dart';

class OneRepeatQuizState extends QuizStateBase {
  const OneRepeatQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.musicState,
    required this.remainingSeconds,
  });

  final MusicAppState musicState;
  final int remainingSeconds;

  OneRepeatQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    MusicAppState? musicState,
    int? remainingSeconds,
  }) {
    return OneRepeatQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      musicState: musicState ?? this.musicState,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }

  factory OneRepeatQuizState.initial() => const OneRepeatQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        musicState: MusicAppState.initial,
        remainingSeconds: MusicQuizConfig.quiz3TimeLimitSeconds,
      );
}
