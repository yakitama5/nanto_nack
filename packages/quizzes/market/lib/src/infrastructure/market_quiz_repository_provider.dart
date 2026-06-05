import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/system.dart';

import 'market_quiz_repository.dart';

final marketQuizRepositoryProvider = Provider<MarketQuizRepository>((ref) {
  final quizResultRepo = ref.watch(quizResultRepositoryProvider);
  return MarketQuizRepository(quizResultRepo);
});
