abstract final class ComicQuizConfig {
  /// クイズのタイムリミット（秒）
  static const int timeLimitSeconds = 60;

  /// Quiz1: 最初のページ位置（0始まり）
  static const int quiz1InitialPage = 5;

  /// Quiz1: 目標ページ位置（3ページ戻った先）
  static const int quiz1TargetPage = 2;

  /// Quiz2: クリア判定のスケール閾値
  static const double quiz2ScaleThreshold = 1.5;

  /// Quiz4: 応援ボタン連打の目標回数
  static const int quiz4LikeTarget = 10;

  /// 総ページ数
  static const int totalPages = 10;
}
