import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/domain/shopping_quiz_config.dart';

/// 購入手続きクイズの状態
class CheckoutQuizState extends QuizStateBase {
  const CheckoutQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.remainingSeconds,
    this.address = '',
    this.selectedPayment,
    this.isConfirmed = false,
  });

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 入力済みの住所
  final String address;

  /// 選択された支払い方法
  final String? selectedPayment;

  /// 注文確認チェックボックス
  final bool isConfirmed;

  CheckoutQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    int? remainingSeconds,
    String? address,
    String? selectedPayment,
    bool? isConfirmed,
  }) {
    return CheckoutQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      address: address ?? this.address,
      selectedPayment: selectedPayment ?? this.selectedPayment,
      isConfirmed: isConfirmed ?? this.isConfirmed,
    );
  }

  factory CheckoutQuizState.initial() =>
      CheckoutQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        remainingSeconds: ShoppingQuizConfig.checkoutTimeLimitSeconds,
      );
}
