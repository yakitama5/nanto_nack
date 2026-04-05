/// スキップ＆シーククイズのユースケース
class QuizSkipSeekUseCase {
  const QuizSkipSeekUseCase();

  /// クリア判定
  /// - [isSkipped]: 次の動画にスキップしたか
  /// - [progress]: シーク位置 (0.0 〜 1.0)
  bool isClear({
    required bool isSkipped,
    required double progress,
  }) {
    // 次の動画に移動しており、かつ中盤（40%〜60%）にシークしていること
    return isSkipped && progress >= 0.4 && progress <= 0.6;
  }
}
