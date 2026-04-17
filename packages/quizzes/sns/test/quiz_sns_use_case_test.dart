import 'package:flutter_test/flutter_test.dart';
import 'package:sns/src/application/quiz_sns_use_case.dart';
import 'package:sns/src/domain/entities/sns_post.dart';
import 'package:sns/src/domain/sns_quiz_config.dart';

void main() {
  const useCase = QuizSnsUseCase();

  group('QuizSnsUseCase', () {
    group('isClearQuiz1', () {
      test('猫投稿がいいねされていればtrueを返す', () {
        final posts = [
          const SnsPost(
            id: 'sns_quiz1_cat_post',
            userName: 'test',
            userId: '@test',
            content: 'content',
            imageUrl: 'cat',
            isLiked: true,
            avatarColor: 0xFF1DA1F2,
          ),
        ];

        expect(
          useCase.isClearQuiz1(
            posts: posts,
            catPostId: SnsQuizConfig.catPostId,
          ),
          isTrue,
        );
      });

      test('猫投稿がいいねされていなければfalseを返す', () {
        final posts = [
          const SnsPost(
            id: 'sns_quiz1_cat_post',
            userName: 'test',
            userId: '@test',
            content: 'content',
            imageUrl: 'cat',
            isLiked: false,
            avatarColor: 0xFF1DA1F2,
          ),
        ];

        expect(
          useCase.isClearQuiz1(
            posts: posts,
            catPostId: SnsQuizConfig.catPostId,
          ),
          isFalse,
        );
      });

      test('猫投稿が存在しない場合はfalseを返す', () {
        final posts = [
          const SnsPost(
            id: 'other_post',
            userName: 'test',
            userId: '@test',
            content: 'content',
            isLiked: true,
            avatarColor: 0xFF1DA1F2,
          ),
        ];

        expect(
          useCase.isClearQuiz1(
            posts: posts,
            catPostId: SnsQuizConfig.catPostId,
          ),
          isFalse,
        );
      });
    });

    group('isClearQuiz2', () {
      test('投稿内容が空でなければtrueを返す', () {
        expect(
          useCase.isClearQuiz2(composeText: 'Hello'),
          isTrue,
        );
      });

      test('投稿内容が空（または空白のみ）ならfalseを返す', () {
        expect(
          useCase.isClearQuiz2(composeText: ''),
          isFalse,
        );
        expect(
          useCase.isClearQuiz2(composeText: '   '),
          isFalse,
        );
      });
    });

    group('isClearQuiz4', () {
      test('検索クエリがターゲットと一致すればtrueを返す', () {
        expect(
          useCase.isClearQuiz4(
            searchText: SnsQuizConfig.searchQuery,
            targetQuery: SnsQuizConfig.searchQuery,
          ),
          isTrue,
        );
      });

      test('検索クエリが不一致ならfalseを返す', () {
        expect(
          useCase.isClearQuiz4(
            searchText: 'other query',
            targetQuery: SnsQuizConfig.searchQuery,
          ),
          isFalse,
        );
      });
    });
  });
}
