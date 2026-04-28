import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../application/quiz_sns_use_case.dart';
import '../domain/sns_quiz_config.dart';
import '../domain/sns_quiz_type.dart';
import '../infrastructure/sns_quiz_repository_provider.dart';
import 'sns_quiz_state.dart';

/// SNSクイズ Notifier の Provider（全4クイズ共通）
///
/// Family で [SnsQuizType] を受け取り、クイズごとに独立した状態を管理する。
/// ```dart
/// ref.watch(snsQuizNotifierProvider(SnsQuizType.quiz1))
/// ref.read(snsQuizNotifierProvider(SnsQuizType.quiz1).notifier).startQuiz()
/// ```
final snsQuizNotifierProvider = NotifierProvider.autoDispose
    .family<SnsQuizNotifier, SnsQuizState, SnsQuizType>(SnsQuizNotifier.new);

/// SNSクイズの状態管理 Notifier
class SnsQuizNotifier
    extends AutoDisposeFamilyNotifier<SnsQuizState, SnsQuizType> {
  static const _useCase = QuizSnsUseCase();
  Timer? _timer;

  @override
  SnsQuizState build(SnsQuizType arg) {
    ref.onDispose(() => _timer?.cancel());
    return SnsQuizState.initial(arg);
  }

  /// クイズを開始する
  void startQuiz() {
    if (state.status == QuizStatus.playing) return;
    _timer?.cancel();
    // clock.now() でテスト差し替え可能にする
    final now = clock.now();
    final initialState = SnsQuizState.initial(arg);
    state = initialState.copyWith(
      status: QuizStatus.playing,
      startedAt: now,
    );

    ref.read(analyticsServiceProvider).logQuizStarted(quizId: arg.quizId);
    _startTimer();
  }

  /// 指定投稿のいいね状態をトグルする（Quiz1のクリア条件）
  void toggleLike(String postId) {
    if (state.status != QuizStatus.playing) return;

    final index = state.posts.indexWhere((p) => p.id == postId);
    if (index == -1) return;

    final post = state.posts[index];
    // いいね済みなら何もしない（冪等ガード）
    if (post.isLiked) return;

    final newPosts = [...state.posts];
    newPosts[index] = post.copyWith(isLiked: true);
    state = state.copyWith(posts: newPosts);
    unawaited(_checkClearCondition());
  }

  /// 画像を全画面で開く
  void openFullScreenImage(String imageUrl) {
    if (state.status != QuizStatus.playing) return;
    if (state.isFullScreenImageOpened) return;
    state = state.copyWith(
      isFullScreenImageOpened: true,
      fullScreenImageUrl: imageUrl,
    );
  }

  /// 全画面画像を閉じる（Quiz3のクリア条件）
  void closeFullScreenImage() {
    if (state.status != QuizStatus.playing) return;
    if (!state.isFullScreenImageOpened) return;
    state = state.copyWith(
      isFullScreenImageOpened: false,
    );
    // Quiz3のみ閉じた瞬間にクリア
    if (arg == SnsQuizType.quiz3) {
      unawaited(_clearQuiz());
    }
  }

  /// トップへのスクロールを要求する（操作のみ）
  ///
  /// ステータスバータップまたはホームタブ再タップで呼ばれる。
  void scrollToTop() {
    if (state.status != QuizStatus.playing) return;
    if (state.scrollToTopRequested) return;
    state = state.copyWith(scrollToTopRequested: true);
  }

  /// スクロールがトップに達したことを通知する
  ///
  /// ScrollController のリスナーから、offset が 0 になった時点で呼ばれる。
  void onScrolledToTop() {
    if (state.status != QuizStatus.playing) return;
    if (!state.scrollToTopRequested) return;
    state = state.copyWith(scrollToTopRequested: false);
  }

  /// タブを切り替える
  void updateTabIndex(int index) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(currentIndex: index);
  }

  /// アカウントを切り替える
  Future<void> switchAccount(String newAccountId) async {
    if (state.status != QuizStatus.playing) return;
    if (state.currentAccount == newAccountId) return;
    state = state.copyWith(currentAccount: newAccountId);
    unawaited(_checkClearCondition());
  }

  /// 投稿テキストを更新する
  void updateComposeText(String text) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(composeText: text);
  }

  /// 投稿を実行する（Quiz2のクリア条件）
  void submitPost() {
    if (state.status != QuizStatus.playing) return;
    if (arg == SnsQuizType.quiz2 &&
        _useCase.isClearQuiz2(composeText: state.composeText)) {
      unawaited(_clearQuiz());
    }
  }

  /// 検索テキストを更新する
  void updateSearchText(String text) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(searchText: text);
    // 入力するだけでクリアするのではなく、検索ボタン押下を条件にするため、ここでは判定しない
  }

  /// 検索を実行する（Quiz4のクリア条件）
  void performSearch() {
    if (state.status != QuizStatus.playing) return;
    if (arg == SnsQuizType.quiz4 &&
        _useCase.isClearQuiz4(
          searchText: state.searchText,
          targetQuery: SnsQuizConfig.searchQuery,
        )) {
      unawaited(_clearQuiz());
    }
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
    unawaited(
      ref.read(analyticsServiceProvider).logQuizGivenUp(quizId: arg.quizId),
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (error, stackTrace) {
      appLogger.e('giveUp save failed', error: error, stackTrace: stackTrace);
    }
  }

  /// クイズをリトライする
  void retry() {
    if (state.status == QuizStatus.playing) return;
    _timer?.cancel();
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: arg.quizId);
    state = SnsQuizState.initial(arg);
  }

  // ---- Private helpers ----

  int get _elapsed => state.startedAt != null
      ? clock.now().difference(state.startedAt!).inMilliseconds
      : 0;

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.status != QuizStatus.playing) return;
      final remaining = state.remainingSeconds - 1;
      if (remaining <= 0) {
        _timer?.cancel();
        unawaited(_onTimeUp());
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
    unawaited(
      ref.read(analyticsServiceProvider).logQuizTimeUp(quizId: arg.quizId),
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (error, stackTrace) {
      appLogger.e('timeUp save failed', error: error, stackTrace: stackTrace);
    }
  }

  Future<void> _checkClearCondition() async {
    if (state.status != QuizStatus.playing) return;

    final isClear = switch (arg) {
      SnsQuizType.quiz1 => _useCase.isClearQuiz1(
        posts: state.posts,
        catPostId: SnsQuizConfig.catPostId,
      ),
      SnsQuizType.quiz2 =>
        // Quiz2のクリア判定は submitPost() から直接 _clearQuiz() を呼ぶ
        false,
      SnsQuizType.quiz3 =>
        // Quiz3のクリア判定は closeFullScreenImage() から直接 _clearQuiz() を呼ぶ
        false,
      SnsQuizType.quiz4 =>
        // Quiz4のクリア判定は performSearch() から直接 _clearQuiz() を呼ぶ
        false,
    };
    if (!isClear) return;
    await _clearQuiz();
  }

  Future<void> _clearQuiz() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();
    final elapsed = _elapsed;
    state = state.copyWith(
      status: QuizStatus.correct,
      elapsedMs: elapsed,
    );
    // haptic は ref を使わないため await 前に呼び出し可能
    hapticFeedback.playSuccessFeedback();
    try {
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } catch (error, stackTrace) {
      appLogger.e(
        'clearQuiz save failed',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _saveResult({
    required bool isCleared,
    required int elapsedMs,
  }) async {
    // autoDispose Provider のため、await をまたいで ref.read を使う前に
    // 必要な参照を変数に取り出しておく（dispose 後のアクセスを防ぐ）
    final analyticsService = ref.read(analyticsServiceProvider);
    final repo = ref.read(snsQuizRepositoryProvider);
    // await をまたぐ前に state の値をスナップショットする
    final score = state.score;
    final failureCount = state.failureCount;

    if (isCleared) {
      await analyticsService.logQuizCompleted(
        quizId: arg.quizId,
        score: score,
        failureCount: failureCount,
        clearTimeMs: elapsedMs,
      );
    }
    await repo.saveResult(
      quizId: arg.quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? score : 0,
      failureCount: failureCount,
    );
  }
}
