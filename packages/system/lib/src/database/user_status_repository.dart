import 'package:clock/clock.dart';
import 'package:drift/drift.dart';
import 'package:system/src/database/app_database.dart';

/// ユーザーステータスの永続化を担う Repository
class UserStatusRepository {
  const UserStatusRepository(this._db);

  final AppDatabase _db;

  /// ユーザーステータスを取得
  Future<UserStatusData> get() => _db.getUserStatus();

  /// 制限に達しているか確認
  ///
  /// PlayLogs の件数を当日分でカウントして判定するため、
  /// ダッシュボードの残りプレイ数表示と常に一致する。
  Future<bool> isLimitReached({required int dailyLimit}) async {
    final status = await _db.getUserStatus();
    if (status.isPremium) return false;

    final today = clock.now();
    final startOfDay = DateTime(today.year, today.month, today.day);
    final todayPlayCount = await _db.countPlayLogsSince(startOfDay);
    return todayPlayCount >= dailyLimit;
  }

  /// プレミアム状態を更新
  Future<void> setPremium({required bool isPremium}) =>
      _db.updateUserStatus(UserStatusCompanion(isPremium: Value(isPremium)));
}
