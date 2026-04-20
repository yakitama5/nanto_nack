import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/domain/entities/streaming_video.dart';
import 'package:streaming/src/domain/streaming_quiz_config.dart';

class OfflineSaveQuizState extends QuizStateBase {
  const OfflineSaveQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.video,
    required this.remainingSeconds,
    required this.isSettingsOpen,
    required this.isQualityListOpen,
  });

  final StreamingVideo video;
  final int remainingSeconds;
  final bool isSettingsOpen;
  final bool isQualityListOpen;

  OfflineSaveQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    StreamingVideo? video,
    int? remainingSeconds,
    bool? isSettingsOpen,
    bool? isQualityListOpen,
  }) {
    return OfflineSaveQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      video: video ?? this.video,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isSettingsOpen: isSettingsOpen ?? this.isSettingsOpen,
      isQualityListOpen: isQualityListOpen ?? this.isQualityListOpen,
    );
  }

  factory OfflineSaveQuizState.initial({
    required StreamingVideo video,
  }) =>
      OfflineSaveQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        video: video,
        remainingSeconds: StreamingQuizConfig.quiz4OfflineSaveTimeLimitSeconds,
        isSettingsOpen: false,
        isQualityListOpen: false,
      );
}
