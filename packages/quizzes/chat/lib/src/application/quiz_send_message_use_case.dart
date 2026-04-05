import 'package:chat/src/domain/entities/chat_message.dart';

/// 「テキストメッセージを送る」クイズのクリア判定ユースケース
class QuizSendMessageUseCase {
  const QuizSendMessageUseCase();

  /// 自分のテキストメッセージが1件以上あればクリア
  bool isClear({required List<ChatMessage> messages}) {
    return messages.any((m) => m.isMine && !m.isStamp && !m.isDeleted);
  }

  /// 失敗理由を返す（クリアなら null）
  String? failureReason({required List<ChatMessage> messages}) {
    if (isClear(messages: messages)) return null;
    return 'テキストメッセージを送信してください';
  }
}
