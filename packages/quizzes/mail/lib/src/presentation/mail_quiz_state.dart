import 'package:mail/src/domain/entities/mail.dart';
import 'package:mail/src/domain/mail_quiz_config.dart';
import 'package:mail/src/presentation/mail_app_state.dart';
import 'package:quiz_core/quiz_core.dart';

/// メールクイズ共通の状態
///
/// Quiz1〜4 すべてで共通して使用する。
/// [isSearching] は Quiz4 (search) のみで使用し、他クイズでは常に false。
class MailQuizState extends QuizStateBase {
  const MailQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.mailApp,
    required this.remainingSeconds,
    this.isSearching = false,
  });

  final MailAppState mailApp;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 検索入力モードかどうか（Quiz4のみ使用）
  final bool isSearching;

  MailQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    MailAppState? mailApp,
    int? remainingSeconds,
    bool? isSearching,
  }) {
    return MailQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      mailApp: mailApp ?? this.mailApp,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  factory MailQuizState.initial({required List<Mail> initialMails}) =>
      MailQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        mailApp: MailAppState.initial(initialMails: initialMails),
        remainingSeconds: MailQuizConfig.timeLimitSeconds,
      );
}
