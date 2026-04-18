/// SNSクイズの種類を表す列挙型
enum SnsQuizType {
  quiz1,
  quiz2,
  quiz3,
  quiz4;

  /// クイズID（データベース保存・Analytics に使用）
  String get quizId => 'sns_$name';
}
