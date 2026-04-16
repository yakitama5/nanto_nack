/// ニュース記事のカテゴリ
enum NewsCategory {
  /// トップニュース（主要）
  top,

  /// エンタメ
  entertainment,

  /// スポーツ
  sports,
}

/// 記事の文字サイズ設定
enum ArticleFontSize {
  /// 小
  small,

  /// 中（デフォルト）
  medium,

  /// 大
  large,
}

/// ニュース記事エンティティ
class NewsArticle {
  const NewsArticle({
    required this.id,
    required this.title,
    required this.contentPreview,
    required this.category,
    required this.imageUrl,
    this.isHidden = false,
  });

  final String id;

  /// 記事タイトル（英語。UIではカスタム言語に変換して表示）
  final String title;

  /// 本文プレビュー（英語。UIではカスタム言語に変換して表示）
  final String contentPreview;

  /// カテゴリ
  final NewsCategory category;

  /// サムネイル画像URL（モックなので空文字でよい）
  final String imageUrl;

  /// 非表示フラグ（Quiz4でユーザーが非表示にした場合 true）
  final bool isHidden;

  NewsArticle copyWith({
    String? id,
    String? title,
    String? contentPreview,
    NewsCategory? category,
    String? imageUrl,
    bool? isHidden,
  }) {
    return NewsArticle(
      id: id ?? this.id,
      title: title ?? this.title,
      contentPreview: contentPreview ?? this.contentPreview,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
