import 'dart:async';

import 'package:chat/src/application/quiz_send_reaction_use_case.dart';
import 'package:chat/src/domain/chat_catalog.dart';
import 'package:chat/src/domain/chat_quiz_config.dart';
import 'package:chat/src/domain/chat_tab.dart';
import 'package:chat/src/domain/entities/chat_message.dart';
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

  final _useCase = const QuizSendReactionUseCase();
  Timer? _timer;

  @override
  ReactionQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return ReactionQuizState.initial(
      initialMessages: ChatCatalog.quiz2InitialMessages(clock.now()),
    );
  }

  void startQuiz() {
    if (state.status != QuizStatus.idle) return;
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      currentTab: ChatTab.home,
      isInChatRoom: false,
      messages: ChatCatalog.quiz2InitialMessages(clock.now()),
      remainingSeconds: ChatQuizConfig.quiz2ReactionTimeLimitSeconds,
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
    state = state.copyWith(isInChatRoom: true, isCorrectChatRoom: true);
  }

  /// チャットルームからチャットリストへ戻る
  /// バックボタン・バックアローを押したときに呼び出される
  void closeChatRoom() {
    state = state.copyWith(
      isInChatRoom: false,
      reactionPickerMessageId: null,
      isCorrectChatRoom: true,
    );
  }

  /// テキストメッセージを送信（リアクションクイズのクリア判定には影響しない）
  /// UI の一貫性のためにメッセージリストへ追加する
  /// 間違ったルームで送信した場合は不正解になる
  Future<void> sendTextMessage(String text) async {
    if (state.status != QuizStatus.playing) return;
    if (text.trim().isEmpty) return;
    // 間違ったコンタクトのルームでアクションを実行した場合は不正解
    if (!state.isCorrectChatRoom) {
      await _markIncorrect();
      return;
    }
    final newMessage = ChatMessage(
      id: 'text_${clock.now().millisecondsSinceEpoch}',
      text: text,
      isMine: true,
      sentAt: clock.now(),
    );
    state = state.copyWith(messages: [...state.messages, newMessage]);
  }

  /// スタンプメッセージを送信（クイズ判定に影響しない、UIの一貫性のため）
  /// 間違ったルームで送信した場合は不正解になる
  Future<void> sendStampAsMessage(String stampId) async {
    if (state.status != QuizStatus.playing) return;
    // 間違ったコンタクトのルームでアクションを実行した場合は不正解
    if (!state.isCorrectChatRoom) {
      await _markIncorrect();
      return;
    }
    final newMessage = ChatMessage(
      id: 'stamp_${clock.now().millisecondsSinceEpoch}',
      text: stampId,
      isMine: true,
      sentAt: clock.now(),
      isStamp: true,
      stampId: stampId,
    );
    state = state.copyWith(messages: [...state.messages, newMessage]);
  }

  /// 画像メッセージを送信（クイズ判定に影響しない）
  /// 間違ったルームで送信した場合は不正解になる
  Future<void> sendImageAsMessage(String? imagePath) async {
    if (state.status != QuizStatus.playing) return;
    if (imagePath == null) return;
    // 間違ったコンタクトのルームでアクションを実行した場合は不正解
    if (!state.isCorrectChatRoom) {
      await _markIncorrect();
      return;
    }
    final newMessage = ChatMessage(
      id: 'image_${clock.now().millisecondsSinceEpoch}',
      text: '',
      isMine: true,
      sentAt: clock.now(),
      isImage: true,
      imagePath: imagePath,
    );
    state = state.copyWith(messages: [...state.messages, newMessage]);
  }

  /// 間違ったコンタクトをタップしてチャットルームへ遷移する（不正解判定なし）
  /// アクションを実行したタイミングで不正解になる
  void openWrongChatRoom() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(isInChatRoom: true, isCorrectChatRoom: false);
  }

  void openReactionPicker(String messageId) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(reactionPickerMessageId: messageId);
  }

  void closeReactionPicker() {
    state = state.copyWith(reactionPickerMessageId: null);
  }

  /// リアクション送信（対象メッセージに reaction をセット）
  /// 間違ったルームでリアクションを送信した場合は不正解になる
  Future<void> sendReaction(String reaction, String messageId) async {
    if (state.status != QuizStatus.playing) return;
    // 間違ったコンタクトのルームでアクションを実行した場合は不正解
    if (!state.isCorrectChatRoom) {
      await _markIncorrect();
      return;
    }
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
