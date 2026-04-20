import 'package:chat/src/domain/chat_quiz_config.dart';
import 'package:chat/src/domain/chat_tab.dart';
import 'package:chat/src/domain/entities/chat_contact.dart';
import 'package:chat/src/domain/entities/chat_message.dart';
import 'package:quiz_core/quiz_core.dart';

class SendImageQuizState extends QuizStateBase {
  const SendImageQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.currentTab,
    required this.isInChatRoom,
    required this.messages,
    required this.remainingSeconds,
    this.isImagePickerOpen = false,
    this.openedContact,
  });

  final ChatTab currentTab;
  final bool isInChatRoom;
  final List<ChatMessage> messages;
  final int remainingSeconds;

  /// 画像ピッカーが開いているかどうか
  final bool isImagePickerOpen;

  /// 現在開いているチャットルームのコンタクト
  final ChatContact? openedContact;

  SendImageQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    ChatTab? currentTab,
    bool? isInChatRoom,
    List<ChatMessage>? messages,
    int? remainingSeconds,
    bool? isImagePickerOpen,
    ChatContact? Function()? openedContact,
  }) {
    return SendImageQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      currentTab: currentTab ?? this.currentTab,
      isInChatRoom: isInChatRoom ?? this.isInChatRoom,
      messages: messages ?? this.messages,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isImagePickerOpen: isImagePickerOpen ?? this.isImagePickerOpen,
      openedContact:
          openedContact != null ? openedContact() : this.openedContact,
    );
  }

  factory SendImageQuizState.initial({
    required List<ChatMessage> initialMessages,
  }) =>
      SendImageQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        currentTab: ChatTab.home,
        isInChatRoom: false,
        messages: initialMessages,
        remainingSeconds: ChatQuizConfig.quiz3SendImageTimeLimitSeconds,
      );
}
