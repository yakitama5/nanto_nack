import 'package:quiz_core/quiz_core.dart';

import '../../domain/alarm_quiz_config.dart';
import '../../domain/entities/alarm_item.dart';

/// Quiz 2「平日繰り返しを設定する」の状態
class SetWeekdaysQuizState extends QuizStateBase {
  /// コンストラクタ
  const SetWeekdaysQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.draftAlarm,
    required this.remainingSeconds,
    required this.showEditForm,
  });

  /// 初期状態を生成する
  factory SetWeekdaysQuizState.initial({
    required AlarmItem draft,
  }) =>
      SetWeekdaysQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        draftAlarm: draft,
        remainingSeconds: AlarmQuizConfig.quiz2SetWeekdaysTimeLimitSeconds,
        showEditForm: false,
      );

  /// 編集中のアラーム
  final AlarmItem draftAlarm;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 編集フォームを表示するかどうか（true: 編集画面, false: 一覧画面）
  final bool showEditForm;

  /// 指定フィールドを差し替えた新インスタンスを返す
  SetWeekdaysQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    AlarmItem? draftAlarm,
    int? remainingSeconds,
    bool? showEditForm,
  }) {
    return SetWeekdaysQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      draftAlarm: draftAlarm ?? this.draftAlarm,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      showEditForm: showEditForm ?? this.showEditForm,
    );
  }
}
