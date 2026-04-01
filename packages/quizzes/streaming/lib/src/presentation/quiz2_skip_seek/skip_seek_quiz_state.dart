import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/domain/entities/streaming_video.dart';

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
  });

  final StreamingVideo video;
  final int progressSeconds;
  final bool isSkipped;
  final int remainingSeconds;

  SkipSeekQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    StreamingVideo? video,
    int? progressSeconds,
    bool? isSkipped,
    int? remainingSeconds,
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
    );
  }

  factory SkipSeekQuizState.initial({
    required StreamingVideo video,
    int timeLimitSeconds = 45,
  }) =>
      SkipSeekQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        video: video,
        progressSeconds: 0,
        isSkipped: false,
        remainingSeconds: timeLimitSeconds,
      );
}
