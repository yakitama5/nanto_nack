import 'package:news/src/domain/entities/news_article.dart';

/// ニュースアプリのマスターデータカタログ
///
/// 記事の title と contentPreview は Slang キー（例: "news.top.1.title"）で指定し、
/// UI 表示時にカスタム言語に変換される。
class NewsCatalog {
  NewsCatalog._();

  /// 全クイズ共通の記事リスト（top×3, entertainment×2, sports×3 = 8件）
  static List<NewsArticle> articles() => [
    // トップニュース（主要）×3
    const NewsArticle(
      id: 'news_q_top_1',
      title: 'news.top.1.title',
      contentPreview: 'news.top.1.preview',
      category: NewsCategory.top,
      imageUrl: '',
    ),
    const NewsArticle(
      id: 'news_q_top_2',
      title: 'news.top.2.title',
      contentPreview: 'news.top.2.preview',
      category: NewsCategory.top,
      imageUrl: '',
    ),
    const NewsArticle(
      id: 'news_q_top_3',
      title: 'news.top.3.title',
      contentPreview: 'news.top.3.preview',
      category: NewsCategory.top,
      imageUrl: '',
    ),
    // エンタメ×2（quiz4TargetArticleId が必ずここに含まれる）
    const NewsArticle(
      id: 'news_q_entertainment_1',
      title: 'news.entertainment.1.title',
      contentPreview: 'news.entertainment.1.preview',
      category: NewsCategory.entertainment,
      imageUrl: '',
    ),
    const NewsArticle(
      id: 'news_q_movie_review',
      title: 'news.entertainment.2.title',
      contentPreview: 'news.entertainment.2.preview',
      category: NewsCategory.entertainment,
      imageUrl: '',
      isSpoiler: true,
    ),
    // スポーツ×3
    const NewsArticle(
      id: 'news_q_sports_1',
      title: 'news.sports.1.title',
      contentPreview: 'news.sports.1.preview',
      category: NewsCategory.sports,
      imageUrl: '',
    ),
    const NewsArticle(
      id: 'news_q_sports_2',
      title: 'news.sports.2.title',
      contentPreview: 'news.sports.2.preview',
      category: NewsCategory.sports,
      imageUrl: '',
    ),
    const NewsArticle(
      id: 'news_q_sports_3',
      title: 'news.sports.3.title',
      contentPreview: 'news.sports.3.preview',
      category: NewsCategory.sports,
      imageUrl: '',
    ),
  ];
}
