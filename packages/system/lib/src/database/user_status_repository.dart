import 'package:clock/clock.dart';
import 'package:drift/drift.dart';
import 'package:system/src/database/app_database.dart';

/// ユーザーステータスの永続化を担う Repository
class UserStatusRepository {
  const UserStatusRepository(this._db);

  final AppDatabase _db;

  /// ユーザーステータスを取得
  Future<UserStatusData> get() => _db.getUserStatus();

  /// 本日のプレイ回数をインクリメント
  Future<void> incrementDailyPlayCount() async {
    final status = await _db.getUserStatus();
    final today = clock.now();
    final lastReset = status.lastResetDate;

    // 日付が変わっていたらカウントをリセット
    final shouldReset = lastReset == null ||
        lastReset.year != today.year ||
        lastReset.month != today.month ||
        lastReset.day != today.day;

    await _db.updateUserStatus(
      UserStatusCompanion(
        dailyPlayCount: Value(shouldReset ? 1 : status.dailyPlayCount + 1),
        lastResetDate: Value(today),
      ),
    );
  }

  /// 制限に達しているか確認 (デフォルト上限: 5回/日)
  Future<bool> isLimitReached({int dailyLimit = 5}) async {
    final status = await _db.getUserStatus();
    if (status.isPremium) return false;

    final today = clock.now();
    final lastReset = status.lastResetDate;
    final isToday = lastReset != null &&
        lastReset.year == today.year &&
        lastReset.month == today.month &&
        lastReset.day == today.day;

    return isToday && status.dailyPlayCount >= dailyLimit;
  }

  /// プレミアム状態を更新
  Future<void> setPremium({required bool isPremium}) =>
      _db.updateUserStatus(UserStatusCompanion(isPremium: Value(isPremium)));
}
