import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mail/src/infrastructure/mail_quiz_repository.dart';
import 'package:system/system.dart';

final mailQuizRepositoryProvider = Provider<MailQuizRepository>((ref) {
  final quizResultRepo = ref.watch(quizResultRepositoryProvider);
  return MailQuizRepository(quizResultRepo);
});
