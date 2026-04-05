import 'package:chat/src/application/quiz_create_group_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const useCase = QuizCreateGroupUseCase();

  group('QuizCreateGroupUseCase.isClear', () {
    test('グループが作成済みならクリア', () {
      expect(useCase.isClear(groupCreated: true), isTrue);
    });

    test('グループが未作成ならクリアでない', () {
      expect(useCase.isClear(groupCreated: false), isFalse);
    });
  });

  group('QuizCreateGroupUseCase.hasEnoughMembers', () {
    test('2人以上選択でOK', () {
      expect(useCase.hasEnoughMembers(selectedCount: 2), isTrue);
      expect(useCase.hasEnoughMembers(selectedCount: 3), isTrue);
    });

    test('1人以下では不足', () {
      expect(useCase.hasEnoughMembers(selectedCount: 0), isFalse);
      expect(useCase.hasEnoughMembers(selectedCount: 1), isFalse);
    });
  });

  group('QuizCreateGroupUseCase.failureReason', () {
    test('クリア時はnullを返す', () {
      expect(useCase.failureReason(groupCreated: true), isNull);
    });

    test('クリアでない時はメッセージを返す', () {
      expect(useCase.failureReason(groupCreated: false), isNotNull);
    });
  });
}
