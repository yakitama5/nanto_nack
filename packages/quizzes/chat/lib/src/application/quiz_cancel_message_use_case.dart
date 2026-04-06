/// 「メッセージを取り消す」クイズのクリア判定ユースケース
class QuizCancelMessageUseCase {
  const QuizCancelMessageUseCase();

  bool isClear({required bool messageCancelled}) => messageCancelled;

  String? failureReason({required bool messageCancelled}) {
    if (isClear(messageCancelled: messageCancelled)) return null;
    return '自分のメッセージを長押しして取り消してください';
  }
}
