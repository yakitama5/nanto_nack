import 'package:clock/clock.dart';
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

class _TodayHeroCard extends StatelessWidget {
  const _TodayHeroCard();

  @override
  Widget build(BuildContext context) {
    final scene = DailySceneTheme.resolveFromNow();
    final theme = DailySceneTheme.of(scene);
    final topPadding = MediaQuery.of(context).padding.top;
    final now = clock.now();

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
                              color: theme.onSceneColor.withValues(alpha: 0.7),
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
                _SceneIcon(theme: theme),
              ],
            ),
            const SizedBox(height: 28),
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

class _SceneIcon extends StatelessWidget {
  const _SceneIcon({required this.theme});

  final DailySceneTheme theme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.iconGlowColor,
          ),
        ),
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
          // 連続プレイカード（全幅・スタンプカレンダー付き）
          _StreakCard(
            currentStreak: dashboard.currentStreak,
            activityHistory: dashboard.activityHistory,
            streakLabel: t.dashboard.streak,
            streakValue: t.dashboard.streakDays.replaceAll(
              '{days}',
              dashboard.currentStreak.toString(),
            ),
          ),
          const SizedBox(height: 12),
          // 残りプレイ数（コンパクト横型カード）
          _PlayCountCard(
            label: t.dashboard.remainingPlays,
            value: dashboard.remainingPlayCount == null
                ? t.dashboard.unlimitedPlays
                : t.dashboard.remainingPlaysCount.replaceAll(
                    '{count}',
                    dashboard.remainingPlayCount.toString(),
                  ),
          ),
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
// 連続プレイカード（スタンプカレンダー付き）
// ─────────────────────────────────────────

/// 過去7日分のスタンプカレンダーを表示する連続プレイカード。
///
/// activityHistory から今日を含む直近7日分を取り出してセルを描画する。
class _StreakCard extends StatelessWidget {
  const _StreakCard({
    required this.currentStreak,
    required this.activityHistory,
    required this.streakLabel,
    required this.streakValue,
  });

  final int currentStreak;
  final List<UserActivity> activityHistory;
  final String streakLabel;
  final String streakValue;

  /// 今日を含む過去7日分のデータを構築する
  List<_DayCellData> _buildWeekData() {
    final now = clock.now();
    final today = DateTime(now.year, now.month, now.day);

    return List.generate(7, (i) {
      final date = today.subtract(Duration(days: 6 - i));
      final activity = activityHistory.firstWhere(
        (a) => a.date.year == date.year &&
            a.date.month == date.month &&
            a.date.day == date.day,
        orElse: () => UserActivity(date: date, clearCount: 0, totalScore: 0),
      );
      return _DayCellData(
        date: date,
        isToday: date == today,
        hasPlayed: activity.hasActivity,
        clearCount: activity.clearCount,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<NantoNackThemeExtension>()!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final weekData = _buildWeekData();

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── ヘッダー ──
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // アイコン
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ext.streakColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.local_fire_department_rounded,
                  size: 22,
                  color: ext.streakColor,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    streakLabel,
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    streakValue,
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ext.streakColor,
                      height: 1.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          // ── スタンプカレンダー ──
          Row(
            children: weekData.asMap().entries.map((entry) {
              return Expanded(
                child: _DayStampCell(
                  data: entry.value,
                  stampIndex: entry.key,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

/// 各日のデータ
class _DayCellData {
  const _DayCellData({
    required this.date,
    required this.isToday,
    required this.hasPlayed,
    required this.clearCount,
  });

  final DateTime date;
  final bool isToday;
  final bool hasPlayed;
  final int clearCount;
}

/// 1日分のスタンプセル
class _DayStampCell extends StatelessWidget {
  const _DayStampCell({
    required this.data,
    required this.stampIndex,
  });

  final _DayCellData data;

  /// スタンプの傾き計算に使うインデックス
  final int stampIndex;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<NantoNackThemeExtension>()!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    const weekdays = ['月', '火', '水', '木', '金', '土', '日'];
    final weekdayLabel = weekdays[data.date.weekday - 1];
    final dayLabel = data.date.day.toString();

    // 曜日ラベルの色（土=青、日=赤）
    final weekdayColor = switch (data.date.weekday) {
      6 => Colors.blue.shade400,    // 土
      7 => Colors.red.shade400,     // 日
      _ => colorScheme.onSurfaceVariant,
    };

    return Column(
      children: [
        // 曜日ラベル
        Text(
          weekdayLabel,
          style: textTheme.labelSmall?.copyWith(
            color: weekdayColor,
            fontWeight: FontWeight.w600,
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 6),
        // スタンプ本体
        _buildStamp(context, ext, colorScheme),
        const SizedBox(height: 5),
        // 日付ラベル
        Text(
          dayLabel,
          style: textTheme.labelSmall?.copyWith(
            color: data.isToday
                ? ext.streakColor
                : colorScheme.onSurface.withValues(alpha: 0.5),
            fontWeight: data.isToday ? FontWeight.w700 : FontWeight.w400,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _buildStamp(
    BuildContext context,
    NantoNackThemeExtension ext,
    ColorScheme colorScheme,
  ) {
    if (data.hasPlayed) {
      // ── プレイ済みスタンプ ──
      // インデックスで微妙に傾きを変えてスタンプらしさを演出
      final angle = (stampIndex % 2 == 0) ? -0.08 : 0.06;
      return Transform.rotate(
        angle: angle,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: ext.streakColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: ext.streakColor.withValues(alpha: 0.35),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const Icon(
            Icons.local_fire_department_rounded,
            size: 22,
            color: Colors.white,
          ),
        ),
      );
    }

    if (data.isToday) {
      // ── 今日・未プレイ：点線枠でアピール ──
      return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: ext.streakColor.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: ext.streakColor.withValues(alpha: 0.5),
            width: 1.5,
            // ignore: prefer_const_constructors
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        child: Icon(
          Icons.add_rounded,
          size: 20,
          color: ext.streakColor.withValues(alpha: 0.6),
        ),
      );
    }

    // ── 過去・未プレイ：薄いグレー ──
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: colorScheme.onSurface.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        Icons.remove_rounded,
        size: 18,
        color: colorScheme.onSurface.withValues(alpha: 0.2),
      ),
    );
  }
}

// ─────────────────────────────────────────
// 残りプレイ数カード（コンパクト横型）
// ─────────────────────────────────────────

class _PlayCountCard extends StatelessWidget {
  const _PlayCountCard({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<NantoNackThemeExtension>()!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ext.playCountContainerColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ext.playCountColor.withValues(alpha: 0.2),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: ext.playCountColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(
              Icons.sports_esports_rounded,
              size: 20,
              color: ext.playCountColor,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: ext.playCountColor,
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
