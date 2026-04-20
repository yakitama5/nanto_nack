import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/domain/shopping_quiz_config.dart';

/// カート合計金額クイズの状態
class CartQuizState extends QuizStateBase {
  const CartQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.remainingSeconds,
    this.enteredDigits = const [0, 0, 0, 0],
    this.hintUsed = false,
  });

  /// 残り時間（秒）
  final int remainingSeconds;

  /// ユーザーが入力した各桁の数字（千・百・十・一の位）
  final List<int> enteredDigits;

  /// ヒントを使用済みかどうか
  final bool hintUsed;

  /// 入力された4桁の数値
  int get enteredValue =>
      enteredDigits[0] * 1000 +
      enteredDigits[1] * 100 +
      enteredDigits[2] * 10 +
      enteredDigits[3];

  CartQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    int? remainingSeconds,
    List<int>? enteredDigits,
    bool? hintUsed,
  }) {
    return CartQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      enteredDigits: enteredDigits ?? this.enteredDigits,
      hintUsed: hintUsed ?? this.hintUsed,
    );
  }

  factory CartQuizState.initial() => CartQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        remainingSeconds: ShoppingQuizConfig.cartTimeLimitSeconds,
      );
}
