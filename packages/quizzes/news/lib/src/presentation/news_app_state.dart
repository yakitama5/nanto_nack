import 'dart:collection';

import 'package:news/src/domain/entities/news_article.dart';

/// ニュースアプリの共通UI状態
///
/// 各クイズの状態クラスに埋め込んで使用する。
/// [articles] は不変ビューとして公開し、外部からの直接変更を防ぐ。
class NewsAppState {
  NewsAppState({
    required List<NewsArticle> articles,
    required this.currentCategory,
    required this.fontSize,
  }) : articles = UnmodifiableListView(List.from(articles));

  /// 全記事のリスト（読み取り専用）
  final UnmodifiableListView<NewsArticle> articles;

  /// 現在表示中のカテゴリ
  final NewsCategory currentCategory;

  /// 記事の文字サイズ
  final ArticleFontSize fontSize;

  factory NewsAppState.initial({required List<NewsArticle> initialArticles}) =>
      NewsAppState(
        articles: initialArticles,
        currentCategory: NewsCategory.top,
        fontSize: ArticleFontSize.medium,
      );

  /// 現在カテゴリかつ isHidden == false の記事のみ返す
  List<NewsArticle> get visibleArticles => articles
      .where((a) => a.category == currentCategory && !a.isHidden)
      .toList();

  NewsAppState copyWith({
    List<NewsArticle>? articles,
    NewsCategory? currentCategory,
    ArticleFontSize? fontSize,
  }) {
    return NewsAppState(
      articles: articles != null ? List.from(articles) : this.articles.toList(),
      currentCategory: currentCategory ?? this.currentCategory,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}
