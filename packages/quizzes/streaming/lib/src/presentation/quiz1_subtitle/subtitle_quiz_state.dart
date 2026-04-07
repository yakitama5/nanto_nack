import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/domain/entities/streaming_video.dart';

class SubtitleQuizState extends QuizStateBase {
  const SubtitleQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.video,
    required this.remainingSeconds,
    required this.isSettingsOpen,
  });

  final StreamingVideo video;
  final int remainingSeconds;
  final bool isSettingsOpen;

  SubtitleQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    StreamingVideo? video,
    int? remainingSeconds,
    bool? isSettingsOpen,
  }) {
    return SubtitleQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      video: video ?? this.video,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isSettingsOpen: isSettingsOpen ?? this.isSettingsOpen,
    );
  }

  factory SubtitleQuizState.initial({
    required StreamingVideo video,
    int timeLimitSeconds = 30,
  }) =>
      SubtitleQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        video: video,
        remainingSeconds: timeLimitSeconds,
        isSettingsOpen: false,
      );
}
