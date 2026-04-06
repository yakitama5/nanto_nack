import 'package:chat/src/domain/chat_tab.dart';
import 'package:chat/src/domain/entities/chat_message.dart';
import 'package:quiz_core/quiz_core.dart';

class ReactionQuizState extends QuizStateBase {
  const ReactionQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.currentTab,
    required this.isInChatRoom,
    required this.messages,
    required this.remainingSeconds,
    this.reactionPickerMessageId,
  });

  final ChatTab currentTab;
  final bool isInChatRoom;
  final List<ChatMessage> messages;
  final int remainingSeconds;

  /// リアクションピッカーを表示するメッセージID（null = 非表示）
  final String? reactionPickerMessageId;

  ReactionQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    ChatTab? currentTab,
    bool? isInChatRoom,
    List<ChatMessage>? messages,
    int? remainingSeconds,
    // null クリアを可能にするための sentinel パターン
    Object? reactionPickerMessageId = _absent,
  }) {
    return ReactionQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      currentTab: currentTab ?? this.currentTab,
      isInChatRoom: isInChatRoom ?? this.isInChatRoom,
      messages: messages ?? this.messages,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      reactionPickerMessageId: identical(reactionPickerMessageId, _absent)
          ? this.reactionPickerMessageId
          : reactionPickerMessageId as String?,
    );
  }

  factory ReactionQuizState.initial({
    required List<ChatMessage> initialMessages,
    int timeLimitSeconds = 45,
  }) =>
      ReactionQuizState(
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

/// null を明示的にセットするための sentinel 定数
const _absent = Object();
