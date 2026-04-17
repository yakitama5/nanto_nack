import '../../config/route_path_constants.dart';

/// 決済カテゴリーのルートパスEnum。
enum PaymentRoute {
  list(kPaymentListPath),
  quiz1(kPaymentQuiz1Path),
  quiz2(kPaymentQuiz2Path),
  quiz3(kPaymentQuiz3Path),
  quiz4(kPaymentQuiz4Path);

  const PaymentRoute(this.path);
  final String path;
}
