import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news/src/domain/entities/news_article.dart';
import 'package:news/src/domain/news_quiz_config.dart';
import 'package:news/src/infrastructure/news_quiz_repository.dart';
import 'package:news/src/infrastructure/news_quiz_repository_provider.dart';
import 'package:news/src/presentation/news_quiz_notifier.dart';
import 'package:news/src/presentation/news_quiz_type.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

// テスト用固定日時（決定論的なテストのために使用）
final _fixedNow = DateTime(2026, 4, 16, 12, 0);

class MockNewsQuizRepository extends Mock implements NewsQuizRepository {}

class MockAnalyticsService extends Mock implements AnalyticsService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockNewsQuizRepository mockRepo;
  late MockAnalyticsService mockAnalytics;

  ProviderContainer buildContainer() {
    return ProviderContainer(
      overrides: [
        newsQuizRepositoryProvider.overrideWithValue(mockRepo),
        analyticsServiceProvider.overrideWithValue(mockAnalytics),
      ],
    );
  }

  setUp(() {
    mockRepo = MockNewsQuizRepository();
    mockAnalytics = MockAnalyticsService();

    when(
      () => mockRepo.saveResult(
        quizId: any(named: 'quizId'),
        isCleared: any(named: 'isCleared'),
        clearTimeMs: any(named: 'clearTimeMs'),
        score: any(named: 'score'),
        failureCount: any(named: 'failureCount'),
      ),
    ).thenAnswer((_) async {});

    when(
      () => mockAnalytics.logQuizStarted(quizId: any(named: 'quizId')),
    ).thenAnswer((_) async {});
    when(
      () => mockAnalytics.logQuizCompleted(
        quizId: any(named: 'quizId'),
        score: any(named: 'score'),
        failureCount: any(named: 'failureCount'),
        clearTimeMs: any(named: 'clearTimeMs'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => mockAnalytics.logQuizGivenUp(quizId: any(named: 'quizId')),
    ).thenAnswer((_) async {});
    when(
      () => mockAnalytics.logQuizRetried(quizId: any(named: 'quizId')),
    ).thenAnswer((_) async {});
  });

  // ─────────────────────────────────────────────
  // Quiz1: refreshNews
  // ─────────────────────────────────────────────

  group('Quiz1 (refresh): refreshNews', () {
    test('refreshNewsを呼ぶとQuizStatus.correctになること', () async {
      await withClock(Clock.fixed(_fixedNow), () async {
        final container = buildContainer();
        addTearDown(container.dispose);
        final sub = container.listen(
          newsQuizProvider(NewsQuizType.refresh),
          (_, __) {},
          fireImmediately: true,
        );
        addTearDown(sub.close);

        container
            .read(newsQuizProvider(NewsQuizType.refresh).notifier)
            .startQuiz();

        await container
            .read(newsQuizProvider(NewsQuizType.refresh).notifier)
            .refreshNews();

        final state = container.read(newsQuizProvider(NewsQuizType.refresh));
        expect(state.status, QuizStatus.correct);
        expect(state.isRefreshing, isTrue);
      });
    });

    test(
      'Quiz2〜4のNotifierでrefreshNewsを呼んでもQuizStatus.playingのままであること',
      () async {
        final otherTypes = [
          NewsQuizType.category,
          NewsQuizType.fontSize,
          NewsQuizType.hideArticle,
        ];

        for (final type in otherTypes) {
          await withClock(Clock.fixed(_fixedNow), () async {
            final container = buildContainer();
            addTearDown(container.dispose);
            // autoDispose プロバイダーが非同期処理中にdisposeされないようリスナーを保持
            final sub = container.listen(
              newsQuizProvider(type),
              (_, __) {},
              fireImmediately: true,
            );
            addTearDown(sub.close);

            container.read(newsQuizProvider(type).notifier).startQuiz();
            await container.read(newsQuizProvider(type).notifier).refreshNews();

            final state = container.read(newsQuizProvider(type));
            expect(
              state.status,
              QuizStatus.playing,
              reason: '$type でrefreshNewsを呼んでもplayingのまま',
            );
          });
        }
      },
    );
  });

  // ─────────────────────────────────────────────
  // Quiz2: changeCategory
  // ─────────────────────────────────────────────

  group('Quiz2 (category): changeCategory', () {
    test('changeCategory(sports)を呼ぶとQuizStatus.correctになること', () async {
      await withClock(Clock.fixed(_fixedNow), () async {
        final container = buildContainer();
        addTearDown(container.dispose);
        final sub = container.listen(
          newsQuizProvider(NewsQuizType.category),
          (_, __) {},
          fireImmediately: true,
        );
        addTearDown(sub.close);

        container
            .read(newsQuizProvider(NewsQuizType.category).notifier)
            .startQuiz();

        container
            .read(newsQuizProvider(NewsQuizType.category).notifier)
            .changeCategory(NewsCategory.sports);

        final state = container.read(newsQuizProvider(NewsQuizType.category));
        expect(state.status, QuizStatus.correct);
      });
    });

    test('クリア条件でないカテゴリ(entertainment)に変えてもQuizStatus.playingのままであること', () {
      final container = buildContainer();
      addTearDown(container.dispose);

      container
          .read(newsQuizProvider(NewsQuizType.category).notifier)
          .startQuiz();

      container
          .read(newsQuizProvider(NewsQuizType.category).notifier)
          .changeCategory(NewsCategory.entertainment);

      final state = container.read(newsQuizProvider(NewsQuizType.category));
      expect(
        state.status,
        QuizStatus.playing,
        reason: 'changeCategory(entertainment)を呼んでもplayingのまま',
      );
    });

    test('初期カテゴリはchangeCategoryしても何も変更されないこと（no-op ガード）', () {
      final container = buildContainer();
      addTearDown(container.dispose);

      container
          .read(newsQuizProvider(NewsQuizType.category).notifier)
          .startQuiz();
      final initialState = container.read(
        newsQuizProvider(NewsQuizType.category),
      );

      // 初期カテゴリ（NewsCategory.top）で changeCategory を呼ぶ
      container
          .read(newsQuizProvider(NewsQuizType.category).notifier)
          .changeCategory(NewsCategory.top);

      final state = container.read(newsQuizProvider(NewsQuizType.category));
      expect(state.status, QuizStatus.playing);
      expect(
        state.newsApp.currentCategory,
        initialState.newsApp.currentCategory,
        reason: '初期カテゴリへの変更は no-op',
      );
    });

    test('changeCategoryを呼ぶとcurrentCategoryが変更されること（全クイズで動作）', () {
      const cases = <(NewsQuizType, NewsCategory)>[
        (NewsQuizType.refresh, NewsCategory.entertainment),
        (NewsQuizType.fontSize, NewsCategory.entertainment),
        (NewsQuizType.hideArticle, NewsCategory.entertainment),
      ];

      for (final (type, category) in cases) {
        final container = buildContainer();
        addTearDown(container.dispose);

        container.read(newsQuizProvider(type).notifier).startQuiz();
        container
            .read(newsQuizProvider(type).notifier)
            .changeCategory(category);

        final state = container.read(newsQuizProvider(type));
        expect(
          state.newsApp.currentCategory,
          category,
          reason: '$type でchangeCategory($category)を呼ぶとcurrentCategoryが変わる',
        );
      }
    });
  });

  // ─────────────────────────────────────────────
  // Quiz3: changeFontSize
  // ─────────────────────────────────────────────

  group('Quiz3 (fontSize): changeFontSize', () {
    test('changeFontSize(large)を呼ぶとQuizStatus.correctになること', () async {
      await withClock(Clock.fixed(_fixedNow), () async {
        final container = buildContainer();
        addTearDown(container.dispose);
        final sub = container.listen(
          newsQuizProvider(NewsQuizType.fontSize),
          (_, __) {},
          fireImmediately: true,
        );
        addTearDown(sub.close);

        container
            .read(newsQuizProvider(NewsQuizType.fontSize).notifier)
            .startQuiz();

        container
            .read(newsQuizProvider(NewsQuizType.fontSize).notifier)
            .changeFontSize(ArticleFontSize.large);

        final state = container.read(newsQuizProvider(NewsQuizType.fontSize));
        expect(state.status, QuizStatus.correct);
        expect(state.newsApp.fontSize, ArticleFontSize.large);
      });
    });

    test('changeFontSize(small)を呼んでもQuizStatus.playingのままであること', () {
      final container = buildContainer();
      addTearDown(container.dispose);

      container
          .read(newsQuizProvider(NewsQuizType.fontSize).notifier)
          .startQuiz();

      container
          .read(newsQuizProvider(NewsQuizType.fontSize).notifier)
          .changeFontSize(ArticleFontSize.small);

      final state = container.read(newsQuizProvider(NewsQuizType.fontSize));
      expect(
        state.status,
        QuizStatus.playing,
        reason: 'changeFontSize(small)を呼んでもplayingのまま',
      );
    });

    test('changeFontSize(medium)を呼んでも状態変化しないこと（デフォルトサイズの再選択）', () {
      final container = buildContainer();
      addTearDown(container.dispose);

      container
          .read(newsQuizProvider(NewsQuizType.fontSize).notifier)
          .startQuiz();

      // 初期サイズがmediumのため、mediumを再選択してもガード節で弾かれる
      container
          .read(newsQuizProvider(NewsQuizType.fontSize).notifier)
          .changeFontSize(ArticleFontSize.medium);

      final state = container.read(newsQuizProvider(NewsQuizType.fontSize));
      expect(
        state.status,
        QuizStatus.playing,
        reason: 'デフォルトサイズ(medium)の再選択でもplayingのまま',
      );
    });
  });

  // ─────────────────────────────────────────────
  // Quiz4: hideArticle
  // ─────────────────────────────────────────────

  group('Quiz4 (hideArticle): hideArticle', () {
    test('対象記事IDを指定してhideArticleを呼ぶとQuizStatus.correctになること', () async {
      await withClock(Clock.fixed(_fixedNow), () async {
        final container = buildContainer();
        addTearDown(container.dispose);
        final sub = container.listen(
          newsQuizProvider(NewsQuizType.hideArticle),
          (_, __) {},
          fireImmediately: true,
        );
        addTearDown(sub.close);

        container
            .read(newsQuizProvider(NewsQuizType.hideArticle).notifier)
            .startQuiz();

        container
            .read(newsQuizProvider(NewsQuizType.hideArticle).notifier)
            .hideArticle(NewsQuizConfig.quiz4TargetArticleId);

        final state = container.read(
          newsQuizProvider(NewsQuizType.hideArticle),
        );
        expect(state.status, QuizStatus.correct);
      });
    });

    test('別記事IDを指定してもQuizStatus.playingのままであること', () {
      final container = buildContainer();
      addTearDown(container.dispose);

      container
          .read(newsQuizProvider(NewsQuizType.hideArticle).notifier)
          .startQuiz();

      container
          .read(newsQuizProvider(NewsQuizType.hideArticle).notifier)
          .hideArticle('news_q_sports_1');

      final state = container.read(newsQuizProvider(NewsQuizType.hideArticle));
      expect(state.status, QuizStatus.playing);
    });

    test('hideArticle後に対象記事がisHidden == trueになっていること', () {
      final container = buildContainer();
      addTearDown(container.dispose);

      container
          .read(newsQuizProvider(NewsQuizType.hideArticle).notifier)
          .startQuiz();

      container
          .read(newsQuizProvider(NewsQuizType.hideArticle).notifier)
          .hideArticle(NewsQuizConfig.quiz4TargetArticleId);

      final state = container.read(newsQuizProvider(NewsQuizType.hideArticle));
      final targetArticle = state.newsApp.articles.firstWhere(
        (a) => a.id == NewsQuizConfig.quiz4TargetArticleId,
      );
      expect(targetArticle.isHidden, isTrue);
    });
  });

  // ─────────────────────────────────────────────
  // ガード系テスト
  // ─────────────────────────────────────────────

  group('ガード系テスト', () {
    test('giveUp後にchangeCategoryを呼んでもStateが変化しないこと（ステータスガード）', () async {
      final container = buildContainer();
      addTearDown(container.dispose);

      container
          .read(newsQuizProvider(NewsQuizType.category).notifier)
          .startQuiz();
      await container
          .read(newsQuizProvider(NewsQuizType.category).notifier)
          .giveUp();

      final stateBeforeAction = container.read(
        newsQuizProvider(NewsQuizType.category),
      );
      expect(stateBeforeAction.status, QuizStatus.giveUp);

      container
          .read(newsQuizProvider(NewsQuizType.category).notifier)
          .changeCategory(NewsCategory.sports);

      final stateAfterAction = container.read(
        newsQuizProvider(NewsQuizType.category),
      );
      expect(stateAfterAction.status, QuizStatus.giveUp);
      expect(
        stateAfterAction.newsApp.currentCategory,
        stateBeforeAction.newsApp.currentCategory,
      );
    });

    test('hideArticleで同じ記事を2回呼んでも2回目はStateが変化しないこと（冪等ガード）', () async {
      await withClock(Clock.fixed(_fixedNow), () async {
        final container = buildContainer();
        addTearDown(container.dispose);
        final sub = container.listen(
          newsQuizProvider(NewsQuizType.hideArticle),
          (_, __) {},
          fireImmediately: true,
        );
        addTearDown(sub.close);

        container
            .read(newsQuizProvider(NewsQuizType.hideArticle).notifier)
            .startQuiz();

        // 1回目: 別記事を非表示（correct条件でない記事）
        container
            .read(newsQuizProvider(NewsQuizType.hideArticle).notifier)
            .hideArticle('news_q_sports_1');

        final stateAfterFirst = container.read(
          newsQuizProvider(NewsQuizType.hideArticle),
        );
        expect(stateAfterFirst.status, QuizStatus.playing);

        // 2回目: 同じ記事を再度呼ぶ（冪等ガードで変化しないはず）
        container
            .read(newsQuizProvider(NewsQuizType.hideArticle).notifier)
            .hideArticle('news_q_sports_1');

        final stateAfterSecond = container.read(
          newsQuizProvider(NewsQuizType.hideArticle),
        );
        expect(stateAfterSecond.status, QuizStatus.playing);

        // 記事が2重に非表示になっていないことを確認（状態は同一）
        final hiddenCount = stateAfterSecond.newsApp.articles
            .where((a) => a.isHidden)
            .length;
        expect(hiddenCount, 1, reason: '同じ記事のhideArticleは1回しか処理されない');
      });
    });
  });
}
