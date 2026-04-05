import 'package:quiz_core/quiz_core.dart';

/// Quiz 2「残高を確認する」の状態
class RevealBalanceQuizState extends QuizStateBase {
  /// コンストラクタ
  const RevealBalanceQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.balanceRevealed,
    required this.remainingSeconds,
  });

  /// 初期状態を生成する
  factory RevealBalanceQuizState.initial({int timeLimitSeconds = 30}) =>
      RevealBalanceQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        balanceRevealed: false,
        remainingSeconds: timeLimitSeconds,
      );

  /// 残高ブラーが解除されたか
  final bool balanceRevealed;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 指定フィールドを差し替えた新インスタンスを返す
  RevealBalanceQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    bool? balanceRevealed,
    int? remainingSeconds,
  }) {
    return RevealBalanceQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      balanceRevealed: balanceRevealed ?? this.balanceRevealed,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }
}
