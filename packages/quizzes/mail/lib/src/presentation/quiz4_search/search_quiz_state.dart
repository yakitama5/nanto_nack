import 'package:mail/src/domain/entities/mail.dart';
import 'package:mail/src/presentation/mail_app_state.dart';
import 'package:quiz_core/quiz_core.dart';

class SearchQuizState extends QuizStateBase {
  const SearchQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.mailApp,
    required this.isSearching,
  });

  final MailAppState mailApp;

  /// 検索入力モードかどうか
  final bool isSearching;

  SearchQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    MailAppState? mailApp,
    bool? isSearching,
  }) {
    return SearchQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      mailApp: mailApp ?? this.mailApp,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  factory SearchQuizState.initial({required List<Mail> initialMails}) =>
      SearchQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        mailApp: MailAppState.initial(initialMails: initialMails),
        isSearching: false,
      );
}
