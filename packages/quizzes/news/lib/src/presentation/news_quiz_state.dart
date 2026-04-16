import 'package:news/src/domain/entities/news_article.dart';
import 'package:news/src/domain/news_quiz_config.dart';
import 'package:news/src/presentation/news_app_state.dart';
import 'package:quiz_core/quiz_core.dart';

/// ニュースクイズ共通の状態
///
/// Quiz1〜4 すべてで共通して使用する。
/// [isRefreshing] は Pull to Refresh 中かどうかを表し、
/// NewsQuizState 直下に置く（NewsAppStateには含めない）。
class NewsQuizState extends QuizStateBase {
  const NewsQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.newsApp,
    required this.remainingSeconds,
    this.isRefreshing = false,
  });

  final NewsAppState newsApp;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// Pull to Refresh 中かどうか（演出用フラグ）
  final bool isRefreshing;

  NewsQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    NewsAppState? newsApp,
    int? remainingSeconds,
    bool? isRefreshing,
  }) {
    return NewsQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      newsApp: newsApp ?? this.newsApp,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }

  factory NewsQuizState.initial({
    required List<NewsArticle> initialArticles,
  }) =>
      NewsQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        newsApp: NewsAppState.initial(initialArticles: initialArticles),
        remainingSeconds: NewsQuizConfig.timeLimitSeconds,
      );
}
