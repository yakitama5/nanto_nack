import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mail/src/application/quiz_empty_trash_use_case.dart';
import 'package:mail/src/domain/entities/mail_folder.dart';
import 'package:mail/src/domain/mail_catalog.dart';
import 'package:mail/src/infrastructure/mail_quiz_repository_provider.dart';
import 'package:mail/src/presentation/quiz2_empty_trash/empty_trash_quiz_state.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

final emptyTrashQuizProvider =
    AutoDisposeNotifierProvider<EmptyTrashQuizNotifier, EmptyTrashQuizState>(
  EmptyTrashQuizNotifier.new,
);

class EmptyTrashQuizNotifier extends AutoDisposeNotifier<EmptyTrashQuizState> {
  static const _quizId = 'mail_quiz2';

  final _useCase = const QuizEmptyTrashUseCase();

  @override
  EmptyTrashQuizState build() {
    return EmptyTrashQuizState.initial(
      initialMails: MailCatalog.quiz2Mails(clock.now()),
    );
  }

  void startQuiz() {
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      mailApp: state.mailApp.copyWith(
        mails: MailCatalog.quiz2Mails(clock.now()),
      ),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
  }

  /// フォルダを切り替える
  void changeFolder(MailFolder folder) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      mailApp: state.mailApp.copyWith(currentFolder: folder),
    );
  }

  /// ゴミ箱を空にしてクリア判定を行う
  Future<void> emptyTrash() async {
    if (state.status != QuizStatus.playing) return;

    final updatedMails =
        state.mailApp.mails.where((m) => m.folder != MailFolder.trash).toList();

    final isClear = _useCase.isClear(mails: updatedMails);
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
    state = EmptyTrashQuizState.initial(
      initialMails: MailCatalog.quiz2Mails(clock.now()),
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
