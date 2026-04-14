import 'package:mail/src/domain/entities/mail.dart';
import 'package:mail/src/presentation/mail_app_state.dart';
import 'package:quiz_core/quiz_core.dart';

class SelectDeleteQuizState extends QuizStateBase {
  const SelectDeleteQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.mailApp,
  });

  final MailAppState mailApp;

  SelectDeleteQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    MailAppState? mailApp,
  }) {
    return SelectDeleteQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      mailApp: mailApp ?? this.mailApp,
    );
  }

  factory SelectDeleteQuizState.initial({required List<Mail> initialMails}) =>
      SelectDeleteQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        mailApp: MailAppState.initial(initialMails: initialMails),
      );
}
