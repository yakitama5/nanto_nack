import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../application/dashboard_provider.dart';
import '../../application/weather_provider.dart';
import '../../domain/daily_scene.dart';
import '../../domain/dashboard/dashboard_state.dart';
import '../../domain/dashboard/user_activity.dart';
import '../../domain/weather/time_of_day_period.dart';
import '../../domain/weather/weather_scene_key.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    ),
                  ),
                  // ===== ボトムパディング =====
                  const SizedBox(height: 40),
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
    final weatherAsync = ref.watch(weatherProvider);
    final scene = DailySceneTheme.resolveFromNow();
    final sceneTheme = DailySceneTheme.of(scene);
    final topPadding = MediaQuery.paddingOf(context).top;
    final now = clock.now();

    const weekdays = ['月', '火', '水', '木', '金', '土', '日'];
    final weekday = weekdays[now.weekday - 1];
    final dateLabel = '${now.month}月${now.day}日（$weekday）';

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
                      Colors.black.withValues(alpha: 0.15),
                      Colors.black.withValues(alpha: 0.45),
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
                                    color: sceneTheme.onSceneColor
                                        .withValues(alpha: 0.7),
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              sceneTheme.greeting,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: sceneTheme.onSceneColor,
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
                            color: sceneTheme.onSceneColor,
                            onPressed: () {
                              // TODO: プレミアムプラン案内モーダルを表示
                            },
                          ),
                          const SizedBox(width: 4),
                          _HeaderIconButton(
                            icon: Icons.settings_rounded,
                            color: sceneTheme.onSceneColor,
                            onPressed: () {
                              // TODO: 設定画面を開く
                            },
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
                          color: sceneTheme.onSceneColor,
                          letterSpacing: -1,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'UI/UX 直感クイズ',
                    style:
                        Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: sceneTheme.onSceneColor
                                  .withValues(alpha: 0.65),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                            ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
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
  const _DashboardContent({required this.dashboard});

  final DashboardState dashboard;

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
            title: dashboard.dailyTip.title,
            content: dashboard.dailyTip.content,
          ),
          const SizedBox(height: 16),
          // プレイヒーローカード（残りプレイ数 + プレイボタン）
          _PlayHeroCard(
            remainingPlayCount: dashboard.remainingPlayCount,
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
  const _PlayHeroCard({required this.remainingPlayCount});

  final int? remainingPlayCount; // null = 無制限（プレミアム）

  static const _maxPlays = 5;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                '本日の残りプレイ回数',
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
                onPressed: () => context.push('/play'),
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
                  'プレイする',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '次のステージへ進む',
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
                  '過去60日間の\nクリア記録',
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
                        'まだプレイ履歴が\nありません',
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

class _CategoryData {
  const _CategoryData({
    required this.emoji,
    required this.label,
    required this.cleared,
    required this.total,
    this.isLocked = false,
  });

  final String emoji;
  final String label;
  final int cleared;
  final int total;
  final bool isLocked;
}

// サンプルカテゴリーデータ（将来的にDashboardStateから取得）
const _sampleCategories = [
  _CategoryData(emoji: '🛍️', label: 'ショッピング', cleared: 8, total: 10),
  _CategoryData(emoji: '💬', label: 'SNS', cleared: 2, total: 5),
  _CategoryData(emoji: '📱', label: 'アプリUI', cleared: 3, total: 8),
  _CategoryData(
    emoji: '🔐',
    label: '認証フロー',
    cleared: 0,
    total: 6,
    isLocked: true,
  ),
];

class _CategoryCarousel extends StatelessWidget {
  const _CategoryCarousel();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

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
              'カテゴリー',
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 118,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _sampleCategories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) =>
                _CategoryCard(category: _sampleCategories[index]),
          ),
        ),
      ],
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({required this.category});

  final _CategoryData category;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final progress =
        category.total > 0 ? category.cleared / category.total : 0.0;

    return Container(
      width: 132,
      decoration: BoxDecoration(
        color: category.isLocked
            ? colorScheme.surfaceContainerLow
            : colorScheme.primaryContainer.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: category.isLocked
              ? colorScheme.outlineVariant.withValues(alpha: 0.4)
              : colorScheme.primary.withValues(alpha: 0.2),
        ),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(category.emoji, style: const TextStyle(fontSize: 20)),
              const Spacer(),
              if (category.isLocked)
                Icon(
                  Icons.lock_rounded,
                  size: 14,
                  color: colorScheme.onSurface.withValues(alpha: 0.3),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            category.label,
            style: textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: category.isLocked
                  ? colorScheme.onSurface.withValues(alpha: 0.4)
                  : colorScheme.onPrimaryContainer,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          LinearProgressIndicator(
            value: category.isLocked ? 0 : progress,
            backgroundColor: colorScheme.surfaceContainerHighest,
            color: category.isLocked
                ? colorScheme.outline.withValues(alpha: 0.3)
                : colorScheme.primary,
            borderRadius: BorderRadius.circular(4),
            minHeight: 4,
          ),
          const SizedBox(height: 5),
          Text(
            category.isLocked
                ? 'クリア後に解放'
                : '${category.cleared}/${category.total} クリア',
            style: textTheme.labelSmall?.copyWith(
              color: category.isLocked
                  ? colorScheme.onSurface.withValues(alpha: 0.3)
                  : colorScheme.primary.withValues(alpha: 0.7),
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
