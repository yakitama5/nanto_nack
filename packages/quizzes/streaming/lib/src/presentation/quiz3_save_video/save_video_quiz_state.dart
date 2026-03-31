import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/domain/entities/streaming_video.dart';

class SaveVideoQuizState extends QuizStateBase {
  const SaveVideoQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.video,
    required this.remainingSeconds,
  });

  final StreamingVideo video;
  final int remainingSeconds;

  SaveVideoQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    StreamingVideo? video,
    int? remainingSeconds,
  }) {
    return SaveVideoQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      video: video ?? this.video,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }

  factory SaveVideoQuizState.initial({
    required StreamingVideo video,
    int timeLimitSeconds = 60,
  }) =>
      SaveVideoQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        video: video,
        remainingSeconds: timeLimitSeconds,
      );
}
