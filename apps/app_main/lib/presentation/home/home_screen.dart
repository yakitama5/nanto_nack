import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../application/dashboard_provider.dart';
import '../../domain/daily_scene.dart';
import '../../domain/dashboard/dashboard_state.dart';
import '../../domain/dashboard/user_activity.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(dashboardProvider);
    final t = Translations.of(context);
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
              // ===== 今日の1枚ヒーローカード =====
              const SliverToBoxAdapter(child: _TodayHeroCard()),
              // ===== ダッシュボードコンテンツ =====
              SliverToBoxAdapter(
                child: dashboardAsync.when(
                  loading: () => const Padding(
                    padding: EdgeInsets.fromLTRB(20, 24, 20, 0),
                    child: SkeletonDashboard(),
                  ),
                  error: (_, __) => const SizedBox.shrink(),
                  data: (dashboard) => _DashboardContent(
                    dashboard: dashboard,
                  ),
                ),
              ),
              // ===== ボトムパディング（FABの高さ分） =====
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),
        ),
      ),
      // ===== プレイ開始FAB =====
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/play'),
        icon: const Icon(Icons.play_arrow_rounded),
        label: Text(t.play.startPlay),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 6,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// ─────────────────────────────────────────
// 今日の1枚ヒーローカード
// ─────────────────────────────────────────

/// 画面上部に表示する「今日の1枚」カード。
///
/// 時間帯と日付のシードから [DailyScene] を決定し、
/// シーン毎のグラデーションとアイコンを表示する。
/// 将来的に天気APIと連携してリアルな天気を反映できる設計。
class _TodayHeroCard extends StatelessWidget {
  const _TodayHeroCard();

  @override
  Widget build(BuildContext context) {
    final scene = DailySceneTheme.resolveFromNow();
    final theme = DailySceneTheme.of(scene);
    final topPadding = MediaQuery.of(context).padding.top;
    final now = DateTime.now();

    // 曜日の略称
    const weekdays = ['月', '火', '水', '木', '金', '土', '日'];
    final weekday = weekdays[now.weekday - 1];
    final dateLabel = '${now.month}月${now.day}日（$weekday）';

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(32),
        bottomRight: Radius.circular(32),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(24, topPadding + 20, 24, 36),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: theme.gradientColors,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 日付行 ──
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
                              color: theme.onSceneColor
                                  .withValues(alpha: 0.7),
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        theme.greeting,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              color: theme.onSceneColor,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
                // シーンアイコン（グロー付き）
                _SceneIcon(theme: theme),
              ],
            ),
            const SizedBox(height: 28),
            // ── アプリタイトル ──
            Text(
              'NantoNack',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: theme.onSceneColor,
                    letterSpacing: -1,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              'UI/UX 直感クイズ',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: theme.onSceneColor.withValues(alpha: 0.65),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

/// シーンを表す装飾アイコン
class _SceneIcon extends StatelessWidget {
  const _SceneIcon({required this.theme});

  final DailySceneTheme theme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // グローエフェクト（外側の大きな半透明円）
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.iconGlowColor,
          ),
        ),
        // アイコン背景（内側の円）
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.onSceneColor.withValues(alpha: 0.1),
          ),
          child: Icon(
            theme.icon,
            size: 32,
            color: theme.onSceneColor.withValues(alpha: 0.9),
          ),
        ),
      ],
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
          // ストリーク + 残りプレイ数
          _StatsRow(dashboard: dashboard),
          const SizedBox(height: 16),
          // プレイ履歴（ヒートマップ）
          _ActivityHistorySection(
            label: t.dashboard.activityHistory,
            noActivityLabel: t.dashboard.noActivity,
            activities: dashboard.activityHistory,
          ),
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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ラベルPill
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
// 統計行（ストリーク＋残りプレイ数）
// ─────────────────────────────────────────

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.dashboard});

  final DashboardState dashboard;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final ext = Theme.of(context).extension<NantoNackThemeExtension>()!;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _StatCard(
              icon: Icons.local_fire_department_rounded,
              label: t.dashboard.streak,
              value: t.dashboard.streakDays
                  .replaceAll('{days}', dashboard.currentStreak.toString()),
              accentColor: ext.streakColor,
              containerColor: ext.streakContainerColor,
              borderColor: ext.streakColor.withValues(alpha: 0.2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _StatCard(
              icon: Icons.sports_esports_rounded,
              label: t.dashboard.remainingPlays,
              value: dashboard.remainingPlayCount == null
                  ? t.dashboard.unlimitedPlays
                  : t.dashboard.remainingPlaysCount.replaceAll(
                      '{count}',
                      dashboard.remainingPlayCount.toString(),
                    ),
              accentColor: ext.playCountColor,
              containerColor: ext.playCountContainerColor,
              borderColor: ext.playCountColor.withValues(alpha: 0.2),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.accentColor,
    required this.containerColor,
    required this.borderColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color accentColor;
  final Color containerColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // アイコン
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 22, color: accentColor),
          ),
          const SizedBox(height: 12),
          // ラベル
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 4),
          // 数値（大きく）
          Text(
            value,
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: accentColor,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// プレイ履歴（ヒートマップ）
// ─────────────────────────────────────────

class _ActivityHistorySection extends StatelessWidget {
  const _ActivityHistorySection({
    required this.label,
    required this.noActivityLabel,
    required this.activities,
  });

  final String label;
  final String noActivityLabel;
  final List<UserActivity> activities;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.4),
        ),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // セクションヘッダー
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.bar_chart_rounded,
                  size: 16,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (activities.every((a) => !a.hasActivity))
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                noActivityLabel,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.45),
                ),
              ),
            )
          else
            NantoHeatmap(
              activities: activities
                  .map((a) => (date: a.date, clearCount: a.clearCount))
                  .toList(),
            ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// 共通ウィジェット
// ─────────────────────────────────────────

/// ラベル付きPillチップ（アイコン + テキスト）
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
