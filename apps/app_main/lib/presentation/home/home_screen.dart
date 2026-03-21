import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../application/dashboard_provider.dart';
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
      body: MaxWidthBox(
        maxWidth: 800,
        child: RefreshIndicator(
          onRefresh: () async =>
              ref.read(dashboardProvider.notifier).refresh(),
          child: CustomScrollView(
            slivers: [
              // ===== ラージアプリバー + グラデーション背景 =====
              SliverAppBar.large(
                pinned: true,
                backgroundColor: colorScheme.surface,
                foregroundColor: colorScheme.onSurface,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.app.title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                      ),
                      Text(
                        t.app.subtitle,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ],
                  ),
                  background: _AppBarBackground(),
                ),
              ),
              // ===== ダッシュボードコンテンツ =====
              SliverToBoxAdapter(
                child: dashboardAsync.when(
                  loading: () => const Padding(
                    padding: EdgeInsets.all(16),
                    child: SkeletonDashboard(),
                  ),
                  error: (_, __) => const SizedBox.shrink(),
                  data: (dashboard) => _DashboardContent(
                    dashboard: dashboard,
                  ),
                ),
              ),
              // ===== ボトムパディング =====
              const SliverToBoxAdapter(child: SizedBox(height: 96)),
            ],
          ),
        ),
      ),
      // ===== プレイ開始FAB =====
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/play'),
        icon: const Icon(Icons.play_arrow_rounded),
        label: Text(t.play.startPlay),
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
        elevation: 4,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

/// AppBar背景のグラデーション
class _AppBarBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primaryContainer.withValues(alpha: 0.6),
            colorScheme.secondaryContainer.withValues(alpha: 0.4),
            colorScheme.surface,
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}

/// ダッシュボードのメインコンテンツ
class _DashboardContent extends StatelessWidget {
  const _DashboardContent({required this.dashboard});

  final DashboardState dashboard;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 今日のUI/UXヒント（メインビジュアル）
          _TipCard(
            label: t.dashboard.todayTip,
            title: dashboard.dailyTip.title,
            content: dashboard.dailyTip.content,
          ),
          const SizedBox(height: 12),
          // ストリーク + 残りプレイ数
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  type: _StatCardType.streak,
                  label: t.dashboard.streak,
                  value: t.dashboard.streakDays.replaceAll(
                    '{days}',
                    dashboard.currentStreak.toString(),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  type: _StatCardType.playCount,
                  label: t.dashboard.remainingPlays,
                  value: dashboard.remainingPlayCount == null
                      ? t.dashboard.unlimitedPlays
                      : t.dashboard.remainingPlaysCount.replaceAll(
                          '{count}',
                          dashboard.remainingPlayCount.toString(),
                        ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
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

/// 今日のUI/UXヒントカード（グラデーション背景）
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
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ラベル行
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color:
                        colorScheme.primary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.lightbulb_rounded,
                        size: 14,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        label,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onPrimaryContainer,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              content,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onPrimaryContainer
                        .withValues(alpha: 0.8),
                    height: 1.5,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _StatCardType { streak, playCount }

/// 統計情報カード（ストリーク・残りプレイ数）
class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.type,
    required this.label,
    required this.value,
  });

  final _StatCardType type;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final ext =
        Theme.of(context).extension<NantoNackThemeExtension>()!;
    final colorScheme = Theme.of(context).colorScheme;

    final (accentColor, containerColor, icon) = switch (type) {
      _StatCardType.streak => (
          ext.streakColor,
          ext.streakContainerColor,
          Icons.local_fire_department_rounded,
        ),
      _StatCardType.playCount => (
          ext.playCountColor,
          ext.playCountContainerColor,
          Icons.sports_esports_rounded,
        ),
    };

    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: accentColor.withValues(alpha: 0.2),
        ),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 16, color: accentColor),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style:
                      Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
          ),
        ],
      ),
    );
  }
}

/// プレイ履歴セクション（ヒートマップ）
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

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.bar_chart_rounded,
                  size: 16,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (activities.every((a) => !a.hasActivity))
              Text(
                noActivityLabel,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface
                          .withValues(alpha: 0.5),
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
      ),
    );
  }
}
