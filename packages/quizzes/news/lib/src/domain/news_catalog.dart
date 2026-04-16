import 'package:news/src/domain/entities/news_article.dart';

/// ニュースアプリのマスターデータカタログ
///
/// テキストはすべて英語で定義し、UI表示時にカスタム言語に変換する。
/// [quiz4TargetArticleId] = 'news_q_movie_review' がentertainmentに含まれること。
class NewsCatalog {
  NewsCatalog._();

  /// 全クイズ共通の記事リスト（top×3, entertainment×2, sports×3 = 8件）
  static List<NewsArticle> articles() => [
        // トップニュース（主要）×3
        const NewsArticle(
          id: 'news_q_top_1',
          title: 'Government announces new economic policy',
          contentPreview:
              'The government unveiled a comprehensive economic policy aimed at boosting growth and reducing unemployment.',
          category: NewsCategory.top,
          imageUrl: '',
        ),
        const NewsArticle(
          id: 'news_q_top_2',
          title: 'Major earthquake hits coastal region',
          contentPreview:
              'A 6.5 magnitude earthquake struck the coastal region early this morning, prompting tsunami warnings.',
          category: NewsCategory.top,
          imageUrl: '',
        ),
        const NewsArticle(
          id: 'news_q_top_3',
          title: 'Tech giant unveils next-generation AI assistant',
          contentPreview:
              'The world\'s largest technology company revealed its latest AI assistant, claiming it surpasses human performance on several benchmarks.',
          category: NewsCategory.top,
          imageUrl: '',
        ),
        // エンタメ×2（quiz4TargetArticleId が必ずここに含まれる）
        const NewsArticle(
          id: 'news_q_entertainment_1',
          title: 'Popular idol group announces world tour',
          contentPreview:
              'The beloved idol group has announced a world tour spanning 20 cities across 10 countries.',
          category: NewsCategory.entertainment,
          imageUrl: '',
        ),
        const NewsArticle(
          id: 'news_q_movie_review',
          title: 'Movie review: The final chapter contains massive spoilers',
          contentPreview:
              'WARNING: This review contains major spoilers for the highly anticipated final chapter of the trilogy.',
          category: NewsCategory.entertainment,
          imageUrl: '',
          isSpoiler: true,
        ),
        // スポーツ×3
        const NewsArticle(
          id: 'news_q_sports_1',
          title: 'National team wins championship after dramatic final',
          contentPreview:
              'The national football team secured the championship trophy after a nail-biting penalty shootout in the final.',
          category: NewsCategory.sports,
          imageUrl: '',
        ),
        const NewsArticle(
          id: 'news_q_sports_2',
          title: 'Marathon world record broken at international event',
          contentPreview:
              'A new world record was set at the international marathon event, with the winner finishing in under two hours.',
          category: NewsCategory.sports,
          imageUrl: '',
        ),
        const NewsArticle(
          id: 'news_q_sports_3',
          title: 'Baseball season opener: home team wins in extra innings',
          contentPreview:
              'The home team clinched a thrilling victory in the season opener, winning in the 12th inning with a walk-off home run.',
          category: NewsCategory.sports,
          imageUrl: '',
        ),
      ];
}
