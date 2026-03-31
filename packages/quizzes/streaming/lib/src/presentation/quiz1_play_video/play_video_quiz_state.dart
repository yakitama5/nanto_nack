import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/domain/entities/streaming_video.dart';

class PlayVideoQuizState extends QuizStateBase {
  const PlayVideoQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.video,
    required this.isPlaying,
    required this.progressSeconds,
    required this.remainingSeconds,
  });

  final StreamingVideo video;
  final bool isPlaying;
  final int progressSeconds;
  final int remainingSeconds;

  PlayVideoQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    StreamingVideo? video,
    bool? isPlaying,
    int? progressSeconds,
    int? remainingSeconds,
  }) {
    return PlayVideoQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      video: video ?? this.video,
      isPlaying: isPlaying ?? this.isPlaying,
      progressSeconds: progressSeconds ?? this.progressSeconds,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }

  factory PlayVideoQuizState.initial({
    required StreamingVideo video,
    int timeLimitSeconds = 60,
  }) =>
      PlayVideoQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        video: video,
        isPlaying: false,
        progressSeconds: 0,
        remainingSeconds: timeLimitSeconds,
      );
}
