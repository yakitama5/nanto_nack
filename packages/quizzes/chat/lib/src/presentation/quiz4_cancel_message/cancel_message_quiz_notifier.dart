import 'dart:async';

import 'package:chat/src/application/quiz_cancel_message_use_case.dart';
import 'package:chat/src/domain/chat_catalog.dart';
import 'package:chat/src/domain/chat_quiz_config.dart';
import 'package:chat/src/domain/chat_tab.dart';
import 'package:chat/src/infrastructure/chat_quiz_repository_provider.dart';
import 'package:chat/src/presentation/quiz4_cancel_message/cancel_message_quiz_state.dart';
import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

final cancelMessageQuizProvider = AutoDisposeNotifierProvider<
    CancelMessageQuizNotifier, CancelMessageQuizState>(
  CancelMessageQuizNotifier.new,
);

class CancelMessageQuizNotifier
    extends AutoDisposeNotifier<CancelMessageQuizState> {
  static const _quizId = 'chat_quiz4';

  final _useCase = const QuizCancelMessageUseCase();
  Timer? _timer;

  @override
  CancelMessageQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return CancelMessageQuizState.initial(
      initialMessages: ChatCatalog.quiz4InitialMessages(clock.now()),
    );
  }

  void startQuiz() {
    if (state.status != QuizStatus.idle) return;
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      currentTab: ChatTab.home,
      isInChatRoom: false,
      messages: ChatCatalog.quiz4InitialMessages(clock.now()),
      remainingSeconds: ChatQuizConfig.quiz4CancelMessageTimeLimitSeconds,
      messageCancelled: false,
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  /// タブ切り替え
  void switchTab(ChatTab tab) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(currentTab: tab);
  }

  /// コンタクトをタップしてチャットルームへ
  void openChatRoom() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(isInChatRoom: true, isCorrectChatRoom: true);
  }

  /// 間違ったコンタクトをタップしてチャットルームへ遷移する（不正解判定なし）
  /// アクションを実行したタイミングで不正解になる
  void openWrongChatRoom() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(isInChatRoom: true, isCorrectChatRoom: false);
  }

  /// チャットルームからチャットリストへ戻る
  void closeChatRoom() {
    state = state.copyWith(isInChatRoom: false, isCorrectChatRoom: true);
  }

  /// メッセージを取り消す（isDeleted=true にする）
  /// 間違ったルームで実行した場合は不正解になる
  Future<void> cancelMessage(String messageId) async {
    if (state.status != QuizStatus.playing) return;
    // 間違ったコンタクトのルームでアクションを実行した場合は不正解
    if (!state.isCorrectChatRoom) {
      await _markIncorrect();
      return;
    }
    _timer?.cancel();

    final newMessages = state.messages
        .map((m) => m.id == messageId ? m.copyWith(isDeleted: true) : m)
        .toList();
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;

    final isClear = _useCase.isClear(messageCancelled: true);
    state = state.copyWith(
      messages: newMessages,
      messageCancelled: true,
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
    state = CancelMessageQuizState.initial(
      initialMessages: ChatCatalog.quiz4InitialMessages(clock.now()),
    );
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

  /// 間違ったルームでアクションを実行したときの不正解処理
  /// タイマーを止め、不正解状態にしてリザルトを保存する
  Future<void> _markIncorrect() async {
    _timer?.cancel();
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;
    state = state.copyWith(
      status: QuizStatus.incorrect,
      failureCount: state.failureCount + 1,
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
