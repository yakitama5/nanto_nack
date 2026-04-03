import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/system.dart';

import 'alarm_quiz_repository.dart';

/// アラームクイズのリポジトリプロバイダー
final alarmQuizRepositoryProvider = Provider<AlarmQuizRepository>((ref) {
  final quizResultRepo = ref.watch(quizResultRepositoryProvider);
  return AlarmQuizRepository(quizResultRepo);
});
