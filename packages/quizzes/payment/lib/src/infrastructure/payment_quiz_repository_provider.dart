import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/system.dart';

import 'payment_quiz_repository.dart';

/// 決済クイズのリポジトリプロバイダー
final paymentQuizRepositoryProvider = Provider<PaymentQuizRepository>((ref) {
  final quizResultRepo = ref.watch(quizResultRepositoryProvider);
  return PaymentQuizRepository(quizResultRepo);
});
