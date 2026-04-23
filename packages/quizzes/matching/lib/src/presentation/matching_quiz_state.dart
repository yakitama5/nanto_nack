import 'package:matching/src/domain/entities/match_profile.dart';
import 'package:matching/src/domain/matching_quiz_config.dart';
import 'package:matching/src/presentation/matching_app_state.dart';
import 'package:quiz_core/quiz_core.dart';

/// マッチングクイズ共通の状態
///
/// Quiz1〜4 すべてで共通して使用する。
class MatchingQuizState extends QuizStateBase {
  const MatchingQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.matchingApp,
    required this.remainingSeconds,
    this.hintUsed = false,
  });

  final MatchingAppState matchingApp;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// ヒントを使用済みかどうか
  final bool hintUsed;

  MatchingQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    MatchingAppState? matchingApp,
    int? remainingSeconds,
    bool? hintUsed,
  }) {
    return MatchingQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      matchingApp: matchingApp ?? this.matchingApp,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      hintUsed: hintUsed ?? this.hintUsed,
    );
  }

  factory MatchingQuizState.initial({
    required List<MatchProfile> initialProfiles,
  }) =>
      MatchingQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        matchingApp: MatchingAppState.initial(
          initialProfiles: initialProfiles,
        ),
        remainingSeconds: MatchingQuizConfig.timeLimitSeconds,
        hintUsed: false,
      );
}
