import 'package:quiz_core/quiz_core.dart';

import '../../domain/entities/alarm_item.dart';

/// Quiz 3「スヌーズをオフにする」の状態
class DisableSnoozeQuizState extends QuizStateBase {
  /// コンストラクタ
  const DisableSnoozeQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.draftAlarm,
    required this.saved,
    required this.remainingSeconds,
  });

  /// 初期状態を生成する
  factory DisableSnoozeQuizState.initial({
    required AlarmItem alarm,
    int timeLimitSeconds = 60,
  }) =>
      DisableSnoozeQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        draftAlarm: alarm,
        saved: false,
        remainingSeconds: timeLimitSeconds,
      );

  /// 編集中のアラーム
  final AlarmItem draftAlarm;

  /// 保存済みかどうか
  final bool saved;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 指定フィールドを差し替えた新インスタンスを返す
  DisableSnoozeQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    AlarmItem? draftAlarm,
    bool? saved,
    int? remainingSeconds,
  }) {
    return DisableSnoozeQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      draftAlarm: draftAlarm ?? this.draftAlarm,
      saved: saved ?? this.saved,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }
}
