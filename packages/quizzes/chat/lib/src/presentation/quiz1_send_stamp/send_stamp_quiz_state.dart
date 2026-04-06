import 'package:chat/src/domain/chat_tab.dart';
import 'package:chat/src/domain/entities/chat_message.dart';
import 'package:quiz_core/quiz_core.dart';

class SendStampQuizState extends QuizStateBase {
  const SendStampQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.currentTab,
    required this.isInChatRoom,
    required this.messages,
    required this.remainingSeconds,
    this.isStampPanelOpen = false,
  });

  final ChatTab currentTab;
  final bool isInChatRoom;
  final List<ChatMessage> messages;
  final int remainingSeconds;
  final bool isStampPanelOpen;

  SendStampQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    ChatTab? currentTab,
    bool? isInChatRoom,
    List<ChatMessage>? messages,
    int? remainingSeconds,
    bool? isStampPanelOpen,
  }) {
    return SendStampQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      currentTab: currentTab ?? this.currentTab,
      isInChatRoom: isInChatRoom ?? this.isInChatRoom,
      messages: messages ?? this.messages,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isStampPanelOpen: isStampPanelOpen ?? this.isStampPanelOpen,
    );
  }

  factory SendStampQuizState.initial({
    required List<ChatMessage> initialMessages,
    int timeLimitSeconds = 30,
  }) =>
      SendStampQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        currentTab: ChatTab.home,
        isInChatRoom: false,
        messages: initialMessages,
        remainingSeconds: timeLimitSeconds,
      );
}
