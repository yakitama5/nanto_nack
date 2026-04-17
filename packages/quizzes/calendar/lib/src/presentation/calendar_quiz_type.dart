/// カレンダークイズの種類
enum CalendarQuizType {
  quiz1,
  quiz2,
  quiz3,
  quiz4;

  /// クイズID（例: 'calendar_quiz1'）
  String get quizId => 'calendar_$name';
}
