import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/src/database/app_database_provider.dart';
import 'package:system/src/database/quiz_result_repository.dart';

final quizResultRepositoryProvider = Provider<QuizResultRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return QuizResultRepository(db);
});
