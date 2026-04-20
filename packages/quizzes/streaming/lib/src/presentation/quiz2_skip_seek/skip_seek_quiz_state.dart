import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/domain/entities/streaming_video.dart';
import 'package:streaming/src/domain/streaming_quiz_config.dart';

class SkipSeekQuizState extends QuizStateBase {
  const SkipSeekQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.video,
    required this.progressSeconds,
    required this.isSkipped,
    required this.remainingSeconds,
    required this.isSettingsOpen,
  });

  final StreamingVideo video;
  final int progressSeconds;
  final bool isSkipped;
  final int remainingSeconds;
  final bool isSettingsOpen;

  SkipSeekQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    StreamingVideo? video,
    int? progressSeconds,
    bool? isSkipped,
    int? remainingSeconds,
    bool? isSettingsOpen,
  }) {
    return SkipSeekQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      video: video ?? this.video,
      progressSeconds: progressSeconds ?? this.progressSeconds,
      isSkipped: isSkipped ?? this.isSkipped,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isSettingsOpen: isSettingsOpen ?? this.isSettingsOpen,
    );
  }

  factory SkipSeekQuizState.initial({
    required StreamingVideo video,
  }) =>
      SkipSeekQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        video: video,
        progressSeconds: 0,
        isSkipped: false,
        remainingSeconds: StreamingQuizConfig.quiz2SkipSeekTimeLimitSeconds,
        isSettingsOpen: false,
      );
}
