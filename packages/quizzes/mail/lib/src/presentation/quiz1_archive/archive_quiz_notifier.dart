import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mail/src/application/quiz_archive_mail_use_case.dart';
import 'package:mail/src/domain/entities/mail_folder.dart';
import 'package:mail/src/domain/mail_catalog.dart';
import 'package:mail/src/infrastructure/mail_quiz_repository_provider.dart';
import 'package:mail/src/presentation/quiz1_archive/archive_quiz_state.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

final archiveQuizProvider =
    AutoDisposeNotifierProvider<ArchiveQuizNotifier, ArchiveQuizState>(
  ArchiveQuizNotifier.new,
);

class ArchiveQuizNotifier extends AutoDisposeNotifier<ArchiveQuizState> {
  static const _quizId = 'mail_quiz1';

  final _useCase = const QuizArchiveMailUseCase();

  @override
  ArchiveQuizState build() {
    return ArchiveQuizState.initial(
      initialMails: MailCatalog.quiz1Mails(clock.now()),
    );
  }

  void startQuiz() {
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      mailApp: state.mailApp.copyWith(
        mails: MailCatalog.quiz1Mails(clock.now()),
      ),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
  }

  /// 指定IDのメールをアーカイブし、クリア判定を行う
  Future<void> archiveMail(String id) async {
    if (state.status != QuizStatus.playing) return;

    final updatedMails = state.mailApp.mails.map((m) {
      if (m.id == id) return m.copyWith(folder: MailFolder.archive);
      return m;
    }).toList();

    final isClear = _useCase.isClear(archivedMailId: id);
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;

    state = state.copyWith(
      status: isClear ? QuizStatus.correct : state.status,
      elapsedMs: isClear ? elapsed : state.elapsedMs,
      mailApp: state.mailApp.copyWith(mails: updatedMails),
    );

    if (isClear) {
      await hapticFeedback.playSuccessFeedback();
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    }
  }

  Future<void> giveUp() async {
    if (state.status != QuizStatus.playing) return;
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;
    state = state.copyWith(
      status: QuizStatus.giveUp,
      elapsedMs: elapsed,
    );
    unawaited(
      ref.read(analyticsServiceProvider).logQuizGivenUp(quizId: _quizId),
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (_) {}
  }

  void retry() {
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: _quizId);
    state = ArchiveQuizState.initial(
      initialMails: MailCatalog.quiz1Mails(clock.now()),
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
  }

  Future<void> _saveResult({
    required bool isCleared,
    required int elapsedMs,
  }) async {
    if (isCleared) {
      await ref.read(analyticsServiceProvider).logQuizCompleted(
            quizId: _quizId,
            score: state.score,
            failureCount: state.failureCount,
            clearTimeMs: elapsedMs,
          );
    }
    final repo = ref.read(mailQuizRepositoryProvider);
    await repo.saveResult(
      quizId: _quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
  }
}
