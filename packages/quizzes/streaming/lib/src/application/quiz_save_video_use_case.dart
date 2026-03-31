/// 「動画をお気に入りに追加する」クイズのクリア判定ユースケース
class QuizSaveVideoUseCase {
  const QuizSaveVideoUseCase();

  bool isClear({required bool isSaved}) => isSaved;

  String? failureReason({required bool isSaved}) {
    if (isClear(isSaved: isSaved)) return null;
    return '動画をお気に入りに追加してください';
  }
}
