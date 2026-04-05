import 'package:chat/src/domain/entities/chat_message.dart';
import 'package:quiz_core/quiz_core.dart';

class DeleteMessageQuizState extends QuizStateBase {
  const DeleteMessageQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.messages,
    required this.remainingSeconds,
    required this.messageDeleted,
  });

  final List<ChatMessage> messages;
  final int remainingSeconds;
  final bool messageDeleted;

  DeleteMessageQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    List<ChatMessage>? messages,
    int? remainingSeconds,
    bool? messageDeleted,
  }) {
    return DeleteMessageQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      messages: messages ?? this.messages,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      messageDeleted: messageDeleted ?? this.messageDeleted,
    );
  }

  factory DeleteMessageQuizState.initial({
    required List<ChatMessage> initialMessages,
    int timeLimitSeconds = 90,
  }) =>
      DeleteMessageQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        messages: initialMessages,
        remainingSeconds: timeLimitSeconds,
        messageDeleted: false,
      );
}
