import 'package:flutter/foundation.dart';
import 'package:quiz_core/quiz_core.dart';

import '../domain/entities/sns_post.dart';
import '../domain/sns_catalog.dart';
import '../domain/sns_quiz_config.dart';
import 'sns_quiz_type.dart';

/// SNSクイズの状態（全4クイズ共通）
@immutable
class SnsQuizState extends QuizStateBase {
  /// コンストラクタ
  const SnsQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.posts,
    required this.currentAccount,
    required this.isFullScreenImageOpened,
    this.fullScreenImageUrl,
    required this.remainingSeconds,
    required this.scrollToTopRequested,
  });

  /// 初期状態を生成する
  factory SnsQuizState.initial(SnsQuizType quizType) {
    final posts = SnsCatalog.initialPostsFor(quizType);
    // Quiz2のみ最初から全画面画像が開いた状態で始まる
    final isFullScreen = quizType == SnsQuizType.quiz2;
    final fullScreenUrl = isFullScreen ? SnsQuizConfig.catPostId : null;

    return SnsQuizState(
      status: QuizStatus.idle,
      failureCount: 0,
      elapsedMs: 0,
      startedAt: null,
      posts: List.unmodifiable(posts),
      currentAccount: SnsQuizConfig.mainAccountId,
      isFullScreenImageOpened: isFullScreen,
      fullScreenImageUrl: fullScreenUrl,
      remainingSeconds: SnsQuizConfig.timeLimitSecondsFor(quizType),
      scrollToTopRequested: false,
    );
  }

  /// タイムラインの投稿リスト
  final List<SnsPost> posts;

  /// 現在ログイン中のアカウントID
  final String currentAccount;

  /// 全画面画像表示中かどうか
  final bool isFullScreenImageOpened;

  /// 全画面表示中の画像URL（識別子）
  final String? fullScreenImageUrl;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// トップへのスクロールが要求されているかどうか（Quiz3用）
  final bool scrollToTopRequested;

  /// 指定フィールドを差し替えた新インスタンスを返す
  SnsQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    List<SnsPost>? posts,
    String? currentAccount,
    bool? isFullScreenImageOpened,
    String? fullScreenImageUrl,
    int? remainingSeconds,
    bool? scrollToTopRequested,
  }) {
    return SnsQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      posts: posts != null ? List.unmodifiable(posts) : this.posts,
      currentAccount: currentAccount ?? this.currentAccount,
      isFullScreenImageOpened:
          isFullScreenImageOpened ?? this.isFullScreenImageOpened,
      fullScreenImageUrl: fullScreenImageUrl ?? this.fullScreenImageUrl,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      scrollToTopRequested: scrollToTopRequested ?? this.scrollToTopRequested,
    );
  }
}
