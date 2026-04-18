import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../i18n/strings.g.dart' as sns_i18n;
import '../domain/entities/sns_post.dart';
import '../domain/sns_quiz_config.dart';
import '../domain/sns_quiz_type.dart';
import '../i18n/sns_translations_extension.dart';
import 'sns_quiz_notifier.dart';
import 'sns_quiz_state.dart';
import 'widgets/sns_widgets.dart';

/// SNSクイズ画面（全4クイズ共通）
class SnsQuizScreen extends ConsumerStatefulWidget {
  const SnsQuizScreen({
    super.key,
    required this.quizType,
    this.onCompleted,
  });

  final SnsQuizType quizType;
  final VoidCallback? onCompleted;

  @override
  ConsumerState<SnsQuizScreen> createState() => _SnsQuizScreenState();
}

class _SnsQuizScreenState extends ConsumerState<SnsQuizScreen> {
  bool _showCutIn = true;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(snsQuizNotifierProvider(widget.quizType));
    final notifier = ref.read(
      snsQuizNotifierProvider(widget.quizType).notifier,
    );
    final timeLimitSeconds = SnsQuizConfig.timeLimitSecondsFor(widget.quizType);
    final missionText = _missionText(widget.quizType);
    final isDone =
        state.status == QuizStatus.correct ||
        state.status == QuizStatus.timeUp ||
        state.status == QuizStatus.giveUp;

    return QuizExitScope(
      quizStatus: state.status,
      child: Material(
        type: MaterialType.transparency,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _SnsAppScaffold(
              quizType: widget.quizType,
              state: state,
              notifier: notifier,
            ),
            if (state.isFullScreenImageOpened &&
                state.fullScreenImageUrl != null)
              _FullScreenImageView(
                imageUrl: state.fullScreenImageUrl!,
                onClose: state.status == QuizStatus.playing
                    ? notifier.closeFullScreenImage
                    : null,
              ),
            if (_showCutIn)
              MissionCutIn(
                missionText: missionText,
                timeLimitSeconds: timeLimitSeconds,
                onFinished: () {
                  setState(() => _showCutIn = false);
                  if (mounted) {
                    ref
                        .read(snsQuizNotifierProvider(widget.quizType).notifier)
                        .startQuiz();
                  }
                },
              ),
            if (state.status == QuizStatus.playing && !_showCutIn)
              FloatingMissionBubble(
                remainingSeconds: state.remainingSeconds,
                missionText: missionText,
                hintUsed: false,
                timeLimitSeconds: timeLimitSeconds,
                onGiveUp: notifier.giveUp,
              ),
            if (isDone)
              Positioned.fill(
                child: QuizResultOverlay(
                  status: state.status,
                  score: state.score,
                  elapsedMs: state.elapsedMs,
                  onRetry: () {
                    setState(() => _showCutIn = true);
                    notifier.retry();
                  },
                  onNext: state.status == QuizStatus.correct
                      ? widget.onCompleted
                      : null,
                  onBack: () => Navigator.of(context).pop(),
                  insight: _buildInsight(context, widget.quizType),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _missionText(SnsQuizType quizType) {
    final t = context.s;
    return switch (quizType) {
      SnsQuizType.quiz1 => t.quiz1.missionText,
      SnsQuizType.quiz2 => t.quiz2.missionText,
      SnsQuizType.quiz3 => t.quiz3.missionText,
      SnsQuizType.quiz4 => t.quiz4.missionText,
    };
  }

  Widget _buildInsight(BuildContext context, SnsQuizType quizType) {
    final t = context.s;
    return switch (quizType) {
      SnsQuizType.quiz1 => _quiz1Insight(t),
      SnsQuizType.quiz2 => _quiz2Insight(t),
      SnsQuizType.quiz3 => _quiz3Insight(t),
      SnsQuizType.quiz4 => _quiz4Insight(t),
    };
  }

  QuizInsightContent _quiz1Insight(sns_i18n.Translations t) {
    final insight = t.quiz1.insight;
    return QuizInsightContent(
      title: insight.title,
      subtitle: insight.subtitle,
      items: [
        QuizInsightItem(
          emoji: '👆',
          title: insight.doubleTapTitle,
          desc: insight.doubleTapDesc,
        ),
        QuizInsightItem(
          emoji: '❤️',
          title: insight.heartTitle,
          desc: insight.heartDesc,
        ),
        QuizInsightItem(
          emoji: '🌐',
          title: insight.gestureTitle,
          desc: insight.gestureDesc,
        ),
      ],
    );
  }

  QuizInsightContent _quiz2Insight(sns_i18n.Translations t) {
    final insight = t.quiz2.insight;
    return QuizInsightContent(
      title: insight.title,
      subtitle: insight.subtitle,
      items: [
        QuizInsightItem(
          emoji: '👇',
          title: insight.swipeTitle,
          desc: insight.swipeDesc,
        ),
        QuizInsightItem(
          emoji: '🖼️',
          title: insight.fullscreenTitle,
          desc: insight.fullscreenDesc,
        ),
        QuizInsightItem(
          emoji: '💡',
          title: insight.backTitle,
          desc: insight.backDesc,
        ),
      ],
    );
  }

  QuizInsightContent _quiz3Insight(sns_i18n.Translations t) {
    final insight = t.quiz3.insight;
    return QuizInsightContent(
      title: insight.title,
      subtitle: insight.subtitle,
      items: [
        QuizInsightItem(
          emoji: '👇',
          title: insight.swipeTitle,
          desc: insight.swipeDesc,
        ),
        QuizInsightItem(
          emoji: '🖼️',
          title: insight.fullscreenTitle,
          desc: insight.fullscreenDesc,
        ),
        QuizInsightItem(
          emoji: '💡',
          title: insight.backTitle,
          desc: insight.backDesc,
        ),
      ],
    );
  }

  QuizInsightContent _quiz4Insight(sns_i18n.Translations t) {
    final insight = t.quiz4.insight;
    return QuizInsightContent(
      title: insight.title,
      subtitle: insight.subtitle,
      items: [
        QuizInsightItem(
          emoji: '🔍',
          title: insight.longPressTitle,
          desc: insight.longPressDesc,
        ),
        QuizInsightItem(
          emoji: '📱',
          title: insight.subAccountTitle,
          desc: insight.subAccountDesc,
        ),
        QuizInsightItem(
          emoji: '⚡',
          title: insight.multiAccountTitle,
          desc: insight.multiAccountDesc,
        ),
      ],
    );
  }
}

class _SnsAppScaffold extends StatelessWidget {
  const _SnsAppScaffold({
    required this.quizType,
    required this.state,
    required this.notifier,
  });

  final SnsQuizType quizType;
  final SnsQuizState state;
  final SnsQuizNotifier notifier;

  void _showComposeDialog(BuildContext context) {
    showGeneralDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.white,
      pageBuilder: (context, animation, secondaryAnimation) {
        return _SnsComposeDialog(
          snsTheme: Theme.of(context).extension<SnsAppTheme>()!,
          notifier: notifier,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    final snsTheme = Theme.of(context).extension<SnsAppTheme>()!;

    return Scaffold(
      backgroundColor: snsTheme.scaffoldBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: snsTheme.navBarBackground,
          elevation: 0,
          title: InkWell(
            onTap: state.status == QuizStatus.playing
                ? notifier.scrollToTop
                : null,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: SnsText(
                sq.common.appTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: snsTheme.brandColor,
                ),
              ),
            ),
          ),
          centerTitle: false,
        ),
      ),
      bottomNavigationBar: _SnsBottomNavBar(
        snsTheme: snsTheme,
        sq: sq,
        quizType: quizType,
        state: state,
        notifier: notifier,
      ),
      floatingActionButton: state.status == QuizStatus.playing
          ? FloatingActionButton(
              onPressed: () => _showComposeDialog(context),
              backgroundColor: snsTheme.brandColor,
              shape: const CircleBorder(),
              child: const Icon(Icons.add, color: Colors.white, size: 32),
            )
          : null,
      body: IndexedStack(
        index: state.currentIndex,
        children: [
          _TimelineArea(
            quizType: quizType,
            posts: state.posts,
            notifier: notifier,
            state: state,
          ),
          _SearchView(quizType: quizType),
          const _ComposeView(),
        ],
      ),
    );
  }
}

class _SnsComposeDialog extends StatefulWidget {
  const _SnsComposeDialog({
    required this.snsTheme,
    required this.notifier,
  });

  final SnsAppTheme snsTheme;
  final SnsQuizNotifier notifier;

  @override
  State<_SnsComposeDialog> createState() => _SnsComposeDialogState();
}

class _SnsComposeDialogState extends State<_SnsComposeDialog> {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    return Scaffold(
      backgroundColor: widget.snsTheme.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: widget.snsTheme.navBarBackground,
        elevation: 0,
        leading: TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: SnsText(
            sq.common.cancel,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        leadingWidth: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
            child: ElevatedButton(
              onPressed: () {
                // 投稿ボタン押下時のみ状態を更新
                widget.notifier.updateComposeText(_textController.text);
                widget.notifier.submitPost();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.snsTheme.brandColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: SnsText(
                sq.common.post,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: widget.snsTheme.brandColor,
              child: const Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: _textController,
                autofocus: true,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: sq.common.composeHint,
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SnsBottomNavBar extends StatelessWidget {
  const _SnsBottomNavBar({
    required this.snsTheme,
    required this.sq,
    required this.quizType,
    required this.state,
    required this.notifier,
  });

  final SnsAppTheme snsTheme;
  final sns_i18n.Translations sq;
  final SnsQuizType quizType;
  final SnsQuizState state;
  final SnsQuizNotifier notifier;

  @override
  Widget build(BuildContext context) {
    // 余裕を持った高さ（72px + 下部パディング）に設定
    return Material(
      color: snsTheme.navBarBackground,
      child: Container(
        height: 72 + MediaQuery.paddingOf(context).bottom,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: snsTheme.postDividerColor)),
        ),
        child: SafeArea(
          top: false,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _NavItem(
                  icon: Icons.home,
                  label: sq.common.home,
                  isActive: state.currentIndex == 0,
                  color: snsTheme.brandColor,
                  inactiveColor: snsTheme.navInactiveColor,
                  onTap: () {
                    if (state.currentIndex == 0) {
                      notifier.scrollToTop();
                    } else {
                      notifier.updateTabIndex(0);
                    }
                  },
                ),
              ),
              Expanded(
                child: _NavItem(
                  icon: Icons.search,
                  label: sq.common.search,
                  isActive: state.currentIndex == 1,
                  color: snsTheme.brandColor,
                  inactiveColor: snsTheme.navInactiveColor,
                  onTap: () => notifier.updateTabIndex(1),
                ),
              ),
              Expanded(
                child: _NavItem(
                  icon: Icons.notifications_none,
                  label: sq.common.notifications,
                  isActive: false,
                  color: snsTheme.brandColor,
                  inactiveColor: snsTheme.navInactiveColor,
                ),
              ),
              Expanded(
                child: _NavItem(
                  icon: Icons.person_outline,
                  label: sq.common.profile,
                  isActive: false,
                  color: snsTheme.brandColor,
                  inactiveColor: snsTheme.navInactiveColor,
                  onLongPress: state.status == QuizStatus.playing
                      ? () => _showAccountSwitchSheet(context)
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAccountSwitchSheet(BuildContext context) {
    final sq = context.sq;
    final snsTheme = Theme.of(context).extension<SnsAppTheme>()!;
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => _AccountSwitchSheet(
        snsTheme: snsTheme,
        mainAccountName: sq.common.mainAccountName,
        mainAccountId: sq.common.mainAccountId,
        subAccountName: sq.common.subAccountName,
        subAccountId: sq.common.subAccountId,
        switchLabel: sq.common.switchAccountLabel,
        currentAccount: state.currentAccount,
        onSwitch: notifier.switchAccount,
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.color,
    required this.inactiveColor,
    this.onTap,
    this.onLongPress,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final Color color;
  final Color inactiveColor;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final iconColor = isActive ? color : inactiveColor;
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 2),
          SnsText(
            label,
            style: TextStyle(fontSize: 10, color: iconColor),
          ),
        ],
      ),
    );
  }
}

class _TimelineArea extends ConsumerStatefulWidget {
  const _TimelineArea({
    required this.quizType,
    required this.posts,
    required this.notifier,
    required this.state,
  });

  final SnsQuizType quizType;
  final List<SnsPost> posts;
  final SnsQuizNotifier notifier;
  final SnsQuizState state;

  @override
  ConsumerState<_TimelineArea> createState() => _TimelineAreaState();
}

class _TimelineAreaState extends ConsumerState<_TimelineArea> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset <= 0 && widget.state.scrollToTopRequested) {
      widget.notifier.onScrolledToTop();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      snsQuizNotifierProvider(
        widget.quizType,
      ).select((s) => s.scrollToTopRequested),
      (previous, next) {
        if (next && _scrollController.hasClients) {
          // 既にトップにいる場合は即座に完了マークする
          if (_scrollController.offset == 0) {
            widget.notifier.onScrolledToTop();
          } else {
            // スクロールアニメーションを実行（unawaited で Future を破棄）
            unawaited(
              _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutQuart,
              ),
            );
          }
        }
      },
    );

    final snsTheme = Theme.of(context).extension<SnsAppTheme>()!;

    return ListView.separated(
      controller: _scrollController,
      itemCount: widget.posts.length,
      separatorBuilder: (context, index) =>
          Divider(height: 1, color: snsTheme.postDividerColor),
      itemBuilder: (context, index) {
        final post = widget.posts[index];
        return _SnsPostItem(
          post: post,
          snsTheme: snsTheme,
          isPlaying: widget.state.status == QuizStatus.playing,
          onDoubleTap: widget.state.status == QuizStatus.playing
              ? () => widget.notifier.toggleLike(post.id)
              : null,
          onTap:
              widget.state.status == QuizStatus.playing && post.imageUrl != null
              ? () => widget.notifier.openFullScreenImage(post.imageUrl!)
              : null,
        );
      },
    );
  }
}

class _FullScreenImageView extends StatefulWidget {
  const _FullScreenImageView({
    required this.imageUrl,
    this.onClose,
  });

  final String imageUrl;
  final VoidCallback? onClose;

  @override
  State<_FullScreenImageView> createState() => _FullScreenImageViewState();
}

class _FullScreenImageViewState extends State<_FullScreenImageView> {
  double _dragOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        setState(() {
          _dragOffset += details.delta.dy;
        });
      },
      onVerticalDragEnd: (details) {
        if (_dragOffset.abs() > 200) {
          widget.onClose?.call();
        } else {
          setState(() {
            _dragOffset = 0.0;
          });
        }
      },
      child: Container(
        color: Colors.black.withValues(
          alpha: (1 - (_dragOffset.abs() / 600)).clamp(0.0, 1.0),
        ),
        child: Center(
          child: Transform.translate(
            offset: Offset(0, _dragOffset),
            child: Text(
              widget.imageUrl == 'cat' ? '🐱' : '🖼️',
              style: const TextStyle(
                fontSize: 120,
                decoration: TextDecoration.none,
                inherit: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SnsPostItem extends StatefulWidget {
  const _SnsPostItem({
    required this.post,
    required this.snsTheme,
    required this.isPlaying,
    this.onDoubleTap,
    this.onTap,
  });

  final SnsPost post;
  final SnsAppTheme snsTheme;
  final bool isPlaying;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onTap;

  @override
  State<_SnsPostItem> createState() => _SnsPostItemState();
}

class _SnsPostItemState extends State<_SnsPostItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _heartController;
  late final Animation<double> _heartOpacity;
  final GlobalKey<LikeButtonState> _likeButtonKey =
      GlobalKey<LikeButtonState>();

  @override
  void initState() {
    super.initState();
    _heartController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _heartOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _heartController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _heartController.dispose();
    super.dispose();
  }

  void _playHeartAnimation() {
    _heartController.forward(from: 0).then((_) => _heartController.reverse());
    // 画像ダブルタップ時に LikeButton のアニメーションもトリガーする
    if (!widget.post.isLiked) {
      _likeButtonKey.currentState?.onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    final avatarColor = Color(post.avatarColor);
    final snsTheme = widget.snsTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: avatarColor,
            child: SnsText(
              post.userName.isNotEmpty ? post.userName[0] : '?',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SnsText(
                        post.userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    SnsText(
                      post.userId,
                      style: TextStyle(
                        color: snsTheme.subTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                SnsText(
                  post.content,
                  style: const TextStyle(fontSize: 15, color: Colors.black87),
                ),
                if (post.imageUrl != null) ...[
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: widget.onTap,
                    onDoubleTap: widget.onDoubleTap != null
                        ? () {
                            _playHeartAnimation();
                          }
                        : null,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        _PostImage(
                          imageUrl: post.imageUrl!,
                          backgroundColor: snsTheme.imageBackgroundCat,
                        ),
                        FadeTransition(
                          opacity: _heartOpacity,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white.withValues(alpha: 0.9),
                            size: 80,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                Row(
                  children: [
                    _IconAction(
                      icon: Icons.chat_bubble_outline,
                      color: snsTheme.navInactiveColor,
                    ),
                    const SizedBox(width: 32),
                    _IconAction(
                      icon: Icons.repeat,
                      color: snsTheme.navInactiveColor,
                    ),
                    const SizedBox(width: 32),
                    LikeButton(
                      key: _likeButtonKey,
                      isLiked: post.isLiked,
                      size: 20,
                      circleColor: CircleColor(
                        start: snsTheme.heartColor,
                        end: snsTheme.heartColor,
                      ),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: snsTheme.heartColor,
                        dotSecondaryColor: snsTheme.brandColor,
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked
                              ? snsTheme.heartColor
                              : snsTheme.navInactiveColor,
                          size: 20,
                        );
                      },
                      onTap: (isLiked) async {
                        if (!isLiked && widget.isPlaying) {
                          widget.onDoubleTap?.call();
                          return true;
                        }
                        // 既にいいねされている場合は解除させない（クイズの仕様に合わせる）
                        return isLiked;
                      },
                    ),
                    const SizedBox(width: 32),
                    _IconAction(
                      icon: Icons.share_outlined,
                      color: snsTheme.navInactiveColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IconAction extends StatelessWidget {
  const _IconAction({
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {}, // Feed back even if no action
      radius: 20,
      child: Icon(icon, size: 20, color: color),
    );
  }
}

class _PostImage extends StatelessWidget {
  const _PostImage({required this.imageUrl, required this.backgroundColor});

  final String imageUrl;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final emoji = imageUrl == 'cat' ? '🐱' : '🖼️';
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Material(
        type: MaterialType.transparency,
        child: Text(
          emoji,
          style: const TextStyle(
            fontSize: 80,
            decoration: TextDecoration.none,
            inherit: false,
          ),
        ),
      ),
    );
  }
}

class _TrendItem extends StatelessWidget {
  const _TrendItem({
    required this.category,
    required this.title,
    required this.postCount,
    required this.snsTheme,
  });

  final String category;
  final String title;
  final String postCount;
  final SnsAppTheme snsTheme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {}, // Feedback
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SnsText(
                  category,
                  style: TextStyle(color: snsTheme.subTextColor, fontSize: 13),
                ),
                Icon(Icons.more_horiz, color: snsTheme.subTextColor, size: 16),
              ],
            ),
            const SizedBox(height: 2),
            SnsText(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 2),
            SnsText(
              postCount,
              style: TextStyle(color: snsTheme.subTextColor, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchView extends ConsumerStatefulWidget {
  const _SearchView({required this.quizType});

  final SnsQuizType quizType;

  @override
  ConsumerState<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<_SearchView> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(snsQuizNotifierProvider(widget.quizType).notifier);

    ref.listen(
      snsQuizNotifierProvider(widget.quizType).select((s) => s.currentIndex),
      (previous, next) {
        if (next == 1) {
          _focusNode.requestFocus();
        }
      },
    );

    final snsTheme = Theme.of(context).extension<SnsAppTheme>()!;
    final sq = context.sq;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: snsTheme.postDividerColor.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              focusNode: _focusNode,
              onChanged: notifier.updateSearchText,
              onSubmitted: (_) => notifier.performSearch(),
              decoration: InputDecoration(
                hintText: sq.common.search,
                hintStyle: TextStyle(color: snsTheme.subTextColor),
                prefixIcon: Icon(
                  Icons.search,
                  color: snsTheme.subTextColor,
                  size: 20,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
        Divider(height: 1, color: snsTheme.postDividerColor),
        Expanded(
          child: ListView(
            children: [
              _TrendItem(
                category: sq.common.trends.trendingInJapan,
                title: sq.common.trends.nantoNack,
                postCount: sq.common.trends.postsCount(count: '1,234'),
                snsTheme: snsTheme,
              ),
              _TrendItem(
                category: sq.common.trends.technologyTrending,
                title: sq.common.trends.flutter,
                postCount: sq.common.trends.postsCount(count: '5,678'),
                snsTheme: snsTheme,
              ),
              _TrendItem(
                category: sq.common.trends.gamingTrending,
                title: sq.common.trends.retroGames,
                postCount: sq.common.trends.postsCount(count: '9,012'),
                snsTheme: snsTheme,
              ),
              _TrendItem(
                category: sq.common.trends.trendingInJapan,
                title: sq.common.trends.uiUxQuiz,
                postCount: sq.common.trends.postsCount(count: '3,456'),
                snsTheme: snsTheme,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// TODO: この画面は現在未使用（currentIndex が 2 になるパスが存在しない）
/// 将来的に投稿機能の拡張が必要な場合に使用する予定
class _ComposeView extends ConsumerWidget {
  const _ComposeView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sq = context.sq;
    return Center(
      child: Text(sq.common.composePlaceholder),
    );
  }
}

class _AccountSwitchSheet extends StatelessWidget {
  const _AccountSwitchSheet({
    required this.snsTheme,
    required this.mainAccountName,
    required this.mainAccountId,
    required this.subAccountName,
    required this.subAccountId,
    required this.switchLabel,
    required this.currentAccount,
    required this.onSwitch,
  });

  final SnsAppTheme snsTheme;
  final String mainAccountName;
  final String mainAccountId;
  final String subAccountName;
  final String subAccountId;
  final String switchLabel;
  final String currentAccount;
  final Future<void> Function(String accountId) onSwitch;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: snsTheme.accountSwitchBackground,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 8),
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: snsTheme.postDividerColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: SnsText(
                switchLabel,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Divider(),
            _AccountItem(
              name: mainAccountName,
              accountId: mainAccountId,
              isActive: currentAccount == SnsQuizConfig.mainAccountId,
              snsTheme: snsTheme,
              onTap: () {
                Navigator.of(context).pop();
                onSwitch(SnsQuizConfig.mainAccountId);
              },
            ),
            _AccountItem(
              name: subAccountName,
              accountId: subAccountId,
              isActive: currentAccount == SnsQuizConfig.subAccountId,
              snsTheme: snsTheme,
              onTap: () {
                Navigator.of(context).pop();
                onSwitch(SnsQuizConfig.subAccountId);
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _AccountItem extends StatelessWidget {
  const _AccountItem({
    required this.name,
    required this.accountId,
    required this.isActive,
    required this.snsTheme,
    required this.onTap,
  });

  final String name;
  final String accountId;
  final bool isActive;
  final SnsAppTheme snsTheme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: snsTheme.brandColor,
        child: SnsText(
          name.isNotEmpty ? name[0] : '?',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: SnsText(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: SnsText(
        accountId,
        style: TextStyle(color: snsTheme.subTextColor),
      ),
      trailing: isActive
          ? Icon(Icons.check_circle, color: snsTheme.brandColor)
          : null,
      onTap: onTap,
    );
  }
}