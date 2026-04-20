import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/domain/entities/streaming_video.dart';
import 'package:streaming/src/domain/streaming_quiz_config.dart';

class PlaybackSpeedQuizState extends QuizStateBase {
  const PlaybackSpeedQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.video,
    required this.remainingSeconds,
    required this.isSettingsOpen,
    required this.isSpeedListOpen,
  });

  final StreamingVideo video;
  final int remainingSeconds;
  final bool isSettingsOpen;
  final bool isSpeedListOpen;

  PlaybackSpeedQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    StreamingVideo? video,
    int? remainingSeconds,
    bool? isSettingsOpen,
    bool? isSpeedListOpen,
  }) {
    return PlaybackSpeedQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      video: video ?? this.video,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isSettingsOpen: isSettingsOpen ?? this.isSettingsOpen,
      isSpeedListOpen: isSpeedListOpen ?? this.isSpeedListOpen,
    );
  }

  factory PlaybackSpeedQuizState.initial({
    required StreamingVideo video,
  }) =>
      PlaybackSpeedQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        video: video,
        remainingSeconds:
            StreamingQuizConfig.quiz3PlaybackSpeedTimeLimitSeconds,
        isSettingsOpen: false,
        isSpeedListOpen: false,
      );
}
