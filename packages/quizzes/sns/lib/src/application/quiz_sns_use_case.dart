import '../domain/entities/sns_post.dart';

/// SNSクイズのクリア判定ロジック（ユースケース層）
///
/// 副作用なし・外部依存なしの純粋なDartクラス。
class QuizSnsUseCase {
  /// コンストラクタ
  const QuizSnsUseCase();

  /// Quiz1: 猫投稿がいいねされたかチェック
  bool isClearQuiz1({
    required List<SnsPost> posts,
    required String catPostId,
  }) {
    return posts.any((p) => p.id == catPostId && p.isLiked);
  }

  /// Quiz4: 現在のアカウントがサブアカウントIDになったかチェック
  bool isClearQuiz4({
    required String currentAccount,
    required String subAccountId,
  }) {
    return currentAccount == subAccountId;
  }
}
