import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/src/domain/entities/news_article.dart';
import 'package:news/src/domain/news_quiz_config.dart';
import 'package:news/src/i18n/news_translations_extension.dart';
import 'package:news/src/presentation/news_quiz_notifier.dart';
import 'package:news/src/presentation/news_quiz_state.dart';
import 'package:news/src/presentation/news_quiz_type.dart';
import 'package:quiz_core/quiz_core.dart';

/// ニュースアプリ謎解きの共通画面。
///
/// [type] によって Quiz1〜4 のいずれかとして動作する。
/// UI の骨格・ライフサイクル（cutIn / resultOverlay / giveUp）は共通。
/// クイズ固有のクリア条件は [type] で分岐する。
class NewsQuizScreen extends ConsumerStatefulWidget {
  const NewsQuizScreen({
    super.key,
    required this.type,
    this.onCompleted,
  });

  final NewsQuizType type;
  final VoidCallback? onCompleted;

  @override
  ConsumerState<NewsQuizScreen> createState() => _NewsQuizScreenState();
}

class _NewsQuizScreenState extends ConsumerState<NewsQuizScreen>
    with TickerProviderStateMixin {
  bool _showCutIn = true;
  bool _resultOverlayShown = false;

  NewsQuizType get _type => widget.type;

  /// タブの順序定義
  static const _tabs = [
    NewsCategory.top,
    NewsCategory.entertainment,
    NewsCategory.sports,
  ];

  late final TabController _tabController;
  late final PageController _pageController;

  /// ページ変更中フラグ（無限ループ防止）
  bool _isPageChanging = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _pageController = PageController();

    // タブタップ → PageView ジャンプ
    _tabController.addListener(_onTabChanged);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(newsQuizProvider(_type).notifier).startQuiz();
    });
  }

  void _onTabChanged() {
    if (_isPageChanging) return;
    if (!_tabController.indexIsChanging) return;
    final index = _tabController.index;
    _isPageChanging = true;
    _pageController.jumpToPage(index);
    ref
        .read(newsQuizProvider(_type).notifier)
        .changeCategory(_tabs[index]);
    _isPageChanging = false;
  }

  @override
  void dispose() {
    _tabController
      ..removeListener(_onTabChanged)
      ..dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(newsQuizProvider(_type));
    final missionText = _missionText();
    final notifier = ref.read(newsQuizProvider(_type).notifier);
    final newsTheme = Theme.of(context).extension<NewsAppTheme>()!;

    // rootNavigator 経由でリザルトオーバーレイを最前面に表示する。
    // Navigator.push した詳細ページが開いている場合もオーバーレイが上に被さる。
    ref.listen(newsQuizProvider(_type).select((s) => s.status), (prev, next) {
      final done = next == QuizStatus.correct ||
          next == QuizStatus.giveUp ||
          next == QuizStatus.timeUp;
      if (!done || _resultOverlayShown) return;
      _resultOverlayShown = true;
      final currentState = ref.read(newsQuizProvider(_type));
      Navigator.of(context, rootNavigator: true).push(
        PageRouteBuilder<void>(
          opaque: false,
          barrierColor: Colors.transparent,
          pageBuilder: (_, __, ___) => QuizResultOverlay(
            status: next,
            score: currentState.score,
            elapsedMs: currentState.elapsedMs,
            onRetry: () {
              Navigator.of(context, rootNavigator: true).pop();
              _resultOverlayShown = false;
              setState(() => _showCutIn = true);
              _tabController.animateTo(0);
              _pageController.jumpToPage(0);
              notifier.retry();
            },
            onNext: next == QuizStatus.correct ? widget.onCompleted : null,
            onBack: () {
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.of(context).pop();
            },
            insight: _buildInsight(),
          ),
        ),
      );
    });

    return QuizExitScope(
      quizStatus: state.status,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: newsTheme.scaffoldBackground,
            appBar: PreferredSize(
              preferredSize:
                  const Size.fromHeight(kToolbarHeight + 72.0),
              child: _NewsAppBar(
                type: _type,
                tabController: _tabController,
              ),
            ),
            body: _buildBody(state: state, notifier: notifier),
          ),
          if (state.status == QuizStatus.playing)
            FloatingMissionBubble(
              missionText: missionText,
              remainingSeconds: state.remainingSeconds,
              timeLimitSeconds: NewsQuizConfig.timeLimitSeconds,
              hintUsed: state.hintUsed,
              onHintTap: null,
              onGiveUp: () => notifier.giveUp(),
            ),
          if (_showCutIn)
            MissionCutIn(
              missionText: missionText,
              timeLimitSeconds: NewsQuizConfig.timeLimitSeconds,
              onFinished: () => setState(() => _showCutIn = false),
            ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // Body
  // ─────────────────────────────────────────────

  Widget _buildBody({
    required NewsQuizState state,
    required NewsQuizNotifier notifier,
  }) {
    final newsTheme = Theme.of(context).extension<NewsAppTheme>()!;

    return PageView.builder(
      controller: _pageController,
      itemCount: _tabs.length,
      onPageChanged: (index) {
        if (_isPageChanging) return;
        _isPageChanging = true;
        _tabController.animateTo(index);
        notifier.changeCategory(_tabs[index]);
        _isPageChanging = false;
      },
      itemBuilder: (context, index) {
        final category = _tabs[index];
        final articles = state.newsApp.articles
            .where((a) => a.category == category && !a.isHidden)
            .toList();

        return RefreshIndicator(
          color: newsTheme.brandRed,
          onRefresh: () => notifier.refreshNews(),
          child: articles.isEmpty
              ? ListView(
                  // 空のListViewで RefreshIndicator を使えるようにする
                  children: [
                    SizedBox(
                      height: MediaQuery.heightOf(context) * 0.6,
                      child: Center(
                        child: Text(
                          context.sq.common.noArticles,
                          style: TextStyle(color: newsTheme.textSecondary),
                        ),
                      ),
                    ),
                    const SizedBox.shrink(),
                  ],
                )
              : ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: articles.length,
                  separatorBuilder: (_, __) => Divider(
                    height: 1,
                    color: newsTheme.borderColor,
                  ),
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return _NewsListItem(
                      article: article,
                      onTap: () => _openArticleDetail(article),
                      onHide: () => _hideArticle(article.id),
                    );
                  },
                ),
        );
      },
    );
  }

  void _openArticleDetail(NewsArticle article) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => _ArticleDetailPage(
          article: article,
          type: _type,
        ),
      ),
    );
  }

  void _hideArticle(String articleId) {
    ref.read(newsQuizProvider(_type).notifier).hideArticle(articleId);
  }

  // ─────────────────────────────────────────────
  // Mission text
  // ─────────────────────────────────────────────

  String _missionText() {
    return switch (_type) {
      NewsQuizType.refresh => context.s.quiz1.missionText,
      NewsQuizType.category => context.s.quiz2.missionText,
      NewsQuizType.fontSize => context.s.quiz3.missionText,
      NewsQuizType.hideArticle => context.s.quiz4.missionText,
    };
  }

  // ─────────────────────────────────────────────
  // Insight
  // ─────────────────────────────────────────────

  Widget _buildInsight() {
    return Builder(
      builder: (context) {
        return switch (_type) {
          NewsQuizType.refresh => _buildInsightQuiz1(context),
          NewsQuizType.category => _buildInsightQuiz2(context),
          NewsQuizType.fontSize => _buildInsightQuiz3(context),
          NewsQuizType.hideArticle => _buildInsightQuiz4(context),
        };
      },
    );
  }

  Widget _buildInsightQuiz1(BuildContext context) {
    final insight = context.s.quiz1.insight;
    return QuizInsightContent(
      title: insight.title,
      subtitle: insight.subtitle,
      items: [
        QuizInsightItem(
          emoji: '👇',
          title: insight.pullTitle,
          desc: insight.pullDesc,
        ),
        QuizInsightItem(
          emoji: '🔄',
          title: insight.spinnerTitle,
          desc: insight.spinnerDesc,
        ),
        QuizInsightItem(
          emoji: '📰',
          title: insight.feedTitle,
          desc: insight.feedDesc,
        ),
      ],
    );
  }

  Widget _buildInsightQuiz2(BuildContext context) {
    final insight = context.s.quiz2.insight;
    return QuizInsightContent(
      title: insight.title,
      subtitle: insight.subtitle,
      items: [
        QuizInsightItem(
          emoji: '📑',
          title: insight.tabTitle,
          desc: insight.tabDesc,
        ),
        QuizInsightItem(
          emoji: '👆',
          title: insight.swipeTitle,
          desc: insight.swipeDesc,
        ),
        QuizInsightItem(
          emoji: '🏷️',
          title: insight.labelTitle,
          desc: insight.labelDesc,
        ),
      ],
    );
  }

  Widget _buildInsightQuiz3(BuildContext context) {
    final insight = context.s.quiz3.insight;
    return QuizInsightContent(
      title: insight.title,
      subtitle: insight.subtitle,
      items: [
        QuizInsightItem(
          emoji: '🔤',
          title: insight.aaTitle,
          desc: insight.aaDesc,
        ),
        QuizInsightItem(
          emoji: '♿',
          title: insight.accessTitle,
          desc: insight.accessDesc,
        ),
        QuizInsightItem(
          emoji: '📏',
          title: insight.sizeTitle,
          desc: insight.sizeDesc,
        ),
      ],
    );
  }

  Widget _buildInsightQuiz4(BuildContext context) {
    final insight = context.s.quiz4.insight;
    return QuizInsightContent(
      title: insight.title,
      subtitle: insight.subtitle,
      items: [
        QuizInsightItem(
          emoji: '👇',
          title: insight.longPressTitle,
          desc: insight.longPressDesc,
        ),
        QuizInsightItem(
          emoji: '⋯',
          title: insight.menuTitle,
          desc: insight.menuDesc,
        ),
        QuizInsightItem(
          emoji: '🙈',
          title: insight.hideTitle,
          desc: insight.hideDesc,
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// AppBar（タブ付き）
// ─────────────────────────────────────────────

class _NewsAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _NewsAppBar({
    required this.type,
    required this.tabController,
  });

  final NewsQuizType type;
  final TabController tabController;

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + 72.0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsTheme = Theme.of(context).extension<NewsAppTheme>()!;
    final sq = context.sq;

    return AppBar(
      backgroundColor: newsTheme.tabBarBackground,
      foregroundColor: newsTheme.textPrimary,
      elevation: 1,
      title: Text(
        sq.common.appTitle,
        style: TextStyle(
          color: newsTheme.brandRed,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      bottom: TabBar(
        controller: tabController,
        indicatorColor: newsTheme.tabBarIndicatorColor,
        labelColor: newsTheme.tabBarIndicatorColor,
        unselectedLabelColor: newsTheme.textSecondary,
        tabs: [
          Tab(icon: const Icon(Icons.article), text: sq.common.tabTop),
          Tab(icon: const Icon(Icons.movie), text: sq.common.tabEntertainment),
          Tab(
            icon: const Icon(Icons.sports_soccer),
            text: sq.common.tabSports,
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 記事一覧アイテム
// ─────────────────────────────────────────────

class _NewsListItem extends StatelessWidget {
  const _NewsListItem({
    required this.article,
    required this.onTap,
    required this.onHide,
  });

  final NewsArticle article;
  final VoidCallback onTap;
  final VoidCallback onHide;

  @override
  Widget build(BuildContext context) {
    final newsTheme = Theme.of(context).extension<NewsAppTheme>()!;
    final sq = context.sq;

    return GestureDetector(
      onLongPress: () => _showOptionsBottomSheet(context, newsTheme),
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: newsTheme.articleBackground,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      CustomLanguageEncoder.encode(article.title),
                      style: TextStyle(
                        color: newsTheme.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (article.isSpoiler) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.visibility_off,
                            size: 12,
                            color: newsTheme.brandRed,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            sq.common.spoilerLabel,
                            style: TextStyle(
                              color: newsTheme.brandRed,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(height: 4),
                    Text(
                      CustomLanguageEncoder.encode(article.contentPreview),
                      style: TextStyle(
                        color: newsTheme.textSecondary,
                        fontSize: 13,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: newsTheme.textSecondary,
                  size: 20,
                ),
                tooltip: sq.common.moreOptions,
                onPressed: () => _showOptionsBottomSheet(context, newsTheme),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showOptionsBottomSheet(
    BuildContext context,
    NewsAppTheme newsTheme,
  ) {
    final sq = context.sq;
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: newsTheme.bottomSheetBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.visibility_off, color: newsTheme.textPrimary),
              title: Text(
                sq.common.hideArticle,
                style: TextStyle(color: newsTheme.textPrimary),
              ),
              onTap: () {
                Navigator.pop(ctx);
                onHide();
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 記事詳細ページ（Navigator.push で遷移）
// ─────────────────────────────────────────────

class _ArticleDetailPage extends ConsumerWidget {
  const _ArticleDetailPage({
    required this.article,
    required this.type,
  });

  final NewsArticle article;
  final NewsQuizType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newsQuizProvider(type));
    final notifier = ref.read(newsQuizProvider(type).notifier);
    final newsTheme = Theme.of(context).extension<NewsAppTheme>()!;
    final sq = context.sq;

    final fontSize = switch (state.newsApp.fontSize) {
      ArticleFontSize.small => 13.0,
      ArticleFontSize.medium => 16.0,
      ArticleFontSize.large => 20.0,
    };

    return Scaffold(
      backgroundColor: newsTheme.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: newsTheme.tabBarBackground,
        foregroundColor: newsTheme.textPrimary,
        title: Text(
          sq.common.articleDetailTitle,
          style: TextStyle(color: newsTheme.textPrimary),
        ),
        actions: [
          IconButton(
            icon: Text(
              'Aa',
              style: TextStyle(
                color: newsTheme.brandRed,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            tooltip: sq.common.fontSizeLabel,
            onPressed: () =>
                _showFontSizeBottomSheet(context, state, notifier, newsTheme),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.isSpoiler) ...[
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: newsTheme.brandRed.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: newsTheme.brandRed.withValues(alpha: 0.5),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.visibility_off,
                      size: 16,
                      color: newsTheme.brandRed,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      sq.common.spoilerLabel,
                      style: TextStyle(
                        color: newsTheme.brandRed,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            Text(
              CustomLanguageEncoder.encode(article.title),
              style: TextStyle(
                color: newsTheme.textPrimary,
                fontSize: fontSize + 4,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              CustomLanguageEncoder.encode(article.contentPreview),
              style: TextStyle(
                color: newsTheme.textPrimary,
                fontSize: fontSize,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFontSizeBottomSheet(
    BuildContext context,
    NewsQuizState state,
    NewsQuizNotifier notifier,
    NewsAppTheme newsTheme,
  ) {
    final sq = context.sq;

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: newsTheme.bottomSheetBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                sq.common.fontSizeLabel,
                style: TextStyle(
                  color: newsTheme.textSecondary,
                  fontSize: 13,
                ),
              ),
            ),
            _FontSizeOption(
              label: sq.common.fontSizeSmall,
              isSelected: state.newsApp.fontSize == ArticleFontSize.small,
              onTap: () {
                Navigator.pop(ctx);
                notifier.changeFontSize(ArticleFontSize.small);
              },
              newsTheme: newsTheme,
            ),
            _FontSizeOption(
              label: sq.common.fontSizeMedium,
              isSelected: state.newsApp.fontSize == ArticleFontSize.medium,
              onTap: () {
                Navigator.pop(ctx);
                notifier.changeFontSize(ArticleFontSize.medium);
              },
              newsTheme: newsTheme,
            ),
            _FontSizeOption(
              label: sq.common.fontSizeLarge,
              isSelected: state.newsApp.fontSize == ArticleFontSize.large,
              onTap: () {
                Navigator.pop(ctx);
                notifier.changeFontSize(ArticleFontSize.large);
              },
              newsTheme: newsTheme,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _FontSizeOption extends StatelessWidget {
  const _FontSizeOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.newsTheme,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final NewsAppTheme newsTheme;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          color: isSelected
              ? newsTheme.fontSizeSelectedColor
              : newsTheme.textPrimary,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: isSelected
          ? Icon(Icons.check, color: newsTheme.fontSizeSelectedColor)
          : null,
      onTap: onTap,
    );
  }
}
