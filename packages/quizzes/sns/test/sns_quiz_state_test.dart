import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:sns/src/domain/sns_quiz_config.dart';
import 'package:sns/src/presentation/sns_quiz_state.dart';
import 'package:sns/src/presentation/sns_quiz_type.dart';

void main() {
  group('SnsQuizState', () {
    group('initial()', () {
      test('Quiz1の初期状態が正しく生成される', () {
        final state = SnsQuizState.initial(SnsQuizType.quiz1);
        expect(state.status, QuizStatus.idle);
        expect(state.failureCount, 0);
        expect(state.elapsedMs, 0);
        expect(state.currentAccount, SnsQuizConfig.mainAccountId);
        expect(state.isFullScreenImageOpened, isFalse);
        expect(state.fullScreenImageUrl, isNull);
        expect(
          state.remainingSeconds,
          SnsQuizConfig.quiz1TimeLimitSeconds,
        );
        expect(state.scrollToTopRequested, isFalse);
        // 猫投稿が含まれている
        final catPost = state.posts.where((p) => p.id == SnsQuizConfig.catPostId);
        expect(catPost.length, 1);
        expect(catPost.first.isLiked, isFalse);
      });

      test('Quiz2の初期状態は全画面画像が開いた状態', () {
        final state = SnsQuizState.initial(SnsQuizType.quiz2);
        expect(state.isFullScreenImageOpened, isTrue);
        expect(state.fullScreenImageUrl, isNotNull);
      });

      test('Quiz3の初期状態は全画面画像が閉じた状態', () {
        final state = SnsQuizState.initial(SnsQuizType.quiz3);
        expect(state.isFullScreenImageOpened, isFalse);
        expect(state.fullScreenImageUrl, isNull);
        expect(state.scrollToTopRequested, isFalse);
      });

      test('Quiz4の初期状態はメインアカウントでログイン中', () {
        final state = SnsQuizState.initial(SnsQuizType.quiz4);
        expect(state.currentAccount, SnsQuizConfig.mainAccountId);
      });

      test('postsリストはUnmodifiableListViewでラップされている', () {
        final state = SnsQuizState.initial(SnsQuizType.quiz1);
        expect(() => (state.posts as List).add(state.posts.first), throwsUnsupportedError);
      });
    });

    group('copyWith()', () {
      test('statusを変更できる', () {
        final state = SnsQuizState.initial(SnsQuizType.quiz1);
        final updated = state.copyWith(status: QuizStatus.playing);
        expect(updated.status, QuizStatus.playing);
        expect(updated.currentAccount, state.currentAccount);
      });

      test('currentAccountを変更できる', () {
        final state = SnsQuizState.initial(SnsQuizType.quiz4);
        final updated = state.copyWith(
          currentAccount: SnsQuizConfig.subAccountId,
        );
        expect(updated.currentAccount, SnsQuizConfig.subAccountId);
      });

      test('postsを変更すると自動的にUnmodifiableListViewでラップされる', () {
        final state = SnsQuizState.initial(SnsQuizType.quiz1);
        final newPosts = [...state.posts];
        final updated = state.copyWith(posts: newPosts);
        expect(
          () => (updated.posts as List).add(updated.posts.first),
          throwsUnsupportedError,
        );
      });

      test('scrollToTopRequestedを変更できる', () {
        final state = SnsQuizState.initial(SnsQuizType.quiz3);
        final updated = state.copyWith(scrollToTopRequested: true);
        expect(updated.scrollToTopRequested, isTrue);
      });
    });
  });
}
