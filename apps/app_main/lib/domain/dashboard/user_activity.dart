/// 日付ごとのユーザーアクティビティ（ヒートマップ描画の最小単位）
class UserActivity {
  const UserActivity({
    required this.date,
    required this.clearCount,
    required this.totalScore,
  });

  /// 対象日（時刻は 00:00:00 に正規化）
  final DateTime date;

  /// その日のクリア数
  final int clearCount;

  /// その日の合計スコア
  final int totalScore;

  bool get hasActivity => clearCount > 0;

  UserActivity copyWith({
    DateTime? date,
    int? clearCount,
    int? totalScore,
  }) {
    return UserActivity(
      date: date ?? this.date,
      clearCount: clearCount ?? this.clearCount,
      totalScore: totalScore ?? this.totalScore,
    );
  }
}
