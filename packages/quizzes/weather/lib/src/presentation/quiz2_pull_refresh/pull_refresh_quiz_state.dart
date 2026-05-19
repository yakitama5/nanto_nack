import 'package:quiz_core/quiz_core.dart';

import '../../domain/weather_quiz_config.dart';

class PullRefreshQuizState extends QuizStateBase {
  const PullRefreshQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.remainingSeconds,
    this.hintUsed = false,
  });

  final int remainingSeconds;
  final bool hintUsed;

  PullRefreshQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    int? remainingSeconds,
    bool? hintUsed,
  }) {
    return PullRefreshQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      hintUsed: hintUsed ?? this.hintUsed,
    );
  }

  factory PullRefreshQuizState.initial() => const PullRefreshQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        remainingSeconds: WeatherQuizConfig.quiz2TimeLimitSeconds,
      );
}
