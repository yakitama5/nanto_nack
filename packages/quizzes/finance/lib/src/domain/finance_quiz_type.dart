enum FinanceQuizType {
  quiz1,
  quiz2,
  quiz3,
  quiz4;

  String get quizId => switch (this) {
        quiz1 => 'finance_quiz1',
        quiz2 => 'finance_quiz2',
        quiz3 => 'finance_quiz3',
        quiz4 => 'finance_quiz4',
      };
}
