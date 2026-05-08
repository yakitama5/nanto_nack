import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/system.dart';

import 'music_quiz_repository.dart';

final musicQuizRepositoryProvider = Provider<MusicQuizRepository>((ref) {
  final quizResultRepo = ref.watch(quizResultRepositoryProvider);
  return MusicQuizRepository(quizResultRepo);
});
