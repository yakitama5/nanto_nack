import 'package:quiz_core/quiz_core.dart';

import 'manga_app_state.dart';

/// コミッククイズの状態
///
/// ヒント機能はないため [hintUsed] フィールドは持たない。
class ComicQuizState extends QuizStateBase {
  const ComicQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.remainingSeconds,
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
        mangaApp: MangaAppState.initial(initialPageIndex: initialPageIndex),
      );

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 漫画ビューアのUI状態
  final MangaAppState mangaApp;

  ComicQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    int? remainingSeconds,
    MangaAppState? mangaApp,
  }) =>
      ComicQuizState(
        status: status ?? this.status,
        failureCount: failureCount ?? this.failureCount,
        elapsedMs: elapsedMs ?? this.elapsedMs,
        startedAt: startedAt ?? this.startedAt,
        remainingSeconds: remainingSeconds ?? this.remainingSeconds,
        mangaApp: mangaApp ?? this.mangaApp,
      );
}
