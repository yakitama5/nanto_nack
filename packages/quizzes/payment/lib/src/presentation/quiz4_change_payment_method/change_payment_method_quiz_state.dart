import 'package:quiz_core/quiz_core.dart';

import '../../domain/payment_method.dart';
import '../../domain/payment_quiz_config.dart';

/// Quiz 4「支払い元を変更してバーコードを提示する」の状態
class ChangePaymentMethodQuizState extends QuizStateBase {
  /// コンストラクタ
  const ChangePaymentMethodQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.currentPaymentMethod,
    required this.paymentScreenShown,
    required this.remainingSeconds,
    this.hintUsed = false,
  });

  /// 初期状態を生成する
  factory ChangePaymentMethodQuizState.initial() =>
      ChangePaymentMethodQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        currentPaymentMethod: PaymentMethod.balance,
        paymentScreenShown: false,
        remainingSeconds:
            PaymentQuizConfig.quiz4ChangePaymentMethodTimeLimitSeconds,
        hintUsed: false,
      );

  /// 現在の支払い元
  final PaymentMethod currentPaymentMethod;

  /// 支払い画面が表示されているか
  final bool paymentScreenShown;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// ヒントを使用済みかどうか
  final bool hintUsed;

  /// 指定フィールドを差し替えた新インスタンスを返す
  ChangePaymentMethodQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    PaymentMethod? currentPaymentMethod,
    bool? paymentScreenShown,
    int? remainingSeconds,
    bool? hintUsed,
  }) {
    return ChangePaymentMethodQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      currentPaymentMethod: currentPaymentMethod ?? this.currentPaymentMethod,
      paymentScreenShown: paymentScreenShown ?? this.paymentScreenShown,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      hintUsed: hintUsed ?? this.hintUsed,
    );
  }
}
