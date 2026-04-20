import 'package:quiz_core/quiz_core.dart';

import '../../domain/map_quiz_config.dart';

/// Quiz 1「現在地を表示する」の状態
class ShowLocationQuizState extends QuizStateBase {
  /// コンストラクタ
  const ShowLocationQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.locationShown,
    required this.remainingSeconds,
  });

  /// 初期状態を生成する
  factory ShowLocationQuizState.initial() =>
      ShowLocationQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        locationShown: false,
        remainingSeconds: MapQuizConfig.quiz1ShowLocationTimeLimitSeconds,
      );

  /// 現在地が表示されているかどうか
  final bool locationShown;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 指定フィールドを差し替えた新インスタンスを返す
  ShowLocationQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    bool? locationShown,
    int? remainingSeconds,
  }) {
    return ShowLocationQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      locationShown: locationShown ?? this.locationShown,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }
}
