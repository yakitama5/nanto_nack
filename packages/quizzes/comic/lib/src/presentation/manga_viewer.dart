import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';

import '../i18n/comic_translations_extension.dart';
import 'manga_app_state.dart';

/// 漫画ビューア全体のスキャフォールド
///
/// ページビュー・メニューオーバーレイ・最終ページコンポーネントを統合する。
class MangaViewerScaffold extends StatelessWidget {
  const MangaViewerScaffold({
    super.key,
    required this.state,
    required this.quizStatus,
    required this.totalPages,
    required this.onPageChanged,
    required this.onScaleChanged,
    required this.onToggleMenu,
    required this.onIncrementLikes,
    required this.likeTarget,
    required this.overlays,
  });

  final MangaAppState state;
  final QuizStatus quizStatus;
  final int totalPages;
  final void Function(int) onPageChanged;
  final void Function(double) onScaleChanged;
  final VoidCallback onToggleMenu;
  final VoidCallback onIncrementLikes;
  final int likeTarget;
  final List<Widget> overlays;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ComicAppTheme>()!;
    return QuizExitScope(
      quizStatus: quizStatus,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: theme.pageBackgroundColor,
            body: SafeArea(
              child: _MangaPageView(
                state: state,
                totalPages: totalPages,
                onPageChanged: onPageChanged,
                onScaleChanged: onScaleChanged,
                onToggleMenu: onToggleMenu,
                onIncrementLikes: onIncrementLikes,
                likeTarget: likeTarget,
              ),
            ),
          ),
          MangaOverlayMenu(
            isVisible: state.isMenuVisible,
            currentPage: state.currentPageIndex,
            totalPages: totalPages,
          ),
          ...overlays,
        ],
      ),
    );
  }
}

// ─── ページビュー ────────────────────────────────────────────────

class _MangaPageView extends StatefulWidget {
  const _MangaPageView({
    required this.state,
    required this.totalPages,
    required this.onPageChanged,
    required this.onScaleChanged,
    required this.onToggleMenu,
    required this.onIncrementLikes,
    required this.likeTarget,
  });

  final MangaAppState state;
  final int totalPages;
  final void Function(int) onPageChanged;
  final void Function(double) onScaleChanged;
  final VoidCallback onToggleMenu;
  final VoidCallback onIncrementLikes;
  final int likeTarget;

  @override
  State<_MangaPageView> createState() => _MangaPageViewState();
}

class _MangaPageViewState extends State<_MangaPageView> {
  late final PageController _pageController;

  /// InteractiveViewer の変換行列を管理するコントローラー
  /// scale は value.getMaxScaleOnAxis() で取得できる
  final _transformationController = TransformationController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.state.currentPageIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _transformationController.dispose();
    super.dispose();
  }

  void _onInteractionUpdate(ScaleUpdateDetails details) {
    final scale = _transformationController.value.getMaxScaleOnAxis();
    widget.onScaleChanged(scale);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return PageView.builder(
          // reverse: true で日本語漫画の右開き（右→左読み）を実現
          reverse: true,
          controller: _pageController,
          itemCount: widget.totalPages,
          onPageChanged: widget.onPageChanged,
          itemBuilder: (context, index) {
            final isLastPage = index == widget.totalPages - 1;
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapUp: (details) {
                final x = details.localPosition.dx;
                if (x < width / 3) {
                  // 左1/3タップ：次ページへ（reverse: true のため実際は前に進む）
                  final nextPage = _pageController.page!.round() + 1;
                  if (nextPage < widget.totalPages) {
                    _pageController.animateToPage(
                      nextPage,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                    );
                  }
                } else if (x > width * 2 / 3) {
                  // 右1/3タップ：前ページへ（日本語漫画の「戻る」操作）
                  final prevPage = _pageController.page!.round() - 1;
                  if (prevPage >= 0) {
                    _pageController.animateToPage(
                      prevPage,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                    );
                  }
                } else {
                  // 中央1/3タップ：メニュー表示切替
                  widget.onToggleMenu();
                }
              },
              child: InteractiveViewer(
                transformationController: _transformationController,
                minScale: 1.0,
                maxScale: 4.0,
                onInteractionUpdate: _onInteractionUpdate,
                child: isLastPage
                    ? _LastMangaPage(
                        pageIndex: index,
                        likeCount: widget.state.likeCount,
                        likeTarget: widget.likeTarget,
                        onLike: widget.onIncrementLikes,
                      )
                    : _MangaPageContent(pageIndex: index),
              ),
            );
          },
        );
      },
    );
  }
}

// ─── ページコンテンツ（ダミー） ───────────────────────────────────

/// 漫画ページのダミーコンテンツ
///
/// 実際の画像がないため、ページ番号と漫画風の罫線でページを表現する。
class _MangaPageContent extends StatelessWidget {
  const _MangaPageContent({required this.pageIndex});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ComicAppTheme>()!;
    return Container(
      color: theme.pageBackgroundColor,
      child: Stack(
        children: [
          // 漫画ページ風の背景（コマ枠）
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                // 上段コマ
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: _ComicPanel(
                          emoji: _panelEmoji(pageIndex, 0),
                          color: theme.primaryColor.withValues(alpha: 0.05),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        flex: 2,
                        child: _ComicPanel(
                          emoji: _panelEmoji(pageIndex, 1),
                          color: theme.secondaryColor.withValues(alpha: 0.2),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                // 中段コマ
                Expanded(
                  flex: 3,
                  child: _ComicPanel(
                    emoji: _panelEmoji(pageIndex, 2),
                    color: theme.pageBackgroundColor,
                  ),
                ),
                const SizedBox(height: 4),
                // 下段コマ
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: _ComicPanel(
                          emoji: _panelEmoji(pageIndex, 3),
                          color: theme.secondaryColor.withValues(alpha: 0.15),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        flex: 3,
                        child: _ComicPanel(
                          emoji: _panelEmoji(pageIndex, 4),
                          color: theme.primaryColor.withValues(alpha: 0.05),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // ページ番号（右下）
          Positioned(
            right: 12,
            bottom: 8,
            child: Text(
              '${pageIndex + 1}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _panelEmoji(int page, int panel) {
    // ページ・パネル番号に応じてダミー絵文字を変える
    const emojis = ['📖', '✨', '💬', '⚡', '🌟', '💫', '🎵', '💥', '❗', '🔥'];
    return emojis[(page * 5 + panel) % emojis.length];
  }
}

class _ComicPanel extends StatelessWidget {
  const _ComicPanel({required this.emoji, required this.color});

  final String emoji;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black87, width: 1.5),
      ),
      child: Center(
        child: Text(emoji, style: const TextStyle(fontSize: 32)),
      ),
    );
  }
}

// ─── 最終ページ（応援ボタン付き） ─────────────────────────────────

class _LastMangaPage extends StatefulWidget {
  const _LastMangaPage({
    required this.pageIndex,
    required this.likeCount,
    required this.likeTarget,
    required this.onLike,
  });

  final int pageIndex;
  final int likeCount;
  final int likeTarget;
  final VoidCallback onLike;

  @override
  State<_LastMangaPage> createState() => _LastMangaPageState();
}

class _LastMangaPageState extends State<_LastMangaPage>
    with TickerProviderStateMixin {
  late final AnimationController _heartAnimController;
  late final Animation<double> _heartScaleAnimation;

  @override
  void initState() {
    super.initState();
    _heartAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _heartScaleAnimation = Tween<double>(begin: 1.0, end: 1.4).animate(
      CurvedAnimation(parent: _heartAnimController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _heartAnimController.dispose();
    super.dispose();
  }

  void _handleLikeTap() {
    widget.onLike();
    _heartAnimController.forward().then((_) => _heartAnimController.reverse());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ComicAppTheme>()!;
    final progress = widget.likeCount / widget.likeTarget;

    return Container(
      color: theme.pageBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 「完」表示（UnreadableText でカスタム言語に変換）
          UnreadableText(
            context.sq.endPage.complete,
            isObfuscated: true,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          UnreadableText(
            context.sq.endPage.theEnd,
            isObfuscated: true,
            style: TextStyle(
              fontSize: 16,
              color: theme.primaryColor.withValues(alpha: 0.6),
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 40),
          // 応援ボタン（大きなハートアイコン）
          Semantics(
            button: true,
            label: context.sq.endPage.supportLabel,
            onTap: _handleLikeTap,
            child: GestureDetector(
              excludeFromSemantics: true,
              onTap: _handleLikeTap,
              child: ScaleTransition(
                scale: _heartScaleAnimation,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: theme.primaryColor.withValues(alpha: 0.4),
                        blurRadius: 16,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 52,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // いいね数表示
          Text(
            context.sq.endPage.supportCount
                .replaceAll('{count}', '${widget.likeCount}')
                .replaceAll('{target}', '${widget.likeTarget}'),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
            ),
          ),
          const SizedBox(height: 12),
          // プログレスバー
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress.clamp(0.0, 1.0),
                backgroundColor: theme.secondaryColor,
                valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
                minHeight: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── オーバーレイメニュー ──────────────────────────────────────────

/// 漫画ビューアのヘッダー・フッターオーバーレイメニュー
///
/// [isVisible] が true のときにアニメーション付きでスライドイン表示される。
/// ヘッダーは画面上部、フッターのページスライダーは画面下部に固定表示する。
/// どちらも [SafeArea] でノッチ・ホームバーの見切れを防ぐ。
class MangaOverlayMenu extends StatelessWidget {
  const MangaOverlayMenu({
    super.key,
    required this.isVisible,
    required this.currentPage,
    required this.totalPages,
  });

  final bool isVisible;
  final int currentPage;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ComicAppTheme>()!;
    final overlayColor = theme.overlayColor.withValues(alpha: 0.85);

    return IgnorePointer(
      ignoring: !isVisible,
      // SizedBox.expand でフル画面に広げ、Positioned(bottom:0) が正しく機能するようにする
      child: SizedBox.expand(
        child: Stack(
          children: [
            // ヘッダー（上部固定）
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedSlide(
                offset: isVisible ? Offset.zero : const Offset(0, -1),
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  opacity: isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 250),
                  child: Material(
                    color: overlayColor,
                    child: SafeArea(
                      bottom: false,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: null,
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                            onPressed: null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // フッター（下部固定）：ページスライダー
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedSlide(
                offset: isVisible ? Offset.zero : const Offset(0, 1),
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  opacity: isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 250),
                  child: Material(
                    color: overlayColor,
                    child: SafeArea(
                      top: false,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${currentPage + 1}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '$totalPages',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Colors.white30,
                                thumbColor: Colors.white,
                                overlayColor: Colors.white24,
                              ),
                              child: Slider(
                                value: currentPage.toDouble(),
                                min: 0,
                                max: (totalPages - 1).toDouble(),
                                divisions: totalPages - 1,
                                onChanged: null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
