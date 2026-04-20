import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/src/infrastructure/todo_quiz_repository.dart';
import 'package:system/system.dart';

final todoQuizRepositoryProvider = Provider<TodoQuizRepository>((ref) {
  final quizResultRepo = ref.watch(quizResultRepositoryProvider);
  return TodoQuizRepository(quizResultRepo);
});
