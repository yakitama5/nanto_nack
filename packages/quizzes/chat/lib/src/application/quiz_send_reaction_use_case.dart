import 'package:chat/src/domain/entities/chat_message.dart';

/// 「リアクションを送る」クイズのクリア判定ユースケース
class QuizSendReactionUseCase {
  const QuizSendReactionUseCase();

  /// 相手のメッセージにハートリアクションがついていればクリア
  bool isClear({required List<ChatMessage> messages}) {
    return messages.any(
      (m) => !m.isMine && m.reaction == '❤️',
    );
  }

  String? failureReason({required List<ChatMessage> messages}) {
    if (isClear(messages: messages)) return null;
    return 'ハートリアクションを送ってください';
  }
}
