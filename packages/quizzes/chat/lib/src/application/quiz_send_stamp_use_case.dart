import 'package:chat/src/domain/entities/chat_message.dart';

/// 「スタンプを送る」クイズのクリア判定ユースケース
class QuizSendStampUseCase {
  const QuizSendStampUseCase();

  /// 自分のスタンプメッセージが1件以上あればクリア
  bool isClear({required List<ChatMessage> messages}) {
    return messages.any((m) => m.isMine && m.isStamp);
  }

  /// 失敗理由を返す（クリアなら null）
  String? failureReason({required List<ChatMessage> messages}) {
    if (isClear(messages: messages)) return null;
    return 'スタンプを送信してください';
  }
}
