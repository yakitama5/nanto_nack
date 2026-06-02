import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/system.dart';

import 'finance_quiz_repository.dart';

final financeQuizRepositoryProvider = Provider<FinanceQuizRepository>((ref) {
  final quizResultRepo = ref.watch(quizResultRepositoryProvider);
  return FinanceQuizRepository(quizResultRepo);
});
