import 'dart:async';

import 'package:chat/src/application/quiz_delete_message_use_case.dart';
import 'package:chat/src/domain/chat_catalog.dart';
import 'package:chat/src/infrastructure/chat_quiz_repository_provider.dart';
import 'package:chat/src/presentation/quiz3_delete_message/delete_message_quiz_state.dart';
import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

final deleteMessageQuizProvider = AutoDisposeNotifierProvider<
    DeleteMessageQuizNotifier, DeleteMessageQuizState>(
  DeleteMessageQuizNotifier.new,
);

class DeleteMessageQuizNotifier
    extends AutoDisposeNotifier<DeleteMessageQuizState> {
  static const _quizId = 'chat_quiz3';
  static const _timeLimitSeconds = 90;

  final _useCase = const QuizDeleteMessageUseCase();
  Timer? _timer;

  @override
  DeleteMessageQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return DeleteMessageQuizState.initial(
      initialMessages: ChatCatalog.quiz3InitialMessages(clock.now()),
      timeLimitSeconds: _timeLimitSeconds,
    );
  }

  void startQuiz() {
    _timer?.cancel();
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      messages: ChatCatalog.quiz3InitialMessages(clock.now()),
      remainingSeconds: _timeLimitSeconds,
      messageDeleted: false,
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  Future<void> deleteMessage(String messageId) async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();

    final newMessages = state.messages
        .map((m) => m.id == messageId ? m.copyWith(isDeleted: true) : m)
        .toList();
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;

    final isClear = _useCase.isClear(messageDeleted: true);
    state = state.copyWith(
      messages: newMessages,
      messageDeleted: true,
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
    state = DeleteMessageQuizState.initial(
      initialMessages: ChatCatalog.quiz3InitialMessages(clock.now()),
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
