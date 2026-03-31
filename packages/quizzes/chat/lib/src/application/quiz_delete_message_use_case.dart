/// 「メッセージを削除する」クイズのクリア判定ユースケース
class QuizDeleteMessageUseCase {
  const QuizDeleteMessageUseCase();

  /// メッセージが1件以上削除されていればクリア
  bool isClear({required bool messageDeleted}) {
    return messageDeleted;
  }

  /// 失敗理由を返す（クリアなら null）
  String? failureReason({required bool messageDeleted}) {
    if (isClear(messageDeleted: messageDeleted)) return null;
    return 'メッセージを長押しして削除してください';
  }
}
