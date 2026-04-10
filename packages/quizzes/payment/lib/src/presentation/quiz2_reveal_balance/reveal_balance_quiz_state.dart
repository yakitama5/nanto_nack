import 'package:quiz_core/quiz_core.dart';

/// Quiz 2「残高を隠す」の状態
class RevealBalanceQuizState extends QuizStateBase {
  /// コンストラクタ
  const RevealBalanceQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.balanceHidden,
    required this.remainingSeconds,
    this.hintUsed = false,
  });

  /// 初期状態を生成する
  factory RevealBalanceQuizState.initial({int timeLimitSeconds = 45}) =>
      RevealBalanceQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        // 初期状態: 残高は見えている（非表示フラグ = false）
        balanceHidden: false,
        remainingSeconds: timeLimitSeconds,
        hintUsed: false,
      );

  /// 残高が隠れているか（true = 隠れている = クリア状態）
  final bool balanceHidden;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// ヒントを使用済みかどうか
  final bool hintUsed;

  /// 指定フィールドを差し替えた新インスタンスを返す
  RevealBalanceQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    bool? balanceHidden,
    int? remainingSeconds,
    bool? hintUsed,
  }) {
    return RevealBalanceQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      balanceHidden: balanceHidden ?? this.balanceHidden,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      hintUsed: hintUsed ?? this.hintUsed,
    );
  }
}
