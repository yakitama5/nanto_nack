/// 送金先コンタクト
class PaymentContact {
  /// コンストラクタ
  const PaymentContact({
    required this.id,
    required this.name,
    required this.initial,
  });

  /// ID
  final String id;

  /// 表示名
  final String name;

  /// アイコン用のイニシャル文字
  final String initial;
}
