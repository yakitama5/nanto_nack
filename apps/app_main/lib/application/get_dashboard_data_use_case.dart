import 'dart:math';

import '../domain/dashboard/dashboard_state.dart';
import '../domain/dashboard/daily_tip.dart';
import '../domain/dashboard/user_activity.dart';
import '../infrastructure/dashboard_repository.dart';

/// ダッシュボード表示データを取得・加工するユースケース
class GetDashboardDataUseCase {
  const GetDashboardDataUseCase(this._repository);

  final DashboardRepository _repository;

  /// ダッシュボード表示に必要なすべてのデータを返す
  Future<DashboardState> execute() async {
    final tips = _repository.fetchRawTips();
    final dailyTip = _selectDailyTip(tips);

    final isPremium = await _repository.isPremium();
    final todayPlayCount = await _repository.getTodayPlayCount();
    final remainingPlayCount =
        isPremium ? null : (5 - todayPlayCount).clamp(0, 5);

    final since = DateTime.now().subtract(const Duration(days: 60));
    final history = await _repository.getQuizHistorySince(since);

    final activityHistory = _buildActivityHistory(history);
    final currentStreak = _calculateStreak(activityHistory);

    return DashboardState(
      remainingPlayCount: remainingPlayCount,
      dailyTip: dailyTip,
      activityHistory: activityHistory,
      currentStreak: currentStreak,
    );
  }

  /// 今日の日付をシード値にしてランダムに1件のTipsを選出
  DailyTip _selectDailyTip(List<DailyTip> tips) {
    if (tips.isEmpty) {
      return const DailyTip(
        id: 'default',
        title: 'UI/UXを学ぼう',
        content: 'クイズを解いてUI/UXの感覚を磨きましょう！',
      );
    }
    final today = DateTime.now();
    final seed = today.year * 10000 + today.month * 100 + today.day;
    final index = Random(seed).nextInt(tips.length);
    return tips[index];
  }

  /// Drift の履歴を日付ごとに集計して60日分のバケットを構築
  List<UserActivity> _buildActivityHistory(
    List<dynamic> results,
  ) {
    final today = DateTime.now();
    // 日付 → {clearCount, totalScore} のマップ
    final activityMap = <DateTime, ({int clearCount, int totalScore})>{};

    for (final result in results) {
      final playedAt = result.lastPlayedAt;
      if (playedAt == null) continue;

      final day = DateTime(playedAt.year, playedAt.month, playedAt.day);
      final existing = activityMap[day];
      activityMap[day] = (
        clearCount: (existing?.clearCount ?? 0) + 1,
        totalScore: (existing?.totalScore ?? 0) + (result.score as int),
      );
    }

    // 60日分のバケットを生成（日付昇順）
    return List.generate(60, (i) {
      final day = DateTime(
        today.year,
        today.month,
        today.day - (59 - i),
      );
      final activity = activityMap[day];
      return UserActivity(
        date: day,
        clearCount: activity?.clearCount ?? 0,
        totalScore: activity?.totalScore ?? 0,
      );
    });
  }

  /// アクティビティ履歴から今日まで何日連続でプレイしているかを計算
  int _calculateStreak(List<UserActivity> activities) {
    if (activities.isEmpty) return 0;

    var streak = 0;
    // 今日から遡って連続しているかを確認
    for (final activity in activities.reversed) {
      if (!activity.hasActivity) break;
      streak++;
    }
    return streak;
  }
}
