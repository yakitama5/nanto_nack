import 'package:quiz_core/quiz_core.dart';

import '../../domain/delivery_quiz_config.dart';

class FindPizzaQuizState extends QuizStateBase {
  const FindPizzaQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.remainingSeconds,
    this.hintUsed = false,
  });

  final int remainingSeconds;
  final bool hintUsed;

  FindPizzaQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    int? remainingSeconds,
    bool? hintUsed,
  }) {
    return FindPizzaQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      hintUsed: hintUsed ?? this.hintUsed,
    );
  }

  factory FindPizzaQuizState.initial() => const FindPizzaQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        remainingSeconds: DeliveryQuizConfig.quiz1TimeLimitSeconds,
      );
}
