/// アラームアイテムエンティティ
class AlarmItem {
  /// コンストラクタ
  const AlarmItem({
    required this.id,
    required this.hour,
    required this.minute,
    required this.isEnabled,
    required this.snoozeEnabled,
    this.activeDays = const {},
    this.label = '',
  });

  /// ID
  final String id;

  /// 時
  final int hour;

  /// 分
  final int minute;

  /// 有効かどうか
  final bool isEnabled;

  /// スヌーズ有効かどうか
  final bool snoozeEnabled;

  /// 繰り返す曜日（0=月, 1=火, ..., 6=日）
  final Set<int> activeDays;

  /// ラベル
  final String label;

  /// 時間を "HH:mm" 形式で返す
  String get timeLabel {
    final h = hour.toString().padLeft(2, '0');
    final m = minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  /// AM/PM（12時間制表示）かどうか
  bool get isAm => hour < 12;

  /// インスタンスをコピーする
  AlarmItem copyWith({
    String? id,
    int? hour,
    int? minute,
    bool? isEnabled,
    bool? snoozeEnabled,
    Set<int>? activeDays,
    String? label,
  }) {
    return AlarmItem(
      id: id ?? this.id,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      isEnabled: isEnabled ?? this.isEnabled,
      snoozeEnabled: snoozeEnabled ?? this.snoozeEnabled,
      activeDays: activeDays ?? this.activeDays,
      label: label ?? this.label,
    );
  }
}
