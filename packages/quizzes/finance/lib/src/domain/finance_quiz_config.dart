abstract final class FinanceQuizConfig {
  static const int timeLimitSeconds = 60;
  static const double quiz1PanThreshold = 80.0;
  static const double quiz2ScaleThreshold = 0.8;
  // 3x screen width (assumes ~400px screen)
  static const double chartWidthMultiplier = 3.0;
  // quiz3: 価格幅の上位何%を「頂点付近」と見なすか
  static const double quiz3PeakThresholdRatio = 0.10;
}
