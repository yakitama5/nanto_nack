import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/system.dart';

import 'delivery_quiz_repository.dart';

final deliveryQuizRepositoryProvider = Provider<DeliveryQuizRepository>((ref) {
  final quizResultRepo = ref.watch(quizResultRepositoryProvider);
  return DeliveryQuizRepository(quizResultRepo);
});
