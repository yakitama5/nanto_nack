import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/src/infrastructure/news_quiz_repository.dart';
import 'package:system/system.dart';

final newsQuizRepositoryProvider = Provider<NewsQuizRepository>((ref) {
  final quizResultRepo = ref.watch(quizResultRepositoryProvider);
  return NewsQuizRepository(quizResultRepo);
});
