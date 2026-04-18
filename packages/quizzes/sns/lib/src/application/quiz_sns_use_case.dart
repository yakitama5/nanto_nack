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

  /// Quiz2: 投稿が入力されているかチェック
  bool isClearQuiz2({
    required String composeText,
  }) {
    return composeText.trim().isNotEmpty;
  }

  /// Quiz4: 検索クエリが一致しているかチェック
  bool isClearQuiz4({
    required String searchText,
    required String targetQuery,
  }) {
    return searchText.trim() == targetQuery;
  }
}
