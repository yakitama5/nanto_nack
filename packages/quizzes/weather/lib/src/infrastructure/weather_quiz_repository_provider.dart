import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/system.dart';

import 'weather_quiz_repository.dart';

final weatherQuizRepositoryProvider = Provider<WeatherQuizRepository>((ref) {
  final quizResultRepo = ref.watch(quizResultRepositoryProvider);
  return WeatherQuizRepository(quizResultRepo);
});
