import 'dart:async';

import 'package:chat/src/application/quiz_send_reaction_use_case.dart';
import 'package:chat/src/domain/chat_catalog.dart';
import 'package:chat/src/domain/chat_tab.dart';
import 'package:chat/src/infrastructure/chat_quiz_repository_provider.dart';
import 'package:chat/src/presentation/quiz2_reaction/reaction_quiz_state.dart';
import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

final reactionQuizProvider =
    AutoDisposeNotifierProvider<ReactionQuizNotifier, ReactionQuizState>(
  ReactionQuizNotifier.new,
);

class ReactionQuizNotifier extends AutoDisposeNotifier<ReactionQuizState> {
  static const _quizId = 'chat_quiz2';
  static const _timeLimitSeconds = 45;

  final _useCase = const QuizSendReactionUseCase();
  Timer? _timer;

  @override
  ReactionQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return ReactionQuizState.initial(
      initialMessages: ChatCatalog.quiz2InitialMessages(clock.now()),
      timeLimitSeconds: _timeLimitSeconds,
    );
  }

  void startQuiz() {
    _timer?.cancel();
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      currentTab: ChatTab.home,
      isInChatRoom: false,
      messages: ChatCatalog.quiz2InitialMessages(clock.now()),
      remainingSeconds: _timeLimitSeconds,
      reactionPickerMessageId: null,
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  void switchTab(ChatTab tab) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(currentTab: tab);
  }

  void openChatRoom() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(isInChatRoom: true);
  }

  void openReactionPicker(String messageId) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(reactionPickerMessageId: messageId);
  }

  void closeReactionPicker() {
    state = state.copyWith(reactionPickerMessageId: null);
  }

  /// リアクション送信（対象メッセージに reaction をセット）
  Future<void> sendReaction(String reaction, String messageId) async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();

    final newMessages = state.messages
        .map(
          (m) => m.id == messageId ? m.copyWith(reaction: reaction) : m,
        )
        .toList();
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;

    final isClear = _useCase.isClear(messages: newMessages);
    state = state.copyWith(
      messages: newMessages,
      reactionPickerMessageId: null,
      status: isClear ? QuizStatus.correct : state.status,
      elapsedMs: isClear ? elapsed : state.elapsedMs,
    );

    if (isClear) {
      await hapticFeedback.playSuccessFeedback();
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } else {
      _startTimer();
    }
  }

  Future<void> giveUp() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;
    state = state.copyWith(
      status: QuizStatus.giveUp,
      remainingSeconds: 0,
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
    _timer?.cancel();
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: _quizId);
    state = ReactionQuizState.initial(
      initialMessages: ChatCatalog.quiz2InitialMessages(clock.now()),
      timeLimitSeconds: _timeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final remaining = state.remainingSeconds - 1;
      if (remaining <= 0) {
        _timer?.cancel();
        _onTimeUp();
      } else {
        state = state.copyWith(remainingSeconds: remaining);
      }
    });
  }

  Future<void> _onTimeUp() async {
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;
    state = state.copyWith(
      status: QuizStatus.timeUp,
      remainingSeconds: 0,
      elapsedMs: elapsed,
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (_) {}
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
    final repo = ref.read(chatQuizRepositoryProvider);
    await repo.saveResult(
      quizId: _quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
  }
}
