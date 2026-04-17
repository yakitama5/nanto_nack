import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../i18n/strings.g.dart' as sns_i18n;
import '../domain/sns_quiz_config.dart';
import '../domain/entities/sns_post.dart';
import '../i18n/sns_translations_extension.dart';
import 'sns_quiz_notifier.dart';
import 'sns_quiz_state.dart';
import 'sns_quiz_type.dart';

/// SNSクイズ画面（全4クイズ共通）
class SnsQuizScreen extends ConsumerStatefulWidget {
  /// コンストラクタ
  const SnsQuizScreen({
    super.key,
    required this.quizType,
    this.onCompleted,
  });

  /// 表示するクイズの種類
  final SnsQuizType quizType;

  /// クイズ完了コールバック
  final VoidCallback? onCompleted;

  @override
  ConsumerState<SnsQuizScreen> createState() => _SnsQuizScreenState();
}

class _SnsQuizScreenState extends ConsumerState<SnsQuizScreen> {
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref
          .read(snsQuizNotifierProvider(widget.quizType).notifier)
          .startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(snsQuizNotifierProvider(widget.quizType));
    final notifier =
        ref.read(snsQuizNotifierProvider(widget.quizType).notifier);
    final timeLimitSeconds = SnsQuizConfig.timeLimitSecondsFor(widget.quizType);
    final missionText = _missionText(widget.quizType);
    final isDone = state.status == QuizStatus.correct ||
        state.status == QuizStatus.timeUp ||
        state.status == QuizStatus.giveUp;

    return QuizExitScope(
      quizStatus: state.status,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _SnsAppScaffold(
            quizType: widget.quizType,
            state: state,
            notifier: notifier,
            missionText: missionText,
            timeLimitSeconds: timeLimitSeconds,
          ),
          if (state.isFullScreenImageOpened && state.fullScreenImageUrl != null)
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
              onFinished: () => setState(() => _showCutIn = false),
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
          emoji: '📱',
          title: insight.statusBarTitle,
          desc: insight.statusBarDesc,
        ),
        QuizInsightItem(
          emoji: '🏠',
          title: insight.homeTabTitle,
          desc: insight.homeTabDesc,
        ),
        QuizInsightItem(
          emoji: '⚡',
          title: insight.efficientTitle,
          desc: insight.efficientDesc,
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
          emoji: '👤',
          title: insight.longPressTitle,
          desc: insight.longPressDesc,
        ),
        QuizInsightItem(
          emoji: '🔒',
          title: insight.subAccountTitle,
          desc: insight.subAccountDesc,
        ),
        QuizInsightItem(
          emoji: '🔄',
          title: insight.multiAccountTitle,
          desc: insight.multiAccountDesc,
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// _SnsAppScaffold
// ---------------------------------------------------------------------------

class _SnsAppScaffold extends StatelessWidget {
  const _SnsAppScaffold({
    required this.quizType,
    required this.state,
    required this.notifier,
    required this.missionText,
    required this.timeLimitSeconds,
  });

  final SnsQuizType quizType;
  final SnsQuizState state;
  final SnsQuizNotifier notifier;
  final String missionText;
  final int timeLimitSeconds;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    final snsTheme = Theme.of(context).extension<SnsAppTheme>()!;

    return Scaffold(
      backgroundColor: snsTheme.scaffoldBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        // ステータスバーエリアのタップでトップへスクロール（Quiz3）
        child: GestureDetector(
          onTap: state.status == QuizStatus.playing ? notifier.scrollToTop : null,
          child: AppBar(
            backgroundColor: snsTheme.navBarBackground,
            elevation: 0,
            title: UnreadableText(
              sq.common.appTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: snsTheme.brandColor,
              ),
            ),
            centerTitle: false,
          ),
        ),
      ),
      bottomNavigationBar: _SnsBottomNavBar(
        snsTheme: snsTheme,
        sq: sq,
        quizType: quizType,
        state: state,
        notifier: notifier,
      ),
      body: _TimelineArea(
        quizType: quizType,
        posts: state.posts,
        notifier: notifier,
        state: state,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _SnsBottomNavBar
// ---------------------------------------------------------------------------

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
    return Container(
      height: kBottomNavigationBarHeight + MediaQuery.paddingOf(context).bottom,
      decoration: BoxDecoration(
        color: snsTheme.navBarBackground,
        border: Border(
          top: BorderSide(color: snsTheme.postDividerColor),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // ホームタブ（再タップでトップへスクロール）
            _NavItem(
              icon: Icons.home,
              label: sq.common.home,
              isActive: true,
              color: snsTheme.brandColor,
              inactiveColor: snsTheme.navInactiveColor,
              onTap: state.status == QuizStatus.playing
                  ? notifier.scrollToTop
                  : null,
            ),
            _NavItem(
              icon: Icons.search,
              label: sq.common.search,
              isActive: false,
              color: snsTheme.brandColor,
              inactiveColor: snsTheme.navInactiveColor,
              onTap: null,
            ),
            _NavItem(
              icon: Icons.notifications_none,
              label: sq.common.notifications,
              isActive: false,
              color: snsTheme.brandColor,
              inactiveColor: snsTheme.navInactiveColor,
              onTap: null,
            ),
            // プロフィールタブ（長押しでアカウント切り替え）
            GestureDetector(
              onLongPress: state.status == QuizStatus.playing
                  ? () => _showAccountSwitchSheet(context)
                  : null,
              child: _NavItem(
                icon: Icons.person_outline,
                label: sq.common.profile,
                isActive: false,
                color: snsTheme.brandColor,
                inactiveColor: snsTheme.navInactiveColor,
                onTap: null,
              ),
            ),
          ],
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

// ---------------------------------------------------------------------------
// _NavItem
// ---------------------------------------------------------------------------

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.color,
    required this.inactiveColor,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final Color color;
  final Color inactiveColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final iconColor = isActive ? color : inactiveColor;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(height: 2),
            UnreadableText(
              label,
              style: TextStyle(fontSize: 10, color: iconColor),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _TimelineArea
// ---------------------------------------------------------------------------

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

    // Quiz3: 初期表示時にタイムラインの一番下へスクロール
    if (widget.quizType == SnsQuizType.quiz3) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(
            _scrollController.position.maxScrollExtent,
          );
        }
      });
    }

    // scrollToTopRequested フラグ監視はリスナーとして設定
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // scrollToTopRequested が true のときにスクロールが 0 に達したらクリア判定
    if (_scrollController.offset <= 0 &&
        widget.state.scrollToTopRequested) {
      widget.notifier.onScrolledToTop();
    }
  }

  @override
  Widget build(BuildContext context) {
    // scrollToTopRequested の変化を監視してアニメーションスクロールを実行
    ref.listen(
      snsQuizNotifierProvider(widget.quizType)
          .select((s) => s.scrollToTopRequested),
      (previous, next) {
        if (next && _scrollController.hasClients) {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      },
    );

    final snsTheme = Theme.of(context).extension<SnsAppTheme>()!;

    return ListView.separated(
      controller: _scrollController,
      itemCount: widget.posts.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: snsTheme.postDividerColor,
      ),
      itemBuilder: (context, index) {
        final post = widget.posts[index];
        return _SnsPostItem(
          post: post,
          snsTheme: snsTheme,
          isPlaying: widget.state.status == QuizStatus.playing,
          onDoubleTap: widget.state.status == QuizStatus.playing
              ? () => widget.notifier.toggleLike(post.id)
              : null,
          onTap: widget.state.status == QuizStatus.playing && post.imageUrl != null
              ? () => widget.notifier.openFullScreenImage(post.imageUrl!)
              : null,
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// _SnsPostItem
// ---------------------------------------------------------------------------

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
    _heartController.forward(from: 0).then((_) {
      _heartController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    final avatarColor = Color(post.avatarColor);
    final snsTheme = widget.snsTheme;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // プロフィールアイコン
          CircleAvatar(
            radius: 20,
            backgroundColor: avatarColor,
            child: UnreadableText(
              post.userName.isNotEmpty ? post.userName[0] : '?',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ユーザー名・ID
                Row(
                  children: [
                    Flexible(
                      child: UnreadableText(
                        post.userName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(width: 4),
                    UnreadableText(
                      post.userId,
                      style: TextStyle(
                        color: snsTheme.subTextColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                // 投稿本文
                UnreadableText(post.content),
                // 画像エリア
                if (post.imageUrl != null) ...[
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: widget.onTap,
                    onDoubleTap: widget.onDoubleTap != null
                        ? () {
                            widget.onDoubleTap!.call();
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
                        // ハートアニメーション
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
                const SizedBox(height: 8),
                // いいねボタン
                Icon(
                  post.isLiked ? Icons.favorite : Icons.favorite_border,
                  size: 18,
                  color: post.isLiked
                      ? snsTheme.heartColor
                      : snsTheme.navInactiveColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _PostImage
// ---------------------------------------------------------------------------

/// 投稿の画像エリア（画像識別子に応じてコンテンツを描画）
class _PostImage extends StatelessWidget {
  const _PostImage({
    required this.imageUrl,
    required this.backgroundColor,
  });

  final String imageUrl;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    // 'cat' 識別子の場合はオレンジ背景 + 猫絵文字
    final emoji = switch (imageUrl) {
      'cat' || _ => '🐱',
    };

    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        emoji,
        style: const TextStyle(fontSize: 80),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _FullScreenImageView
// ---------------------------------------------------------------------------

class _FullScreenImageView extends StatelessWidget {
  const _FullScreenImageView({
    required this.imageUrl,
    this.onClose,
  });

  final String imageUrl;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        // 下スワイプの勢いが一定以上なら閉じる
        if (details.velocity.pixelsPerSecond.dy > 300) {
          onClose?.call();
        }
      },
      child: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Text(
          // 'cat' 識別子の場合は猫絵文字で表示
          imageUrl == 'cat' ? '🐱' : '🖼️',
          style: const TextStyle(fontSize: 120),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _AccountSwitchSheet
// ---------------------------------------------------------------------------

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
            // ドラッグハンドル
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
              child: UnreadableText(
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

// ---------------------------------------------------------------------------
// _AccountItem
// ---------------------------------------------------------------------------

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
        child: UnreadableText(
          name.isNotEmpty ? name[0] : '?',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: UnreadableText(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: UnreadableText(accountId, style: TextStyle(color: snsTheme.subTextColor)),
      trailing: isActive
          ? Icon(Icons.check_circle, color: snsTheme.brandColor)
          : null,
      onTap: onTap,
    );
  }
}
