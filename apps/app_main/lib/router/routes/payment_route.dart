/// 決済カテゴリーのルートパスEnum。
enum PaymentRoute {
  list('/play/payment'),
  quiz1('/play/payment/quiz1'),
  quiz2('/play/payment/quiz2'),
  quiz3('/play/payment/quiz3'),
  quiz4('/play/payment/quiz4');

  const PaymentRoute(this.path);
  final String path;
}
