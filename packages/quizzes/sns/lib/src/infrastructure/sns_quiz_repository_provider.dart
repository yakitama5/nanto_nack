import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/system.dart';

import 'sns_quiz_repository.dart';

/// SNSクイズのリポジトリプロバイダー
final snsQuizRepositoryProvider = Provider<SnsQuizRepository>((ref) {
  final quizResultRepo = ref.watch(quizResultRepositoryProvider);
  return SnsQuizRepository(quizResultRepo);
});
