import 'package:mail/src/domain/entities/mail.dart';
import 'package:mail/src/presentation/mail_app_state.dart';
import 'package:quiz_core/quiz_core.dart';

class EmptyTrashQuizState extends QuizStateBase {
  const EmptyTrashQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.mailApp,
  });

  final MailAppState mailApp;

  EmptyTrashQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    MailAppState? mailApp,
  }) {
    return EmptyTrashQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      mailApp: mailApp ?? this.mailApp,
    );
  }

  factory EmptyTrashQuizState.initial({required List<Mail> initialMails}) =>
      EmptyTrashQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        mailApp: MailAppState.initial(initialMails: initialMails),
      );
}
