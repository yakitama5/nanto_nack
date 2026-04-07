import 'package:chat/src/domain/entities/chat_message.dart';

/// 「画像を送る」クイズのクリア判定ユースケース
class QuizSendImageUseCase {
  const QuizSendImageUseCase();

  /// 自分の画像メッセージが1件以上あればクリア
  bool isClear({required List<ChatMessage> messages}) {
    return messages.any((m) => m.isMine && m.isImage);
  }

  String? failureReason({required List<ChatMessage> messages}) {
    if (isClear(messages: messages)) return null;
    return '画像を送信してください';
  }
}
