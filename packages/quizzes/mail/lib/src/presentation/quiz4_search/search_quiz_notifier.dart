import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mail/src/application/quiz_search_use_case.dart';
import 'package:mail/src/domain/mail_catalog.dart';
import 'package:mail/src/infrastructure/mail_quiz_repository_provider.dart';
import 'package:mail/src/presentation/quiz4_search/search_quiz_state.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

final searchQuizProvider =
    AutoDisposeNotifierProvider<SearchQuizNotifier, SearchQuizState>(
  SearchQuizNotifier.new,
);

class SearchQuizNotifier extends AutoDisposeNotifier<SearchQuizState> {
  static const _quizId = 'mail_quiz4';

  final _useCase = const QuizSearchUseCase();

  @override
  SearchQuizState build() {
    return SearchQuizState.initial(
      initialMails: MailCatalog.quiz4Mails(clock.now()),
    );
  }

  void startQuiz() {
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      mailApp: state.mailApp.copyWith(
        mails: MailCatalog.quiz4Mails(clock.now()),
        searchQuery: '',
      ),
      isSearching: false,
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
  }

  /// 検索バーをタップして入力モードへ移行する
  void openSearch() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(isSearching: true);
  }

  /// 検索クエリを更新する
  void updateQuery(String query) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      mailApp: state.mailApp.copyWith(searchQuery: query),
    );
  }

  /// 検索を実行してクリア判定を行う
  Future<void> submitSearch() async {
    if (state.status != QuizStatus.playing) return;
    final query = state.mailApp.searchQuery.trim();

    final isClear = _useCase.isClear(query: query);
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;

    state = state.copyWith(
      status: isClear ? QuizStatus.correct : state.status,
      elapsedMs: isClear ? elapsed : state.elapsedMs,
    );

    if (isClear) {
      await hapticFeedback.playSuccessFeedback();
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    }
  }

  /// 検索をキャンセルする
  void cancelSearch() {
    state = state.copyWith(
      isSearching: false,
      mailApp: state.mailApp.copyWith(searchQuery: ''),
    );
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
    state = SearchQuizState.initial(
      initialMails: MailCatalog.quiz4Mails(clock.now()),
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
