import 'package:quiz_core/quiz_core.dart';

import '../../domain/alarm_quiz_config.dart';
import '../../domain/entities/alarm_item.dart';

/// Quiz 4「アラームを削除する」の状態
class DeleteAlarmQuizState extends QuizStateBase {
  /// コンストラクタ
  const DeleteAlarmQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.alarms,
    required this.deletedAlarmIds,
    required this.remainingSeconds,
  });

  /// 初期状態を生成する
  factory DeleteAlarmQuizState.initial({
    required List<AlarmItem> alarms,
  }) =>
      DeleteAlarmQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        alarms: alarms,
        deletedAlarmIds: const {},
        remainingSeconds: AlarmQuizConfig.quiz4DeleteAlarmTimeLimitSeconds,
      );

  /// 表示中のアラームリスト
  final List<AlarmItem> alarms;

  /// 削除済みのアラームID集合
  final Set<String> deletedAlarmIds;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 指定フィールドを差し替えた新インスタンスを返す
  DeleteAlarmQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    List<AlarmItem>? alarms,
    Set<String>? deletedAlarmIds,
    int? remainingSeconds,
  }) {
    return DeleteAlarmQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      alarms: alarms ?? this.alarms,
      deletedAlarmIds: deletedAlarmIds ?? this.deletedAlarmIds,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }
}
