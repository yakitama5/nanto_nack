import 'package:quiz_core/quiz_core.dart';

import 'manga_app_state.dart';

/// コミッククイズの状態
class ComicQuizState extends QuizStateBase {
  const ComicQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.remainingSeconds,
    required this.hintUsed,
    required this.mangaApp,
  });

  factory ComicQuizState.initial({
    required int timeLimitSeconds,
    required int initialPageIndex,
  }) =>
      ComicQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        remainingSeconds: timeLimitSeconds,
        hintUsed: false,
        mangaApp: MangaAppState.initial(initialPageIndex: initialPageIndex),
      );

  /// 残り時間（秒）
  final int remainingSeconds;

  /// ヒントを使用済みかどうか
  final bool hintUsed;

  /// 漫画ビューアのUI状態
  final MangaAppState mangaApp;

  ComicQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    int? remainingSeconds,
    bool? hintUsed,
    MangaAppState? mangaApp,
  }) =>
      ComicQuizState(
        status: status ?? this.status,
        failureCount: failureCount ?? this.failureCount,
        elapsedMs: elapsedMs ?? this.elapsedMs,
        startedAt: startedAt ?? this.startedAt,
        remainingSeconds: remainingSeconds ?? this.remainingSeconds,
        hintUsed: hintUsed ?? this.hintUsed,
        mangaApp: mangaApp ?? this.mangaApp,
      );
}
