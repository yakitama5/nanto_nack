import 'dart:collection';

import 'daily_tip.dart';
import 'user_activity.dart';

// copyWith で null を明示的に渡すためのセンチネルオブジェクト。
// `int? ?? this.x` パターンは null と「未指定」を区別できないため、
// sentinel を使って「null を渡した」ことを判定する。
const _absent = Object();

/// ダッシュボード画面の状態エンティティ
class DashboardState {
  DashboardState({
    required this.remainingPlayCount,
    required this.dailyPlayLimit,
    required this.dailyTip,
    required List<UserActivity> activityHistory,
    required this.currentStreak,
  }) : activityHistory = UnmodifiableListView(activityHistory);

  /// 本日の残りプレイ可能数（null = 無制限/課金済み）
  final int? remainingPlayCount;

  /// 1日のプレイ上限回数（null = 無制限/課金済み）
  final int? dailyPlayLimit;

  /// 今日表示する Tips
  final DailyTip dailyTip;

  /// 過去60日間のプレイ履歴リスト（日付昇順・外部から変更不可）
  final List<UserActivity> activityHistory;

  /// 現在の連続プレイ日数
  final int currentStreak;

  /// [remainingPlayCount] を null（無制限）に設定したい場合は
  /// `copyWith(remainingPlayCount: null)` ではなく
  /// `copyWith(remainingPlayCount: const Value(null))` を使用すること。
  ///
  /// 通常の `int?` 型を使うと null と「未指定」が区別できないため、
  /// nullable フィールドには [Object?] + sentinel で判定している。
  DashboardState copyWith({
    Object? remainingPlayCount = _absent,
    Object? dailyPlayLimit = _absent,
    DailyTip? dailyTip,
    List<UserActivity>? activityHistory,
    int? currentStreak,
  }) {
    return DashboardState(
      remainingPlayCount: remainingPlayCount == _absent
          ? this.remainingPlayCount
          : remainingPlayCount as int?,
      dailyPlayLimit: dailyPlayLimit == _absent
          ? this.dailyPlayLimit
          : dailyPlayLimit as int?,
      dailyTip: dailyTip ?? this.dailyTip,
      activityHistory: activityHistory ?? this.activityHistory,
      currentStreak: currentStreak ?? this.currentStreak,
    );
  }
}
