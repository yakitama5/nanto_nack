import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mail/src/application/quiz_select_delete_use_case.dart';
import 'package:mail/src/domain/entities/mail_folder.dart';
import 'package:mail/src/domain/mail_catalog.dart';
import 'package:mail/src/infrastructure/mail_quiz_repository_provider.dart';
import 'package:mail/src/presentation/quiz3_select_delete/select_delete_quiz_state.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

final selectDeleteQuizProvider = AutoDisposeNotifierProvider<
    SelectDeleteQuizNotifier, SelectDeleteQuizState>(
  SelectDeleteQuizNotifier.new,
);

class SelectDeleteQuizNotifier
    extends AutoDisposeNotifier<SelectDeleteQuizState> {
  static const _quizId = 'mail_quiz3';

  final _useCase = const QuizSelectDeleteUseCase();

  @override
  SelectDeleteQuizState build() {
    return SelectDeleteQuizState.initial(
      initialMails: MailCatalog.quiz3Mails(clock.now()),
    );
  }

  void startQuiz() {
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      mailApp: state.mailApp.copyWith(
        mails: MailCatalog.quiz3Mails(clock.now()),
        selectedMailIds: {},
      ),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
  }

  /// 長押し・タップでメールの選択/選択解除を切り替える
  void toggleSelection(String id) {
    if (state.status != QuizStatus.playing) return;
    final current = Set<String>.from(state.mailApp.selectedMailIds);
    if (current.contains(id)) {
      current.remove(id);
    } else {
      current.add(id);
    }
    state = state.copyWith(
      mailApp: state.mailApp.copyWith(selectedMailIds: current),
    );
  }

  /// 選択モードを解除する
  void clearSelection() {
    state = state.copyWith(
      mailApp: state.mailApp.copyWith(selectedMailIds: {}),
    );
  }

  /// 選択されたメールをゴミ箱へ移動し、クリア判定を行う
  Future<void> moveToTrash() async {
    if (state.status != QuizStatus.playing) return;
    final selectedCount = state.mailApp.selectedMailIds.length;
    final isClear = _useCase.isClear(selectedCount: selectedCount);

    final selectedIds = Set<String>.from(state.mailApp.selectedMailIds);
    final updatedMails = state.mailApp.mails.map((m) {
      if (selectedIds.contains(m.id)) {
        return m.copyWith(folder: MailFolder.trash);
      }
      return m;
    }).toList();

    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;

    state = state.copyWith(
      status: isClear ? QuizStatus.correct : state.status,
      elapsedMs: isClear ? elapsed : state.elapsedMs,
      mailApp: state.mailApp.copyWith(
        mails: updatedMails,
        selectedMailIds: {},
      ),
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
    state = SelectDeleteQuizState.initial(
      initialMails: MailCatalog.quiz3Mails(clock.now()),
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
