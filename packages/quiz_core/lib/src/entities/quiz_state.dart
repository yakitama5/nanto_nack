/// クイズの状態を表す列挙型
enum QuizStatus {
  /// 待機中
  idle,

  /// プレイ中
  playing,

  /// 正解
  correct,

  /// 不正解
  incorrect,

  /// 時間切れ
  timeUp,

  /// 完了
  completed,

  /// 諦め（プレイヤーによる中止）
  giveUp,
}

/// クイズ状態の基底クラス
/// 各クイズの状態はこのクラスを継承して実装する
abstract class QuizStateBase {
  const QuizStateBase({
    required this.status,
    required this.failureCount,
    required this.elapsedMs,
    required this.startedAt,
  });

  final QuizStatus status;
  final int failureCount;

  /// 経過時間 (ミリ秒)
  final int elapsedMs;

  final DateTime? startedAt;

  bool get isCompleted => status == QuizStatus.completed;
  bool get isCorrect => status == QuizStatus.correct;
  bool get isPlaying => status == QuizStatus.playing;

  /// スコア計算 (デフォルト実装: 時間が短いほど高得点)
  int get score {
    if (!isCorrect && status != QuizStatus.completed) return 0;
    const baseScore = 1000;
    final penalty = (elapsedMs / 100).floor();
    final failurePenalty = failureCount * 100;
    return (baseScore - penalty - failurePenalty).clamp(0, baseScore);
  }
}
