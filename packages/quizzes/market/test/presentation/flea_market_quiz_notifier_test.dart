import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:market/src/domain/market_quiz_type.dart';
import 'package:market/src/infrastructure/market_quiz_repository.dart';
import 'package:market/src/infrastructure/market_quiz_repository_provider.dart';
import 'package:market/src/presentation/flea_market_quiz_notifier.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

class _MockMarketQuizRepository extends Mock implements MarketQuizRepository {}

class _MockAnalyticsService extends Mock implements AnalyticsService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockMarketQuizRepository mockRepo;
  late _MockAnalyticsService mockAnalytics;
  late ProviderContainer container;

  setUp(() {
    mockRepo = _MockMarketQuizRepository();
    mockAnalytics = _MockAnalyticsService();

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

    container = ProviderContainer(
      overrides: [
        marketQuizRepositoryProvider.overrideWithValue(mockRepo),
        analyticsServiceProvider.overrideWithValue(mockAnalytics),
      ],
    );
  });

  tearDown(() => container.dispose());

  group('FleaMarketQuizNotifier - quiz1 (画像スワイプ)', () {
    const quizType = MarketQuizType.quiz1;

    test('初期状態は idle である', () {
      final state = container.read(fleaMarketQuizProvider(quizType));
      expect(state.status, QuizStatus.idle);
      expect(state.currentImageIndex, 0);
    });

    test('startQuiz() で status が playing になる', () {
      container.read(fleaMarketQuizProvider(quizType).notifier).startQuiz();
      final state = container.read(fleaMarketQuizProvider(quizType));
      expect(state.status, QuizStatus.playing);
      expect(state.startedAt, isNotNull);
    });

    test('最後の画像インデックスに到達すると correct になる', () async {
      final completer = Completer<void>();
      final sub = container.listen(
        fleaMarketQuizProvider(quizType),
        (_, next) {
          if (next.status == QuizStatus.correct) completer.complete();
        },
        fireImmediately: true,
      );
      addTearDown(sub.close);

      await withClock(Clock.fixed(DateTime(2026, 6, 4, 12)), () async {
        container
            .read(fleaMarketQuizProvider(quizType).notifier)
            .startQuiz();
        // 絵文字リストは ['👕', '🔄', '🏷️'] の3枚、最後は index=2
        final itemImageCount =
            container.read(fleaMarketQuizProvider(quizType)).item.imageEmojis.length;
        container
            .read(fleaMarketQuizProvider(quizType).notifier)
            .updateImageIndex(itemImageCount - 1);
        await completer.future;
        final state = container.read(fleaMarketQuizProvider(quizType));
        expect(state.status, QuizStatus.correct);
      });
    });

    test('最後以外の画像インデックスでは correct にならない', () {
      final sub = container.listen(
        fleaMarketQuizProvider(quizType),
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      container.read(fleaMarketQuizProvider(quizType).notifier).startQuiz();
      final imageCount =
          container.read(fleaMarketQuizProvider(quizType)).item.imageEmojis.length;
      final nonLastIndex = imageCount >= 2 ? imageCount - 2 : 0;
      container
          .read(fleaMarketQuizProvider(quizType).notifier)
          .updateImageIndex(nonLastIndex);
      final state = container.read(fleaMarketQuizProvider(quizType));
      expect(state.status, QuizStatus.playing);
    });
  });

  group('FleaMarketQuizNotifier - quiz2 (いいね)', () {
    const quizType = MarketQuizType.quiz2;

    test('初期状態は isLiked が false である', () {
      final state = container.read(fleaMarketQuizProvider(quizType));
      expect(state.isLiked, isFalse);
    });

    test('toggleLike() で isLiked が true になり correct になる', () async {
      final completer = Completer<void>();
      final sub = container.listen(
        fleaMarketQuizProvider(quizType),
        (_, next) {
          if (next.status == QuizStatus.correct) completer.complete();
        },
        fireImmediately: true,
      );
      addTearDown(sub.close);

      await withClock(Clock.fixed(DateTime(2026, 6, 4, 12)), () async {
        container
            .read(fleaMarketQuizProvider(quizType).notifier)
            .startQuiz();
        container
            .read(fleaMarketQuizProvider(quizType).notifier)
            .toggleLike();
        await completer.future;
        final state = container.read(fleaMarketQuizProvider(quizType));
        expect(state.status, QuizStatus.correct);
        expect(state.isLiked, isTrue);
      });
    });
  });

  group('FleaMarketQuizNotifier - quiz3 (出品者プロフィール)', () {
    const quizType = MarketQuizType.quiz3;

    test('初期状態は sellerTapped が false である', () {
      final state = container.read(fleaMarketQuizProvider(quizType));
      expect(state.sellerTapped, isFalse);
    });

    test('tapSellerProfile() で sellerTapped が true になり correct になる', () async {
      final completer = Completer<void>();
      final sub = container.listen(
        fleaMarketQuizProvider(quizType),
        (_, next) {
          if (next.status == QuizStatus.correct) completer.complete();
        },
        fireImmediately: true,
      );
      addTearDown(sub.close);

      await withClock(Clock.fixed(DateTime(2026, 6, 4, 12)), () async {
        container
            .read(fleaMarketQuizProvider(quizType).notifier)
            .startQuiz();
        container
            .read(fleaMarketQuizProvider(quizType).notifier)
            .tapSellerProfile();
        await completer.future;
        final state = container.read(fleaMarketQuizProvider(quizType));
        expect(state.status, QuizStatus.correct);
        expect(state.sellerTapped, isTrue);
      });
    });
  });

  group('FleaMarketQuizNotifier - quiz4 (購入ボタン)', () {
    const quizType = MarketQuizType.quiz4;

    test('初期状態は buyButtonTapped が false である', () {
      final state = container.read(fleaMarketQuizProvider(quizType));
      expect(state.buyButtonTapped, isFalse);
    });

    test('tapBuyButton() で buyButtonTapped が true になり correct になる', () async {
      final completer = Completer<void>();
      final sub = container.listen(
        fleaMarketQuizProvider(quizType),
        (_, next) {
          if (next.status == QuizStatus.correct) completer.complete();
        },
        fireImmediately: true,
      );
      addTearDown(sub.close);

      await withClock(Clock.fixed(DateTime(2026, 6, 4, 12)), () async {
        container
            .read(fleaMarketQuizProvider(quizType).notifier)
            .startQuiz();
        container
            .read(fleaMarketQuizProvider(quizType).notifier)
            .tapBuyButton();
        await completer.future;
        final state = container.read(fleaMarketQuizProvider(quizType));
        expect(state.status, QuizStatus.correct);
        expect(state.buyButtonTapped, isTrue);
      });
    });
  });

  group('FleaMarketQuizNotifier - 共通動作', () {
    const quizType = MarketQuizType.quiz1;

    test('giveUp() で status が giveUp になる', () async {
      final sub = container.listen(
        fleaMarketQuizProvider(quizType),
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      container.read(fleaMarketQuizProvider(quizType).notifier).startQuiz();
      await container.read(fleaMarketQuizProvider(quizType).notifier).giveUp();
      final state = container.read(fleaMarketQuizProvider(quizType));
      expect(state.status, QuizStatus.giveUp);
      expect(state.remainingSeconds, 0);
    });

    test('retry() で状態が idle にリセットされる', () async {
      final sub = container.listen(
        fleaMarketQuizProvider(quizType),
        (_, _a) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);

      container.read(fleaMarketQuizProvider(quizType).notifier).startQuiz();
      await container.read(fleaMarketQuizProvider(quizType).notifier).giveUp();
      container.read(fleaMarketQuizProvider(quizType).notifier).retry();
      final state = container.read(fleaMarketQuizProvider(quizType));
      expect(state.status, QuizStatus.idle);
      expect(state.currentImageIndex, 0);
      expect(state.isLiked, isFalse);
      expect(state.sellerTapped, isFalse);
      expect(state.buyButtonTapped, isFalse);
    });
  });
}
