import 'package:chat/src/domain/chat_quiz_config.dart';
import 'package:chat/src/domain/entities/chat_message.dart';
import 'package:quiz_core/quiz_core.dart';

class SendMessageQuizState extends QuizStateBase {
  const SendMessageQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.messages,
    required this.inputText,
    required this.remainingSeconds,
  });

  final List<ChatMessage> messages;
  final String inputText;
  final int remainingSeconds;

  SendMessageQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    List<ChatMessage>? messages,
    String? inputText,
    int? remainingSeconds,
  }) {
    return SendMessageQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      messages: messages ?? this.messages,
      inputText: inputText ?? this.inputText,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }

  factory SendMessageQuizState.initial({
    required List<ChatMessage> initialMessages,
  }) =>
      SendMessageQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        messages: initialMessages,
        inputText: '',
        remainingSeconds: ChatQuizConfig.quiz1SendMessageTimeLimitSeconds,
      );
}
