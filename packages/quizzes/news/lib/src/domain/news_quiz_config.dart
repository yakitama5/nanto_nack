/// ニュースクイズの設定値
abstract final class NewsQuizConfig {
  /// 全クイズ共通の制限時間（秒）
  static const int timeLimitSeconds = 60;

  /// Quiz4の非表示対象記事ID（映画レビュー記事）
  static const String quiz4TargetArticleId = 'news_q_movie_review';
}
