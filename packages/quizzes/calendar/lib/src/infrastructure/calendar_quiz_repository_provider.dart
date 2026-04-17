import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/system.dart';

import 'calendar_quiz_repository.dart';

/// カレンダークイズのリポジトリプロバイダー
final calendarQuizRepositoryProvider = Provider<CalendarQuizRepository>((ref) {
  final quizResultRepo = ref.watch(quizResultRepositoryProvider);
  return CalendarQuizRepository(quizResultRepo);
});
