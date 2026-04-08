import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:system/system.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../application/dashboard_provider.dart';
import '../../application/stage_list_provider.dart';
import '../../application/tutorial/tutorial_notifier.dart';
import '../../application/weather_provider.dart';
import '../../domain/category.dart';
import '../../domain/daily_scene.dart';
import '../../domain/dashboard/dashboard_state.dart';
import '../../domain/dashboard/user_activity.dart';
import '../../domain/weather/time_of_day_period.dart';
import '../../domain/weather/weather_scene_key.dart';
import '../tutorial/nantom_speech_bubble.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _playButtonKey = GlobalKey();
  OverlayEntry? _tutorialOverlayEntry;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeShowTutorial());
  }

  @override
  void dispose() {
    _tutorialOverlayEntry?.remove();
    _tutorialOverlayEntry = null;
    super.dispose();
  }

  Future<void> _maybeShowTutorial() async {
    final tutState = await ref.read(tutorialNotifierProvider.future);
    if (!mounted) return;
    if (!tutState.isCompleted && tutState.screen == TutorialScreen.home) {
      // Step 1-2 は即座にオーバーレイ表示。Step 3 のコーチマーク表示前に
      // _playButtonKey が設定されているかを確認してから表示する。
      _showTutorial();
    }
  }

  void _showTutorial() {
    // Step 1-2: フォーカスなし全画面暗転オーバーレイ
    _tutorialOverlayEntry = OverlayEntry(
      builder: (_) => _HomeTutorialOverlay(
        onComplete: () {
          _tutorialOverlayEntry?.remove();
          _tutorialOverlayEntry = null;
          // Step 3: プレイボタンにフォーカスするコーチマークへ移行
          // _playButtonKey が設定されていること・画面が最前面にあることを確認してから表示
          if (!mounted) return;
          if (ModalRoute.of(context)?.isCurrent != true) return;
          if (_playButtonKey.currentContext == null) {
            // dashboardProvider の読み込み完了後にキーが設定されるため、次フレームで再確認
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted && ModalRoute.of(context)?.isCurrent == true) {
                _showPlayButtonCoachMark();
              }
            });
          } else {
            _showPlayButtonCoachMark();
          }
        },
        onSkip: () {
          _tutorialOverlayEntry?.remove();
          _tutorialOverlayEntry = null;
          Future.microtask(
            () => ref.read(tutorialNotifierProvider.notifier).complete(),
          );
        },
      ),
    );
    Overlay.of(context).insert(_tutorialOverlayEntry!);
  }

  // Step 3: プレイボタンへのフォーカスコーチマーク
  void _showPlayButtonCoachMark() {
    final t = Translations.of(context);

    void navigateToPlay() {
      ref.read(analyticsServiceProvider).logPlayButtonTapped();
      ref
          .read(tutorialNotifierProvider.notifier)
          .advanceTo(TutorialScreen.categoryList);
      context.push('/play');
    }

    TutorialCoachMark(
      targets: [
        TargetFocus(
          identify: 'home_play_button',
          keyTarget: _playButtonKey,
          shape: ShapeLightFocus.RRect,
          radius: 18,
          paddingFocus: 8,
          enableOverlayTab: true,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              builder: (ctx, ctl) => NantomSpeechBubble(
                expression: NantomExpression.smile,
                text: t.tutorial.step3,
              ),
            ),
          ],
        ),
      ],
      colorShadow: Colors.black,
      opacityShadow: 0.85,
      textSkip: t.tutorial.skip,
      skipWidget: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
        ),
        child: Text(
          t.tutorial.skip,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onClickTarget: (_) => navigateToPlay(),
      onClickOverlay: (_) => navigateToPlay(),
      onFinish: () {},
      onSkip: () {
        Future.microtask(
          () => ref.read(tutorialNotifierProvider.notifier).complete(),
        );
        return true;
      },
    ).show(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final dashboardAsync = ref.watch(dashboardProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: MaxWidthBox(
        maxWidth: 800,
        child: RefreshIndicator(
          displacement: 80,
          onRefresh: () async =>
              ref.read(dashboardProvider.notifier).refresh(),
          child: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
                  // ===== 今日の1枚ヒーローカード =====
                  const _TodayHeroCard(),
                  // ===== ダッシュボードコンテンツ =====
                  dashboardAsync.when(
                    loading: () => const Padding(
                      padding: EdgeInsets.fromLTRB(20, 24, 20, 0),
                      child: SkeletonDashboard(),
                    ),
                    error: (_, __) => const SizedBox.shrink(),
                    data: (dashboard) => _DashboardContent(
                      dashboard: dashboard,
                      playButtonKey: _playButtonKey,
                    ),
                  ),
                  // ===== ボトムパディング（SafeArea + 余白）=====
                  SizedBox(height: MediaQuery.paddingOf(context).bottom + 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────
// 今日の1枚ヒーローカード
// ─────────────────────────────────────────

/// 画面上部に表示する「今日の1枚」カード。
///
/// OpenWeather API から取得した天気と端末の時間帯に応じて
/// [WeatherSceneKey] を解決し、対応するアセット画像を表示する。
/// 取得失敗時は [DailySceneTheme] のグラデーションにフォールバックする。
class _TodayHeroCard extends ConsumerWidget {
  const _TodayHeroCard();


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final weatherAsync = ref.watch(weatherProvider);
    final scene = DailySceneTheme.resolveFromNow();
    final sceneTheme = DailySceneTheme.of(scene);
    final topPadding = MediaQuery.paddingOf(context).top;
    final now = clock.now();

    final weekdayStr = switch (now.weekday) {
      DateTime.monday => t.home.weekday.mon,
      DateTime.tuesday => t.home.weekday.tue,
      DateTime.wednesday => t.home.weekday.wed,
      DateTime.thursday => t.home.weekday.thu,
      DateTime.friday => t.home.weekday.fri,
      DateTime.saturday => t.home.weekday.sat,
      _ => t.home.weekday.sun,
    };
    final dateLabel = t.home.dateFormat
        .replaceAll('{month}', now.month.toString())
        .replaceAll('{day}', now.day.toString())
        .replaceAll('{weekday}', weekdayStr);

    // 天気×時間帯のシーンキーを解決（取得失敗時は null）
    final weatherCondition = weatherAsync.valueOrNull?.condition;
    final sceneKey = weatherCondition != null
        ? WeatherSceneKey(
            condition: weatherCondition,
            period: TimeOfDayPeriod.fromNow(),
          )
        : null;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(32),
        bottomRight: Radius.circular(32),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            // ── グラデーション背景（フォールバック兼ベース） ──
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: sceneTheme.gradientColors,
                  ),
                ),
              ),
            ),
            // ── 天気×時間帯の画像（取得できた場合のみ） ──
            if (sceneKey != null)
              Positioned.fill(
                child: Image.asset(
                  sceneKey.assetPath,
                  fit: BoxFit.cover,
                  // 画像が存在しない場合（プレースホルダー中）はグラデーションを表示
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox.shrink(),
                ),
              ),
            // ── 読みやすさのための暗めのグラデーションオーバーレイ ──
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.30),
                      Colors.black.withValues(alpha: 0.60),
                    ],
                  ),
                ),
              ),
            ),
            // ── コンテンツ ──
            Padding(
              padding: EdgeInsets.fromLTRB(24, topPadding + 20, 24, 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dateLabel,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: Colors.white
                                        .withValues(alpha: 0.75),
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              _sceneGreeting(scene, t),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      // ── 右上アイコンボタン群 ──
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _HeaderIconButton(
                            icon: Icons.workspace_premium_rounded,
                            color: Colors.white,
                            onPressed: () {
                              ref
                                  .read(analyticsServiceProvider)
                                  .logPremiumButtonTapped();
                              // TODO: プレミアムプラン案内モーダルを表示
                            },
                          ),
                          const SizedBox(width: 4),
                          _HeaderIconButton(
                            icon: Icons.settings_rounded,
                            color: Colors.white,
                            onPressed: () => context.push('/settings'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'NantoNack',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: -1,
                        ),
                  ),
                  const SizedBox(height: 4),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _sceneGreeting(DailyScene scene, Translations t) {
  return switch (scene) {
    DailyScene.sunriseMorning => t.scene.greeting.sunriseMorning,
    DailyScene.sunnyDay => t.scene.greeting.sunnyDay,
    DailyScene.cloudyDay => t.scene.greeting.cloudyDay,
    DailyScene.rainyDay => t.scene.greeting.rainyDay,
    DailyScene.sunsetEvening => t.scene.greeting.sunsetEvening,
    DailyScene.nightSky => t.scene.greeting.nightSky,
  };
}

String _categoryLabel(String categoryId, Translations t) {
  return switch (categoryId) {
    'shopping' => t.play.categoryLabel.shopping,
    'chat' => t.play.categoryLabel.chat,
    'streaming' => t.play.categoryLabel.streaming,
    'map' => t.play.categoryLabel.map,
    'alarm' => t.play.categoryLabel.alarm,
    'payment' => t.play.categoryLabel.payment,
    _ => categoryId,
  };
}

/// ヘッダー上に表示する半透明背景付きアイコンボタン。
///
/// グラデーション背景に対して視認性を高めるため、
/// アイコンカラーと同色の半透明円形背景を持つ。
class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: 22, color: color),
      style: IconButton.styleFrom(
        backgroundColor: color.withValues(alpha: 0.15),
        minimumSize: const Size(40, 40),
        padding: EdgeInsets.zero,
        shape: const CircleBorder(),
      ),
      onPressed: onPressed,
    );
  }
}

// ─────────────────────────────────────────
// ダッシュボードコンテンツ
// ─────────────────────────────────────────

class _DashboardContent extends StatelessWidget {
  const _DashboardContent({
    required this.dashboard,
    this.playButtonKey,
  });

  final DashboardState dashboard;
  final Key? playButtonKey;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 今日のUI/UXヒント
          _TipCard(
            label: t.dashboard.todayTip,
            title: dashboard.dailyTip.id == 'default'
                ? t.tip.defaultTitle
                : dashboard.dailyTip.title,
            content: dashboard.dailyTip.id == 'default'
                ? t.tip.defaultContent
                : dashboard.dailyTip.content,
          ),
          const SizedBox(height: 16),
          // プレイヒーローカード（残りプレイ数 + プレイボタン）
          _PlayHeroCard(
            remainingPlayCount: dashboard.remainingPlayCount,
            playButtonKey: playButtonKey,
          ),
          const SizedBox(height: 16),
          // 連続プレイ + 60日ヒートマップ統合カード
          _AccumulationCard(
            activityHistory: dashboard.activityHistory,
            streakLabel: t.dashboard.streak,
            streakValue: t.dashboard.streakDays.replaceAll(
              '{days}',
              dashboard.currentStreak.toString(),
            ),
          ),
          const SizedBox(height: 16),
          // カテゴリーカルーセル
          const _CategoryCarousel(),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// 今日のUI/UXヒントカード
// ─────────────────────────────────────────

class _TipCard extends StatelessWidget {
  const _TipCard({
    required this.label,
    required this.title,
    required this.content,
  });

  final String label;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primaryContainer,
            colorScheme.secondaryContainer,
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _LabelPill(
            icon: Icons.lightbulb_rounded,
            label: label,
            iconColor: colorScheme.primary,
            backgroundColor: colorScheme.primary.withValues(alpha: 0.12),
            textColor: colorScheme.primary,
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onPrimaryContainer,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onPrimaryContainer.withValues(alpha: 0.75),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// プレイヒーローカード
// ─────────────────────────────────────────

/// 残りプレイ数の円形インジケーターと「プレイする」ボタンを持つカード。
class _PlayHeroCard extends ConsumerWidget {
  const _PlayHeroCard({
    required this.remainingPlayCount,
    this.playButtonKey,
  });

  final int? remainingPlayCount; // null = 無制限（プレミアム）
  final Key? playButtonKey;

  static const _maxPlays = 5;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isUnlimited = remainingPlayCount == null;
    final remaining = remainingPlayCount ?? _maxPlays;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary,
            colorScheme.tertiary,
          ],
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── 左側：円形インジケーター + 残りプレイ数 ──
          Column(
            children: [
              SizedBox(
                width: 76,
                height: 76,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: isUnlimited ? 1.0 : remaining / _maxPlays,
                      strokeWidth: 5,
                      backgroundColor: Colors.white.withValues(alpha: 0.25),
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.sports_esports_rounded,
                      size: 32,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                isUnlimited
                    ? '∞ / ∞'
                    : '$remaining / $_maxPlays',
                style: textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                t.home.remainingPlaysLabel,
                style: textTheme.labelSmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
          const Spacer(),
          // ── 右側：プレイボタン ──
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FilledButton.icon(
                key: playButtonKey,
                onPressed: () {
                  ref.read(analyticsServiceProvider).logPlayButtonTapped();
                  context.push('/play');
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: colorScheme.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 0,
                ),
                icon: const Icon(Icons.play_arrow_rounded, size: 22),
                label: Text(
                  t.home.playButton,
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                t.home.nextStageHint,
                style: textTheme.labelSmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// 連続プレイ + 60日ヒートマップ統合カード
// ─────────────────────────────────────────

/// ストリーク情報と60日間のヒートマップを1枚のカードに統合して表示する。
class _AccumulationCard extends StatelessWidget {
  const _AccumulationCard({
    required this.activityHistory,
    required this.streakLabel,
    required this.streakValue,
  });

  final List<UserActivity> activityHistory;
  final String streakLabel;
  final String streakValue;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<NantoNackThemeExtension>()!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final hasActivity = activityHistory.any((a) => a.hasActivity);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ext.streakContainerColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: ext.streakColor.withValues(alpha: 0.2),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 左：ストリーク情報 ──
          SizedBox(
            width: 116,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.local_fire_department_rounded,
                      color: ext.streakColor,
                      size: 24,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        streakLabel,
                        style: textTheme.labelSmall?.copyWith(
                          color: ext.streakColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  streakValue,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ext.streakColor,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  Translations.of(context).home.past60Days,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // ── 右：コンパクトヒートマップ ──
          Expanded(
            child: hasActivity
                ? NantoHeatmap(
                    activities: activityHistory
                        .map((a) => (date: a.date, clearCount: a.clearCount))
                        .toList(),
                    cellSize: 14,
                    cellSpacing: 2,
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        Translations.of(context).home.noActivityHistory,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.45),
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// カテゴリーカルーセル
// ─────────────────────────────────────────

class _CategoryCarousel extends ConsumerWidget {
  const _CategoryCarousel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final ext = Theme.of(context).extension<NantoNackThemeExtension>()!;
    final stagesAsync = ref.watch(stageListProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.grid_view_rounded,
                size: 16,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              t.home.categoriesLabel,
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 118,
          child: stagesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => const SizedBox.shrink(),
            data: (stages) => ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: kAllCategories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final cat = kAllCategories[index];
                final categoryStages =
                    stages.where((s) => s.stage.category == cat.id).toList();
                final cleared = categoryStages
                    .where((s) => s.status == StageStatus.cleared)
                    .length;
                final total = categoryStages.length;
                final isLocked = categoryStages.isNotEmpty &&
                    categoryStages.first.status == StageStatus.locked;
                // カテゴリ固有色を取得し、カードの配色に反映する
                final categoryColor = switch (cat.id) {
                  'shopping' => ext.shoppingCategoryColor,
                  'chat' => ext.chatCategoryColor,
                  'streaming' => ext.streamingCategoryColor,
                  'map' => ext.mapCategoryColor,
                  'alarm' => ext.alarmCategoryColor,
                  'payment' => ext.paymentCategoryColor,
                  _ => colorScheme.primary,
                };
                return _CategoryCard(
                  categoryId: cat.id,
                  icon: cat.icon,
                  label: _categoryLabel(cat.id, t),
                  cleared: cleared,
                  total: total,
                  isLocked: isLocked,
                  categoryColor: categoryColor,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.categoryId,
    required this.icon,
    required this.label,
    required this.cleared,
    required this.total,
    required this.categoryColor,
    this.isLocked = false,
  });

  final String categoryId;
  final IconData icon;
  final String label;
  final int cleared;
  final int total;
  final bool isLocked;

  /// カテゴリ固有色。未ロック時の背景・ボーダー・アイコン・テキスト・プログレスの色に使用する。
  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final progress = total > 0 ? cleared / total : 0.0;

    return Container(
      width: 132,
      decoration: BoxDecoration(
        color: isLocked
            ? colorScheme.surfaceContainerLow
            : categoryColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isLocked
              ? colorScheme.outlineVariant.withValues(alpha: 0.4)
              : categoryColor.withValues(alpha: 0.2),
        ),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: isLocked ? colorScheme.onSurface.withValues(alpha: 0.3) : categoryColor),
              const Spacer(),
              if (isLocked)
                Icon(
                  Icons.lock_rounded,
                  size: 14,
                  color: colorScheme.onSurface.withValues(alpha: 0.3),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: isLocked
                  ? colorScheme.onSurface.withValues(alpha: 0.4)
                  : categoryColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          LinearProgressIndicator(
            value: isLocked ? 0 : progress,
            backgroundColor: colorScheme.surfaceContainerHighest,
            color: isLocked
                ? colorScheme.outline.withValues(alpha: 0.3)
                : categoryColor,
            borderRadius: BorderRadius.circular(4),
            minHeight: 4,
          ),
          const SizedBox(height: 5),
          Text(
            isLocked
                ? t.home.categoryLockedLabel
                : t.home.categoryClearCount
                    .replaceAll('{cleared}', cleared.toString())
                    .replaceAll('{total}', total.toString()),
            style: textTheme.labelSmall?.copyWith(
              color: isLocked
                  ? colorScheme.onSurface.withValues(alpha: 0.3)
                  : categoryColor.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// 共通ウィジェット
// ─────────────────────────────────────────

class _LabelPill extends StatelessWidget {
  const _LabelPill({
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.backgroundColor,
    required this.textColor,
  });

  final IconData icon;
  final String label;
  final Color iconColor;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: iconColor),
          const SizedBox(width: 5),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// ホーム画面チュートリアルオーバーレイ（Step 1〜2）
// ─────────────────────────────────────────

/// フォーカスなし・全画面暗転でナントムを中央表示するオーバーレイ（Step 1〜2）。
///
/// タップで次ステップへ進み、Step 2 完了後に [onComplete] を呼び出す。
/// スキップボタンは右下に配置。
class _HomeTutorialOverlay extends StatefulWidget {
  const _HomeTutorialOverlay({
    required this.onComplete,
    required this.onSkip,
  });

  final VoidCallback onComplete;
  final VoidCallback onSkip;

  @override
  State<_HomeTutorialOverlay> createState() => _HomeTutorialOverlayState();
}

class _HomeTutorialOverlayState extends State<_HomeTutorialOverlay> {
  int _step = 0;

  void _onTap() {
    final steps = _buildSteps(Translations.of(context));
    if (_step < steps.length - 1) {
      setState(() => _step++);
    } else {
      widget.onComplete();
    }
  }

  List<({NantomExpression expression, String text})> _buildSteps(
    Translations t,
  ) => [
    (expression: NantomExpression.smile, text: t.tutorial.step1),
    (expression: NantomExpression.normal, text: t.tutorial.step2),
  ];

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final bottomPadding = MediaQuery.paddingOf(context).bottom;
    final steps = _buildSteps(t);
    final currentStep = steps[_step];

    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _onTap,
        child: Stack(
          children: [
            // ── 全画面暗転（フォーカス穴なし）
            const ColoredBox(
              color: Color(0xB3000000), // 70% black
              child: SizedBox.expand(),
            ),
            // ── ナントム（画面中央）
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: NantomSpeechBubble(
                  expression: currentStep.expression,
                  text: currentStep.text,
                ),
              ),
            ),
            // ── スキップボタン（右下）
            Positioned(
              bottom: bottomPadding + 24,
              right: 20,
              child: GestureDetector(
                onTap: widget.onSkip,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Text(
                    t.tutorial.skip,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
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
