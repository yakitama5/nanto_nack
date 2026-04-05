import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/system.dart';

import 'streaming_quiz_repository.dart';

final streamingQuizRepositoryProvider =
    Provider<StreamingQuizRepository>((ref) {
  final quizResultRepo = ref.watch(quizResultRepositoryProvider);
  return StreamingQuizRepository(quizResultRepo);
});
