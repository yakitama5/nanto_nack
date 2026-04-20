import 'package:quiz_core/quiz_core.dart';

import '../../domain/alarm_quiz_config.dart';
import '../../domain/entities/alarm_item.dart';

/// Quiz 1「アラームを追加する」の状態
class AddAlarmQuizState extends QuizStateBase {
  /// コンストラクタ
  const AddAlarmQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.showEditForm,
    required this.draftAlarm,
    required this.alarmSaved,
    required this.remainingSeconds,
  });

  /// 初期状態を生成する
  factory AddAlarmQuizState.initial({
    required AlarmItem draft,
  }) =>
      AddAlarmQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        showEditForm: false,
        draftAlarm: draft,
        alarmSaved: false,
        remainingSeconds: AlarmQuizConfig.quiz1AddAlarmTimeLimitSeconds,
      );

  /// 編集フォームを表示中か
  final bool showEditForm;

  /// 編集中のアラーム
  final AlarmItem draftAlarm;

  /// 保存済みかどうか
  final bool alarmSaved;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 指定フィールドを差し替えた新インスタンスを返す
  AddAlarmQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    bool? showEditForm,
    AlarmItem? draftAlarm,
    bool? alarmSaved,
    int? remainingSeconds,
  }) {
    return AddAlarmQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      showEditForm: showEditForm ?? this.showEditForm,
      draftAlarm: draftAlarm ?? this.draftAlarm,
      alarmSaved: alarmSaved ?? this.alarmSaved,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }
}
