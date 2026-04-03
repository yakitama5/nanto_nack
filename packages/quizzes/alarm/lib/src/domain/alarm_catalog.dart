import 'entities/alarm_item.dart';

/// アラームアプリのマスターデータカタログ
class AlarmCatalog {
  AlarmCatalog._();

  /// 初期アラームリスト（Quiz4 のスワイプ削除対象を先頭に配置）
  static const List<AlarmItem> initialAlarms = [
    AlarmItem(
      id: 'alarm_1',
      hour: 6,
      minute: 30,
      isEnabled: true,
      snoozeEnabled: true,
      activeDays: {0, 1, 2, 3, 4},
    ),
    AlarmItem(
      id: 'alarm_2',
      hour: 7,
      minute: 0,
      isEnabled: true,
      snoozeEnabled: true,
      activeDays: {0, 1, 2, 3, 4, 5, 6},
    ),
    AlarmItem(
      id: 'alarm_3',
      hour: 8,
      minute: 15,
      isEnabled: false,
      snoozeEnabled: false,
      activeDays: {},
    ),
  ];

  /// Quiz3用の編集対象アラーム（スヌーズ付き）
  static const AlarmItem snoozeAlarm = AlarmItem(
    id: 'edit_alarm',
    hour: 7,
    minute: 0,
    isEnabled: true,
    snoozeEnabled: true,
    activeDays: {0, 1, 2, 3, 4},
  );

  /// 新規アラームの初期値（Quiz1用）
  static const AlarmItem newAlarmDefault = AlarmItem(
    id: 'new_alarm',
    hour: 8,
    minute: 0,
    isEnabled: true,
    snoozeEnabled: true,
    activeDays: {},
  );

  /// 曜日インデックスのリスト（月=0 〜 日=6）
  static const List<int> weekdayIndices = [0, 1, 2, 3, 4, 5, 6];

  /// 平日インデックス（月〜金）
  static const Set<int> weekdays = {0, 1, 2, 3, 4};
}
