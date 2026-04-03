/// 取引履歴エントリ
class PaymentTransaction {
  /// コンストラクタ
  const PaymentTransaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.dateLabel,
    required this.isIncome,
  });

  /// ID
  final String id;

  /// 取引タイトル
  final String title;

  /// 金額（符号付き）
  final int amount;

  /// 日付ラベル（例: 今日、昨日）
  final String dateLabel;

  /// 収入かどうか
  final bool isIncome;
}
