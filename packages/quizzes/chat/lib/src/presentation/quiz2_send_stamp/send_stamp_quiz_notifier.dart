import 'dart:async';

import 'package:chat/src/application/quiz_send_stamp_use_case.dart';
import 'package:chat/src/domain/chat_catalog.dart';
import 'package:chat/src/domain/entities/chat_message.dart';
import 'package:chat/src/infrastructure/chat_quiz_repository_provider.dart';
import 'package:chat/src/presentation/quiz2_send_stamp/send_stamp_quiz_state.dart';
import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

final sendStampQuizProvider =
    AutoDisposeNotifierProvider<SendStampQuizNotifier, SendStampQuizState>(
  SendStampQuizNotifier.new,
);

class SendStampQuizNotifier extends AutoDisposeNotifier<SendStampQuizState> {
  static const _quizId = 'chat_quiz2';
  static const _timeLimitSeconds = 60;

  final _useCase = const QuizSendStampUseCase();
  Timer? _timer;

  @override
  SendStampQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return SendStampQuizState.initial(
      initialMessages: ChatCatalog.quiz2InitialMessages(clock.now()),
      timeLimitSeconds: _timeLimitSeconds,
    );
  }

  void startQuiz() {
    _timer?.cancel();
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      messages: ChatCatalog.quiz2InitialMessages(clock.now()),
      remainingSeconds: _timeLimitSeconds,
      isStampPanelOpen: false,
    );
    _startTimer();
  }

  void toggleStampPanel() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(isStampPanelOpen: !state.isStampPanelOpen);
  }

  void closeStampPanel() {
    state = state.copyWith(isStampPanelOpen: false);
  }

  Future<void> sendStamp(String stampId) async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();

    final newMessage = ChatMessage(
      id: 'stamp_${clock.now().millisecondsSinceEpoch}',
      text: stampId,
      isMine: true,
      sentAt: clock.now(),
      isStamp: true,
      stampId: stampId,
    );
    final newMessages = [...state.messages, newMessage];
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;

    final isClear = _useCase.isClear(messages: newMessages);
    state = state.copyWith(
      messages: newMessages,
      isStampPanelOpen: false,
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
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (_) {}
  }

  void retry() {
    _timer?.cancel();
    state = SendStampQuizState.initial(
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
