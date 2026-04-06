import '../domain/payment_method.dart';

/// Quiz 4「支払い元を変更する」のユースケース
class QuizChangePaymentMethodUseCase {
  /// コンストラクタ
  const QuizChangePaymentMethodUseCase();

  /// クリア条件: クレジットカードが選択されている状態で支払い画面が開かれた
  bool isClear({
    required PaymentMethod currentPaymentMethod,
    required bool paymentScreenShown,
  }) =>
      currentPaymentMethod == PaymentMethod.creditCard && paymentScreenShown;
}
