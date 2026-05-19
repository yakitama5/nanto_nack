import 'package:quiz_core/quiz_core.dart';

import '../../domain/weather_quiz_config.dart';

class RadarMapQuizState extends QuizStateBase {
  const RadarMapQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.remainingSeconds,
    this.hintUsed = false,
  });

  final int remainingSeconds;
  final bool hintUsed;

  RadarMapQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    int? remainingSeconds,
    bool? hintUsed,
  }) {
    return RadarMapQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      hintUsed: hintUsed ?? this.hintUsed,
    );
  }

  factory RadarMapQuizState.initial() => const RadarMapQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        remainingSeconds: WeatherQuizConfig.quiz4TimeLimitSeconds,
      );
}
