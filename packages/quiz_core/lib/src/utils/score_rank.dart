/// クイズスコアに基づく評価ランク
enum ScoreRank {
  /// 900点以上
  s,

  /// 700〜899点
  a,

  /// 500〜699点
  b,

  /// 499点以下
  c;

  /// スコアからランクを算出する
  static ScoreRank fromScore(int score) {
    if (score >= 900) return ScoreRank.s;
    if (score >= 700) return ScoreRank.a;
    if (score >= 500) return ScoreRank.b;
    return ScoreRank.c;
  }

  /// 表示ラベル（"S" / "A" / "B" / "C"）
  String get label => name.toUpperCase();
}
