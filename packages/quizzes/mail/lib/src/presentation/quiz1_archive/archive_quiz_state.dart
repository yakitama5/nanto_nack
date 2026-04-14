import 'package:mail/src/domain/entities/mail.dart';
import 'package:mail/src/presentation/mail_app_state.dart';
import 'package:quiz_core/quiz_core.dart';

class ArchiveQuizState extends QuizStateBase {
  const ArchiveQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.mailApp,
  });

  final MailAppState mailApp;

  ArchiveQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    MailAppState? mailApp,
  }) {
    return ArchiveQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      mailApp: mailApp ?? this.mailApp,
    );
  }

  factory ArchiveQuizState.initial({required List<Mail> initialMails}) =>
      ArchiveQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        mailApp: MailAppState.initial(initialMails: initialMails),
      );
}
