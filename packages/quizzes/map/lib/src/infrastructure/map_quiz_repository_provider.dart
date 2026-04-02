import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/system.dart';

import 'map_quiz_repository.dart';

/// マップクイズのリポジトリプロバイダー
final mapQuizRepositoryProvider = Provider<MapQuizRepository>((ref) {
  final quizResultRepo = ref.watch(quizResultRepositoryProvider);
  return MapQuizRepository(quizResultRepo);
});
