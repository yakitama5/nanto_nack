import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/system.dart';

import 'shopping_quiz_repository.dart';

final shoppingQuizRepositoryProvider =
    Provider<ShoppingQuizRepository>((ref) {
  final quizResultRepo = ref.watch(quizResultRepositoryProvider);
  return ShoppingQuizRepository(quizResultRepo);
});
