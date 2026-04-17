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
    required this.currentIndex,
    required this.composeText,
    required this.searchText,
  });

  /// copyWith で nullable フィールドを明示的に null にするための番兵値
  static const Object _sentinel = Object();

  /// 初期状態を生成する
  factory SnsQuizState.initial(SnsQuizType quizType) {
    final posts = SnsCatalog.initialPostsFor(quizType);
    // 最初は全画面画像は閉じた状態で始まる
    const isFullScreen = false;
    const String? fullScreenUrl = null;

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
      currentIndex: 0,
      composeText: '',
      searchText: '',
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

  /// トップへのスクロールが要求されているかどうか（旧Quiz3用、操作としては残すがクリア条件ではない）
  final bool scrollToTopRequested;

  /// 現在選択中のタブインデックス
  final int currentIndex;

  /// 投稿画面の入力テキスト
  final String composeText;

  /// 検索バーの入力テキスト
  final String searchText;

  /// 指定フィールドを差し替えた新インスタンスを返す
  ///
  /// nullable フィールド (fullScreenImageUrl, startedAt) を明示的に null にするには、
  /// 番兵値 _sentinel を使用する。
  SnsQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    Object? startedAt = _sentinel,
    List<SnsPost>? posts,
    String? currentAccount,
    bool? isFullScreenImageOpened,
    Object? fullScreenImageUrl = _sentinel,
    int? remainingSeconds,
    bool? scrollToTopRequested,
    int? currentIndex,
    String? composeText,
    String? searchText,
  }) {
    return SnsQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: identical(startedAt, _sentinel)
          ? this.startedAt
          : startedAt as DateTime?,
      posts: posts != null ? List.unmodifiable(posts) : this.posts,
      currentAccount: currentAccount ?? this.currentAccount,
      isFullScreenImageOpened:
          isFullScreenImageOpened ?? this.isFullScreenImageOpened,
      fullScreenImageUrl: identical(fullScreenImageUrl, _sentinel)
          ? this.fullScreenImageUrl
          : fullScreenImageUrl as String?,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      scrollToTopRequested: scrollToTopRequested ?? this.scrollToTopRequested,
      currentIndex: currentIndex ?? this.currentIndex,
      composeText: composeText ?? this.composeText,
      searchText: searchText ?? this.searchText,
    );
  }
}