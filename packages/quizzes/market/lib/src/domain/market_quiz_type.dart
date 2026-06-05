enum MarketQuizType {
  quiz1,
  quiz2,
  quiz3,
  quiz4;

  /// クイズIDを返す（例: 'market_quiz1'）
  String get quizId => 'market_$name';
}
