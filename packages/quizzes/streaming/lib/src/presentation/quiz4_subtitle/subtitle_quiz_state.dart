import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/domain/entities/streaming_video.dart';

class SubtitleQuizState extends QuizStateBase {
  const SubtitleQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.video,
    required this.isMoreMenuOpen,
    required this.remainingSeconds,
  });

  final StreamingVideo video;
  final bool isMoreMenuOpen;
  final int remainingSeconds;

  SubtitleQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    StreamingVideo? video,
    bool? isMoreMenuOpen,
    int? remainingSeconds,
  }) {
    return SubtitleQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      video: video ?? this.video,
      isMoreMenuOpen: isMoreMenuOpen ?? this.isMoreMenuOpen,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }

  factory SubtitleQuizState.initial({
    required StreamingVideo video,
    int timeLimitSeconds = 60,
  }) =>
      SubtitleQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        video: video,
        isMoreMenuOpen: false,
        remainingSeconds: timeLimitSeconds,
      );
}
