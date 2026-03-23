import 'package:quiz_core/quiz_core.dart';

/// カート合計金額クイズの状態
class CartQuizState extends QuizStateBase {
  const CartQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.remainingSeconds,
    this.selectedChoice,
    this.hintUsed = false,
  });

  /// 残り時間（秒）
  final int remainingSeconds;

  /// ユーザーが選択した合計金額
  final int? selectedChoice;

  /// ヒントを使用済みかどうか
  final bool hintUsed;

  CartQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    int? remainingSeconds,
    int? selectedChoice,
    bool? hintUsed,
  }) {
    return CartQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      selectedChoice: selectedChoice ?? this.selectedChoice,
      hintUsed: hintUsed ?? this.hintUsed,
    );
  }

  factory CartQuizState.initial({int timeLimitSeconds = 60}) => CartQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        remainingSeconds: timeLimitSeconds,
      );
}
