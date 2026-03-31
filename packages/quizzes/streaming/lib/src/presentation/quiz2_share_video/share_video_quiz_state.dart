import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/domain/entities/streaming_video.dart';

class ShareVideoQuizState extends QuizStateBase {
  const ShareVideoQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.video,
    required this.isShared,
    required this.isShareSheetOpen,
    required this.remainingSeconds,
  });

  final StreamingVideo video;
  final bool isShared;
  final bool isShareSheetOpen;
  final int remainingSeconds;

  ShareVideoQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    StreamingVideo? video,
    bool? isShared,
    bool? isShareSheetOpen,
    int? remainingSeconds,
  }) {
    return ShareVideoQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      video: video ?? this.video,
      isShared: isShared ?? this.isShared,
      isShareSheetOpen: isShareSheetOpen ?? this.isShareSheetOpen,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }

  factory ShareVideoQuizState.initial({
    required StreamingVideo video,
    int timeLimitSeconds = 60,
  }) =>
      ShareVideoQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        video: video,
        isShared: false,
        isShareSheetOpen: false,
        remainingSeconds: timeLimitSeconds,
      );
}
