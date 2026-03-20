import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:system/system.dart';

import '../../application/dashboard_provider.dart';
import '../../application/stage_list_provider.dart';
import '../../domain/dashboard/dashboard_state.dart';
import '../../domain/dashboard/user_activity.dart';
import '../../domain/stage.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stageListAsync = ref.watch(stageListProvider);
    final dashboardAsync = ref.watch(dashboardProvider);
    final t = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.app.title),
        centerTitle: true,
      ),
      body: MaxWidthBox(
        maxWidth: 800,
        child: stageListAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(t.error.unknown),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => ref.invalidate(stageListProvider),
                  child: Text(t.error.retry),
                ),
              ],
            ),
          ),
          data: (stages) => RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(stageListProvider);
              await ref.read(dashboardProvider.notifier).refresh();
            },
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      dashboardAsync.when(
                        loading: () => const SkeletonDashboard(),
                        error: (_, __) => const SizedBox.shrink(),
                        data: (dashboard) =>
                            _DashboardSection(dashboard: dashboard),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                        child: Text(
                          t.home.stageList,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverList.builder(
                    itemCount: stages.length,
                    itemBuilder: (context, index) {
                      final item = stages[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: StageCard(
                          stageNumber: index + 1,
                          title: item.stage.title,
                          status: item.status,
                          clearTimeMs: item.clearTimeMs,
                          score: item.score,
                          onTap: () => _onStageTap(context, ref, item),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onStageTap(
    BuildContext context,
    WidgetRef ref,
    StageWithStatus item,
  ) async {
    if (item.status == StageStatus.locked) return;

    // プレイ上限チェック
    final userStatusRepo = ref.read(userStatusRepositoryProvider);
    final isLimited = await userStatusRepo.isLimitReached();
    if (isLimited && context.mounted) {
      await PlayLimitModal.show(
        context,
        onUpgrade: () {
          // TODO: IAP 実装後に課金フローへ
        },
      );
      return;
    }

    if (context.mounted) {
      context.push(item.stage.routePath);
    }
  }
}

/// ダッシュボードセクション（Tips・ストリーク・残りプレイ数・ヒートマップ）
class _DashboardSection extends StatelessWidget {
  const _DashboardSection({required this.dashboard});

  final DashboardState dashboard;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 今日のUI/UXヒント
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
                  icon: Icons.local_fire_department,
                  label: t.dashboard.streak,
                  value: t.dashboard.streakDays
                      .replaceAll('{days}', dashboard.currentStreak.toString()),
                  iconColor: Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  icon: Icons.sports_esports,
                  label: t.dashboard.remainingPlays,
                  value: dashboard.remainingPlayCount == null
                      ? t.dashboard.unlimitedPlays
                      : t.dashboard.remainingPlaysCount.replaceAll(
                          '{count}',
                          dashboard.remainingPlayCount.toString(),
                        ),
                  iconColor: AppColors.available,
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

/// 今日のUI/UXヒントカード
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 4),
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 4),
            Text(
              content,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.7),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 統計情報カード（ストリーク・残りプレイ数）
class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.iconColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 16, color: iconColor),
                const SizedBox(width: 4),
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.6),
                      ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 12),
            if (activities.every((a) => !a.hasActivity))
              Text(
                noActivityLabel,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
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
