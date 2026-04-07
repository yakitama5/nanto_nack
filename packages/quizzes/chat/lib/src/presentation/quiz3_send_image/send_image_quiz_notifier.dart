import 'dart:async';

import 'package:chat/src/application/quiz_send_image_use_case.dart';
import 'package:chat/src/domain/chat_catalog.dart';
import 'package:chat/src/domain/chat_tab.dart';
import 'package:chat/src/domain/entities/chat_message.dart';
import 'package:chat/src/infrastructure/chat_quiz_repository_provider.dart';
import 'package:chat/src/presentation/quiz3_send_image/send_image_quiz_state.dart';
import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

final sendImageQuizProvider =
    AutoDisposeNotifierProvider<SendImageQuizNotifier, SendImageQuizState>(
  SendImageQuizNotifier.new,
);

class SendImageQuizNotifier extends AutoDisposeNotifier<SendImageQuizState> {
  static const _quizId = 'chat_quiz3';
  static const _timeLimitSeconds = 60;

  final _useCase = const QuizSendImageUseCase();
  Timer? _timer;

  @override
  SendImageQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return SendImageQuizState.initial(
      initialMessages: ChatCatalog.quiz3InitialMessages(clock.now()),
      timeLimitSeconds: _timeLimitSeconds,
    );
  }

  void startQuiz() {
    _timer?.cancel();
    state = state.copyWith(
      status: QuizStatus.playing,
      currentTab: ChatTab.home,
      isInChatRoom: false,
      messages: ChatCatalog.quiz3InitialMessages(clock.now()),
      remainingSeconds: _timeLimitSeconds,
      isImagePickerOpen: false,
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    // タイマーは MissionCutIn 終了後に startTimer() を呼んで開始する
  }

  /// MissionCutIn 演出が終わったあとに呼ぶ。ここからカウントダウンを開始する。
  void startTimer() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(startedAt: clock.now());
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
    state = state.copyWith(isInChatRoom: true);
  }

  /// 画像ピッカーの開閉切り替え
  void toggleImagePicker() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(isImagePickerOpen: !state.isImagePickerOpen);
  }

  /// 画像を送信（isImage=true のメッセージを追加）
  Future<void> sendImage(String? imagePath) async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();

    final newMessage = ChatMessage(
      id: 'image_${clock.now().millisecondsSinceEpoch}',
      text: '',
      isMine: true,
      sentAt: clock.now(),
      isImage: true,
      imagePath: imagePath,
    );
    final newMessages = [...state.messages, newMessage];
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;

    final isClear = _useCase.isClear(messages: newMessages);
    state = state.copyWith(
      messages: newMessages,
      isImagePickerOpen: false,
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
    state = SendImageQuizState.initial(
      initialMessages: ChatCatalog.quiz3InitialMessages(clock.now()),
      timeLimitSeconds: _timeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
    );
    // タイマーは MissionCutIn 終了後に startTimer() を呼んで開始する
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
