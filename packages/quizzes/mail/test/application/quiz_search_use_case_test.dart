import 'package:flutter_test/flutter_test.dart';
import 'package:mail/src/application/quiz_search_use_case.dart';

void main() {
  const useCase = QuizSearchUseCase();

  group('QuizSearchUseCase', () {
    test('正解クエリと完全一致する場合はtrueを返す', () {
      expect(useCase.isClear(query: 'larger:5M'), isTrue);
    });

    test('大文字で入力しても一致する場合はtrueを返す', () {
      expect(useCase.isClear(query: 'LARGER:5M'), isTrue);
    });

    test('小文字で入力しても一致する場合はtrueを返す', () {
      expect(useCase.isClear(query: 'larger:5m'), isTrue);
    });

    test('異なるクエリの場合はfalseを返す', () {
      expect(useCase.isClear(query: 'larger:1M'), isFalse);
    });

    test('空文字の場合はfalseを返す', () {
      expect(useCase.isClear(query: ''), isFalse);
    });

    test('部分一致でもfalseを返す', () {
      expect(useCase.isClear(query: 'larger'), isFalse);
    });
  });
}
