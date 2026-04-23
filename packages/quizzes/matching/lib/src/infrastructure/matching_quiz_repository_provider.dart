import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matching/src/infrastructure/matching_quiz_repository.dart';
import 'package:system/system.dart';

final matchingQuizRepositoryProvider = Provider<MatchingQuizRepository>((ref) {
  final quizResultRepo = ref.watch(quizResultRepositoryProvider);
  return MatchingQuizRepository(quizResultRepo);
});
