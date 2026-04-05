import 'package:quiz_core/quiz_core.dart';

/// Quiz 4「取引履歴を確認する」の状態
class ViewHistoryQuizState extends QuizStateBase {
  /// コンストラクタ
  const ViewHistoryQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.historyViewed,
    required this.remainingSeconds,
  });

  /// 初期状態を生成する
  factory ViewHistoryQuizState.initial({int timeLimitSeconds = 30}) =>
      ViewHistoryQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        historyViewed: false,
        remainingSeconds: timeLimitSeconds,
      );

  /// 履歴が表示されたか
  final bool historyViewed;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 指定フィールドを差し替えた新インスタンスを返す
  ViewHistoryQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    bool? historyViewed,
    int? remainingSeconds,
  }) {
    return ViewHistoryQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      historyViewed: historyViewed ?? this.historyViewed,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }
}
