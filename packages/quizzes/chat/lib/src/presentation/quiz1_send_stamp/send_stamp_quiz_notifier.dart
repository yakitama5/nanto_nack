import 'dart:async';

import 'package:chat/src/application/quiz_send_stamp_use_case.dart';
import 'package:chat/src/domain/chat_catalog.dart';
import 'package:chat/src/domain/chat_tab.dart';
import 'package:chat/src/domain/entities/chat_message.dart';
import 'package:chat/src/infrastructure/chat_quiz_repository_provider.dart';
import 'package:chat/src/presentation/quiz1_send_stamp/send_stamp_quiz_state.dart';
import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

final sendStampQuizProvider =
    AutoDisposeNotifierProvider<SendStampQuizNotifier, SendStampQuizState>(
  SendStampQuizNotifier.new,
);

class SendStampQuizNotifier extends AutoDisposeNotifier<SendStampQuizState> {
  static const _quizId = 'chat_quiz1';
  static const _timeLimitSeconds = 30;

  final _useCase = const QuizSendStampUseCase();
  Timer? _timer;

  @override
  SendStampQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return SendStampQuizState.initial(
      initialMessages: ChatCatalog.quiz1InitialMessages(clock.now()),
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
      messages: ChatCatalog.quiz1InitialMessages(clock.now()),
      remainingSeconds: _timeLimitSeconds,
      isStampPanelOpen: false,
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

  /// チャットルームからチャットリストへ戻る
  /// ユーザーがバックボタンやバックアローを押した際に呼び出される
  void closeChatRoom() {
    state = state.copyWith(
      isInChatRoom: false,
      isStampPanelOpen: false,
      isCorrectChatRoom: true,
    );
  }

  /// テキストメッセージを送信（スタンプクイズのクリア判定には影響しない）
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

  /// 画像メッセージを送信（クイズ判定に影響しない、UIの一貫性のため）
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

  /// スタンプパネルの開閉切り替え
  void toggleStampPanel() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(isStampPanelOpen: !state.isStampPanelOpen);
  }

  /// スタンプ送信
  /// 間違ったルームで送信した場合は不正解になる
  Future<void> sendStamp(String stampId) async {
    if (state.status != QuizStatus.playing) return;
    // 間違ったコンタクトのルームでアクションを実行した場合は不正解
    if (!state.isCorrectChatRoom) {
      await _markIncorrect();
      return;
    }
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
    state = SendStampQuizState.initial(
      initialMessages: ChatCatalog.quiz1InitialMessages(clock.now()),
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
