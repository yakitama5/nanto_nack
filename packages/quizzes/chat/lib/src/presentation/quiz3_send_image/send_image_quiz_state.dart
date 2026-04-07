import 'package:chat/src/domain/chat_tab.dart';
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
    this.isCorrectChatRoom = true,
  });

  final ChatTab currentTab;
  final bool isInChatRoom;
  final List<ChatMessage> messages;
  final int remainingSeconds;

  /// 画像ピッカーが開いているかどうか
  final bool isImagePickerOpen;

  /// 現在開いているチャットルームが正解のコンタクトかどうか
  /// false の場合、アクションを実行したタイミングで不正解になる
  final bool isCorrectChatRoom;

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
    bool? isCorrectChatRoom,
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
      isCorrectChatRoom: isCorrectChatRoom ?? this.isCorrectChatRoom,
    );
  }

  factory SendImageQuizState.initial({
    required List<ChatMessage> initialMessages,
    int timeLimitSeconds = 60,
  }) =>
      SendImageQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        currentTab: ChatTab.home,
        isInChatRoom: false,
        messages: initialMessages,
        remainingSeconds: timeLimitSeconds,
        isCorrectChatRoom: true,
      );
}
