import 'daily_tip.dart';
import 'user_activity.dart';

/// ダッシュボード画面の状態エンティティ
class DashboardState {
  const DashboardState({
    required this.remainingPlayCount,
    required this.dailyTip,
    required this.activityHistory,
    required this.currentStreak,
  });

  /// 本日の残りプレイ可能数（null = 無制限/課金済み）
  final int? remainingPlayCount;

  /// 今日表示する Tips
  final DailyTip dailyTip;

  /// 過去60日間のプレイ履歴リスト（日付昇順）
  final List<UserActivity> activityHistory;

  /// 現在の連続プレイ日数
  final int currentStreak;

  DashboardState copyWith({
    int? remainingPlayCount,
    DailyTip? dailyTip,
    List<UserActivity>? activityHistory,
    int? currentStreak,
  }) {
    return DashboardState(
      remainingPlayCount: remainingPlayCount ?? this.remainingPlayCount,
      dailyTip: dailyTip ?? this.dailyTip,
      activityHistory: activityHistory ?? this.activityHistory,
      currentStreak: currentStreak ?? this.currentStreak,
    );
  }
}
