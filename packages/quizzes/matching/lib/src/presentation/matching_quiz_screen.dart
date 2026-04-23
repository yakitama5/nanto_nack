import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matching/src/domain/entities/match_profile.dart';
import 'package:matching/src/domain/matching_quiz_config.dart';
import 'package:matching/src/i18n/matching_translations_extension.dart';
import 'package:matching/src/presentation/matching_quiz_notifier.dart';
import 'package:matching/src/presentation/matching_quiz_state.dart';
import 'package:matching/src/presentation/matching_quiz_type.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

/// マッチングアプリ謎解きの共通画面。
///
/// [type] によって Quiz1〜4 のいずれかとして動作する。
/// UI の骨格・ライフサイクル（cutIn / resultOverlay / giveUp）は共通。
/// クイズ固有のクリア条件は [type] で分岐する。
class MatchingQuizScreen extends ConsumerStatefulWidget {
  const MatchingQuizScreen({
    super.key,
    required this.type,
    this.onCompleted,
  });

  final MatchingQuizType type;
  final VoidCallback? onCompleted;

  @override
  ConsumerState<MatchingQuizScreen> createState() => _MatchingQuizScreenState();
}

class _MatchingQuizScreenState extends ConsumerState<MatchingQuizScreen> {
  bool _showCutIn = true;
  bool _isConfirmDialogOpen = false;
  bool _isExiting = false;

  late final CardSwiperController _cardSwiperController;

  MatchingQuizType get _type => widget.type;

  @override
  void initState() {
    super.initState();
    _cardSwiperController = CardSwiperController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(matchingQuizProvider(_type).notifier).startQuiz();
    });
  }

  @override
  void dispose() {
    _cardSwiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(matchingQuizProvider(_type));
    final missionText = _missionText();
    final notifier = ref.read(matchingQuizProvider(_type).notifier);

    return PopScope(
      canPop: (state.status != QuizStatus.playing || _isExiting),
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        if (_isConfirmDialogOpen) return;
        setState(() => _isConfirmDialogOpen = true);
        try {
          final confirmed = await QuizExitScope.showConfirmDialog(context);
          if (confirmed == true && mounted) {
            setState(() => _isExiting = true);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) Navigator.of(context).pop();
            });
          }
        } finally {
          if (mounted) setState(() => _isConfirmDialogOpen = false);
        }
      },
      child: Stack(
        children: [
          Scaffold(
            backgroundColor:
                Theme.of(context).extension<MatchingAppTheme>()!.scaffoldBackground,
            appBar: _MatchingAppBar(type: _type),
            body: _buildBody(state: state, notifier: notifier),
          ),
          if (state.status == QuizStatus.playing)
            FloatingMissionBubble(
              missionText: missionText,
              remainingSeconds: state.remainingSeconds,
              timeLimitSeconds: MatchingQuizConfig.timeLimitSeconds,
              hintUsed: state.hintUsed,
              onHintTap: null,
              onGiveUp: () => notifier.giveUp(),
            ),
          if (_showCutIn)
            MissionCutIn(
              missionText: missionText,
              timeLimitSeconds: MatchingQuizConfig.timeLimitSeconds,
              onFinished: () => setState(() => _showCutIn = false),
            ),
          if (state.status == QuizStatus.correct ||
              state.status == QuizStatus.timeUp ||
              state.status == QuizStatus.giveUp)
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
                isLimitReached: ref.isPlayLimitReached,
                insight: _buildInsight(),
              ),
            ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // Body
  // ─────────────────────────────────────────────

  Widget _buildBody({
    required MatchingQuizState state,
    required MatchingQuizNotifier notifier,
  }) {
    final profiles = state.matchingApp.profiles.toList();
    final matchingTheme = Theme.of(context).extension<MatchingAppTheme>()!;

    if (profiles.isEmpty) {
      return Center(
        child: Text(
          context.sq.common.noMoreProfiles,
          style: TextStyle(color: matchingTheme.appBarForeground),
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: CardSwiper(
            controller: _cardSwiperController,
            cardsCount: profiles.length,
            // autoPlay は false（ユーザー操作のみ）
            isLoop: false,
            cardBuilder: (context, index, horizontalOffsetPercentage, verticalOffsetPercentage) {
              final profile = profiles[index];
              // index == 0 がトップカード（一番前）
              final isTopCard = index == 0;
              return _ProfileCardWidget(
                profile: profile,
                currentImageIndex: isTopCard
                    ? state.matchingApp.currentImageIndex
                    : 0,
                onNextImage: () => notifier.nextImage(),
                onPreviousImage: () => notifier.previousImage(),
              );
            },
            onSwipe: (previousIndex, currentIndex, direction) {
              notifier.resetImageIndex();
              switch (direction) {
                case CardSwiperDirection.right:
                  notifier.swipeRight(profiles[previousIndex].id);
                case CardSwiperDirection.left:
                  notifier.swipeLeft(profiles[previousIndex].id);
                case CardSwiperDirection.top:
                  notifier.swipeUp(profiles[previousIndex].id);
                default:
                  break;
              }
              return true;
            },
            onEnd: () {
              // カードがなくなった場合は何もしない（タイムアップまで待つ）
            },
          ),
        ),
        _BottomActionButtons(
          controller: _cardSwiperController,
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // Mission text
  // ─────────────────────────────────────────────

  String _missionText() {
    return switch (_type) {
      MatchingQuizType.swipeRight => context.s.quiz1.missionText,
      MatchingQuizType.swipeLeft => context.s.quiz2.missionText,
      MatchingQuizType.viewPhoto => context.s.quiz3.missionText,
      MatchingQuizType.superLike => context.s.quiz4.missionText,
    };
  }

  // ─────────────────────────────────────────────
  // Insight
  // ─────────────────────────────────────────────

  Widget _buildInsight() {
    return Builder(
      builder: (context) {
        return switch (_type) {
          MatchingQuizType.swipeRight => _buildInsightQuiz1(context),
          MatchingQuizType.swipeLeft => _buildInsightQuiz2(context),
          MatchingQuizType.viewPhoto => _buildInsightQuiz3(context),
          MatchingQuizType.superLike => _buildInsightQuiz4(context),
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
          emoji: '👉',
          title: insight.swipeTitle,
          desc: insight.swipeDesc,
        ),
        QuizInsightItem(
          emoji: '❤️',
          title: insight.heartTitle,
          desc: insight.heartDesc,
        ),
        QuizInsightItem(
          emoji: '✨',
          title: insight.feedbackTitle,
          desc: insight.feedbackDesc,
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
          emoji: '👈',
          title: insight.swipeTitle,
          desc: insight.swipeDesc,
        ),
        QuizInsightItem(
          emoji: '✖️',
          title: insight.xTitle,
          desc: insight.xDesc,
        ),
        QuizInsightItem(
          emoji: '🔄',
          title: insight.gestureTitle,
          desc: insight.gestureDesc,
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
          emoji: '👆',
          title: insight.tapTitle,
          desc: insight.tapDesc,
        ),
        QuizInsightItem(
          emoji: '📊',
          title: insight.indicatorTitle,
          desc: insight.indicatorDesc,
        ),
        QuizInsightItem(
          emoji: '📸',
          title: insight.multiPhotoTitle,
          desc: insight.multiPhotoDesc,
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
          emoji: '⭐',
          title: insight.superTitle,
          desc: insight.superDesc,
        ),
        QuizInsightItem(
          emoji: '🌟',
          title: insight.starTitle,
          desc: insight.starDesc,
        ),
        QuizInsightItem(
          emoji: '💎',
          title: insight.specialTitle,
          desc: insight.specialDesc,
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// AppBar（マッチングアプリ風）
// ─────────────────────────────────────────────

class _MatchingAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _MatchingAppBar({required this.type});

  final MatchingQuizType type;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchingTheme = Theme.of(context).extension<MatchingAppTheme>()!;
    final sq = context.sq;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: matchingTheme.appBarBackground,
      foregroundColor: matchingTheme.appBarForeground,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            color: matchingTheme.brandPink,
            size: 24,
          ),
          const SizedBox(width: 8),
          Text(
            sq.common.appTitle,
            style: TextStyle(
              color: matchingTheme.brandPink,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// プロフィールカード
// ─────────────────────────────────────────────

class _ProfileCardWidget extends StatelessWidget {
  const _ProfileCardWidget({
    required this.profile,
    required this.currentImageIndex,
    required this.onNextImage,
    required this.onPreviousImage,
  });

  final MatchProfile profile;
  final int currentImageIndex;
  final VoidCallback onNextImage;
  final VoidCallback onPreviousImage;

  @override
  Widget build(BuildContext context) {
    final matchingTheme = Theme.of(context).extension<MatchingAppTheme>()!;
    final imageUrls = profile.imageUrls;
    final safeIndex = currentImageIndex.clamp(0, imageUrls.length - 1);
    final imageUrl = imageUrls[safeIndex];

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // 背景画像
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: matchingTheme.cardBackground,
              child: Icon(
                Icons.person,
                size: 80,
                color: matchingTheme.appBarForeground.withValues(alpha: 0.3),
              ),
            ),
          ),
          // 写真インジケーター（上部）
          if (imageUrls.length > 1)
            Positioned(
              top: 8,
              left: 8,
              right: 8,
              child: Row(
                children: List.generate(imageUrls.length, (index) {
                  final isActive = index == safeIndex;
                  return Expanded(
                    child: Container(
                      height: 3,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: isActive
                            ? matchingTheme.indicatorActive
                            : matchingTheme.indicatorInactive,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
            ),
          // 下部グラデーション + テキスト
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black54],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    // カスタム言語でプロフィール名を表示
                    '${CustomLanguageEncoder.encode(profile.name)}, ${profile.age}',
                    style: TextStyle(
                      color: matchingTheme.profileTextColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    // カスタム言語でバイオを表示
                    CustomLanguageEncoder.encode(profile.bio),
                    style: TextStyle(
                      color: matchingTheme.profileTextColor,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          // タップエリア（右半分: 次の写真 / 左半分: 前の写真）
          Positioned.fill(
            child: Row(
              children: [
                // 左半分: 前の写真
                Expanded(
                  child: GestureDetector(
                    onTap: onPreviousImage,
                    behavior: HitTestBehavior.translucent,
                  ),
                ),
                // 右半分: 次の写真
                Expanded(
                  child: GestureDetector(
                    onTap: onNextImage,
                    behavior: HitTestBehavior.translucent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// ボトムアクションボタン群
// ─────────────────────────────────────────────

class _BottomActionButtons extends StatelessWidget {
  const _BottomActionButtons({required this.controller});

  final CardSwiperController controller;

  @override
  Widget build(BuildContext context) {
    final matchingTheme = Theme.of(context).extension<MatchingAppTheme>()!;
    final sq = context.sq;

    return Container(
      color: matchingTheme.bottomAreaBackground,
      padding: EdgeInsets.only(
        left: 32,
        right: 32,
        top: 12,
        bottom: MediaQuery.paddingOf(context).bottom + 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // ×ボタン（スキップ）
          _ActionButton(
            icon: Icons.close,
            color: matchingTheme.nopeColor,
            label: sq.common.nope,
            onTap: () => controller.swipe(CardSwiperDirection.left),
          ),
          // ★ボタン（超いいね）
          _ActionButton(
            icon: Icons.star,
            color: matchingTheme.superLikeColor,
            label: sq.common.superLike,
            onTap: () => controller.swipe(CardSwiperDirection.top),
            size: 52,
          ),
          // ❤ボタン（いいね）
          _ActionButton(
            icon: Icons.favorite,
            color: matchingTheme.likeColor,
            label: sq.common.like,
            onTap: () => controller.swipe(CardSwiperDirection.right),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.color,
    required this.label,
    required this.onTap,
    this.size = 44,
  });

  final IconData icon;
  final Color color;
  final String label;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: color,
              size: size * 0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
