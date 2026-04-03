import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../application/quiz_show_qr_use_case.dart';
import '../../infrastructure/payment_quiz_repository_provider.dart';
import 'show_qr_quiz_state.dart';

final showQrQuizProvider =
    AutoDisposeNotifierProvider<ShowQrQuizNotifier, ShowQrQuizState>(
  ShowQrQuizNotifier.new,
);

/// Quiz 1「QRコードを表示する」のNotifier
class ShowQrQuizNotifier extends AutoDisposeNotifier<ShowQrQuizState> {
  static const _quizId = 'payment_quiz1';
  static const _timeLimitSeconds = 30;

  final _useCase = const QuizShowQrUseCase();
  Timer? _timer;

  @override
  ShowQrQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return ShowQrQuizState.initial(timeLimitSeconds: _timeLimitSeconds);
  }

  /// クイズを開始する
  void startQuiz() {
    _timer?.cancel();
    state = ShowQrQuizState.initial(timeLimitSeconds: _timeLimitSeconds)
        .copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    _startTimer();
  }

  /// QRコードボタンをタップ
  Future<void> tapQr() async {
    if (state.status != QuizStatus.playing) return;

    state = state.copyWith(qrShown: true);

    final isClear = _useCase.isClear(qrShown: true);
    if (isClear) {
      _timer?.cancel();
      final elapsed = _elapsed;
      state = state.copyWith(
        status: QuizStatus.correct,
        elapsedMs: elapsed,
      );
      await hapticFeedback.playSuccessFeedback();
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    }
  }

  /// QR画面を閉じる（ホームに戻る）
  void closeQr() {
    state = state.copyWith(qrShown: false);
  }

  /// 諦めてクイズを終了する
  Future<void> giveUp() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();
    final elapsed = _elapsed;
    state = state.copyWith(
      status: QuizStatus.giveUp,
      remainingSeconds: 0,
      elapsedMs: elapsed,
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } on Exception catch (_) {}
  }

  /// クイズをリトライする
  void retry() {
    _timer?.cancel();
    state = ShowQrQuizState.initial(timeLimitSeconds: _timeLimitSeconds)
        .copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    _startTimer();
  }

  int get _elapsed => state.startedAt != null
      ? clock.now().difference(state.startedAt!).inMilliseconds
      : 0;

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
    final elapsed = _elapsed;
    state = state.copyWith(
      status: QuizStatus.timeUp,
      remainingSeconds: 0,
      elapsedMs: elapsed,
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } on Exception catch (_) {}
  }

  Future<void> _saveResult({
    required bool isCleared,
    required int elapsedMs,
  }) async {
    final repo = ref.read(paymentQuizRepositoryProvider);
    await repo.saveResult(
      quizId: _quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
  }
}
