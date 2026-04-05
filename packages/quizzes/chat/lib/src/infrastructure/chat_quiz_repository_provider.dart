import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/system.dart';

import 'chat_quiz_repository.dart';

final chatQuizRepositoryProvider = Provider<ChatQuizRepository>((ref) {
  final quizResultRepo = ref.watch(quizResultRepositoryProvider);
  return ChatQuizRepository(quizResultRepo);
});
