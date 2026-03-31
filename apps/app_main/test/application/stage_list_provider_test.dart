import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import 'package:app_main/application/stage_list_provider.dart';
import 'package:app_main/domain/stage.dart';

// ─── Mock ─────────────────────────────────────────────────────────────────────

class MockQuizResultRepository extends Mock implements QuizResultRepository {}

// ─── ヘルパー ─────────────────────────────────────────────────────────────────

/// テスト用に全ステージの findById が null を返す設定
void _stubAllStagesNotFound(MockQuizResultRepository mock) {
  for (final stage in kAllStages) {
    when(() => mock.findById(stage.id)).thenAnswer((_) async => null);
  }
}

/// 指定ステージをクリア済みとして返す QuizResult を生成
QuizResult _clearedResult(String quizId) => QuizResult(
      quizId: quizId,
      isCleared: true,
      clearTimeMs: 5000,
      score: 800,
      failureCount: 1,
    );

/// ProviderContainer を生成してクリーンアップをスケジュールする
ProviderContainer _makeContainer(MockQuizResultRepository mock) {
  final container = ProviderContainer(
    overrides: [
      quizResultRepositoryProvider.overrideWithValue(mock),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

// ─── テスト ───────────────────────────────────────────────────────────────────

void main() {
  late MockQuizResultRepository mockRepo;

  setUp(() {
    mockRepo = MockQuizResultRepository();
    // saveBestRecord と logPlay はデフォルトで成功を返す
    when(
      () => mockRepo.saveBestRecord(
        quizId: any(named: 'quizId'),
        isCleared: any(named: 'isCleared'),
        clearTimeMs: any(named: 'clearTimeMs'),
        score: any(named: 'score'),
        failureCount: any(named: 'failureCount'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => mockRepo.logPlay(
        quizId: any(named: 'quizId'),
        isCleared: any(named: 'isCleared'),
        score: any(named: 'score'),
        failureCount: any(named: 'failureCount'),
      ),
    ).thenAnswer((_) async {});
  });

  group('StageListNotifier.build()', () {
    test('クリア済みステージがない場合、最初のステージだけ available になる', () async {
      _stubAllStagesNotFound(mockRepo);
      final container = _makeContainer(mockRepo);

      final stages =
          await container.read(stageListProvider.future);

      expect(stages[0].status, StageStatus.available);
      expect(stages[1].status, StageStatus.locked);
      expect(stages[2].status, StageStatus.locked);
      expect(stages[3].status, StageStatus.locked);
    });

    test('最初のステージをクリアすると2番目が available になる', () async {
      when(() => mockRepo.findById(kAllStages[0].id))
          .thenAnswer((_) async => _clearedResult(kAllStages[0].id));
      when(() => mockRepo.findById(kAllStages[1].id))
          .thenAnswer((_) async => null);
      when(() => mockRepo.findById(kAllStages[2].id))
          .thenAnswer((_) async => null);
      when(() => mockRepo.findById(kAllStages[3].id))
          .thenAnswer((_) async => null);

      final container = _makeContainer(mockRepo);
      final stages = await container.read(stageListProvider.future);

      expect(stages[0].status, StageStatus.cleared);
      expect(stages[1].status, StageStatus.available);
      expect(stages[2].status, StageStatus.locked);
      expect(stages[3].status, StageStatus.locked);
    });

    test('最初の2ステージをクリアすると3番目が available になる', () async {
      when(() => mockRepo.findById(kAllStages[0].id))
          .thenAnswer((_) async => _clearedResult(kAllStages[0].id));
      when(() => mockRepo.findById(kAllStages[1].id))
          .thenAnswer((_) async => _clearedResult(kAllStages[1].id));
      when(() => mockRepo.findById(kAllStages[2].id))
          .thenAnswer((_) async => null);
      when(() => mockRepo.findById(kAllStages[3].id))
          .thenAnswer((_) async => null);

      final container = _makeContainer(mockRepo);
      final stages = await container.read(stageListProvider.future);

      expect(stages[0].status, StageStatus.cleared);
      expect(stages[1].status, StageStatus.cleared);
      expect(stages[2].status, StageStatus.available);
      expect(stages[3].status, StageStatus.locked);
    });

    test('全ステージをクリアすると全て cleared になる', () async {
      for (final stage in kAllStages) {
        when(() => mockRepo.findById(stage.id))
            .thenAnswer((_) async => _clearedResult(stage.id));
      }

      final container = _makeContainer(mockRepo);
      final stages = await container.read(stageListProvider.future);

      for (final s in stages) {
        expect(s.status, StageStatus.cleared);
      }
    });

    test('クリア済みステージの clearTimeMs と score が反映される', () async {
      final result = QuizResult(
        quizId: kAllStages[0].id,
        isCleared: true,
        clearTimeMs: 12345,
        score: 950,
        failureCount: 0,
      );
      when(() => mockRepo.findById(kAllStages[0].id))
          .thenAnswer((_) async => result);
      when(() => mockRepo.findById(kAllStages[1].id))
          .thenAnswer((_) async => null);
      when(() => mockRepo.findById(kAllStages[2].id))
          .thenAnswer((_) async => null);
      when(() => mockRepo.findById(kAllStages[3].id))
          .thenAnswer((_) async => null);

      final container = _makeContainer(mockRepo);
      final stages = await container.read(stageListProvider.future);

      expect(stages[0].clearTimeMs, 12345);
      expect(stages[0].score, 950);
    });

    test('返されるリストの stage フィールドが kAllStages と対応している', () async {
      _stubAllStagesNotFound(mockRepo);
      final container = _makeContainer(mockRepo);

      final stages = await container.read(stageListProvider.future);

      for (var i = 0; i < kAllStages.length; i++) {
        expect(stages[i].stage.id, kAllStages[i].id);
        expect(stages[i].stage.difficulty, kAllStages[i].difficulty);
      }
    });

    test('クリアされていない結果がある場合は cleared にならない', () async {
      final notCleared = QuizResult(
        quizId: kAllStages[0].id,
        isCleared: false,
        clearTimeMs: null,
        score: 0,
        failureCount: 3,
      );
      when(() => mockRepo.findById(kAllStages[0].id))
          .thenAnswer((_) async => notCleared);
      for (final stage in kAllStages.skip(1)) {
        when(() => mockRepo.findById(stage.id))
            .thenAnswer((_) async => null);
      }

      final container = _makeContainer(mockRepo);
      final stages = await container.read(stageListProvider.future);

      // 最初のステージは isCleared=false なので cleared ではなく available
      expect(stages[0].status, StageStatus.available);
      // 2番目は前がクリアされていないのでロック
      expect(stages[1].status, StageStatus.locked);
    });
  });

  group('StageListNotifier.onQuizCleared()', () {
    test('logPlay と saveBestRecord が正しいパラメータで呼ばれる', () async {
      _stubAllStagesNotFound(mockRepo);
      // onQuizCleared 後の再ビルド用に再度スタブを設定
      for (final stage in kAllStages) {
        when(() => mockRepo.findById(stage.id))
            .thenAnswer((_) async => null);
      }

      final container = _makeContainer(mockRepo);
      // ビルドを完了させる
      await container.read(stageListProvider.future);

      await container
          .read(stageListProvider.notifier)
          .onQuizCleared(
            quizId: 'shopping_water',
            clearTimeMs: 8000,
            score: 700,
            failureCount: 2,
          );

      verify(
        () => mockRepo.logPlay(
          quizId: 'shopping_water',
          isCleared: true,
          score: 700,
          failureCount: 2,
        ),
      ).called(1);

      verify(
        () => mockRepo.saveBestRecord(
          quizId: 'shopping_water',
          isCleared: true,
          clearTimeMs: 8000,
          score: 700,
          failureCount: 2,
        ),
      ).called(1);
    });

    test('onQuizCleared の後にプロバイダーが再ビルドされる', () async {
      _stubAllStagesNotFound(mockRepo);
      final container = _makeContainer(mockRepo);

      await container.read(stageListProvider.future);

      // onQuizCleared 呼び出し後、クリア済み結果を返すようスタブを変更
      when(() => mockRepo.findById(kAllStages[0].id))
          .thenAnswer((_) async => _clearedResult(kAllStages[0].id));
      // 他のステージは引き続き null
      for (final stage in kAllStages.skip(1)) {
        when(() => mockRepo.findById(stage.id))
            .thenAnswer((_) async => null);
      }

      await container
          .read(stageListProvider.notifier)
          .onQuizCleared(
            quizId: kAllStages[0].id,
            clearTimeMs: 5000,
            score: 800,
            failureCount: 0,
          );

      // invalidateSelf() により再ビルドが走り、新しいステータスが反映される
      final updatedStages = await container.read(stageListProvider.future);

      expect(updatedStages[0].status, StageStatus.cleared);
      expect(updatedStages[1].status, StageStatus.available);
    });

    test('logPlay は saveBestRecord より先に呼ばれる', () async {
      _stubAllStagesNotFound(mockRepo);
      for (final stage in kAllStages) {
        when(() => mockRepo.findById(stage.id))
            .thenAnswer((_) async => null);
      }

      final callOrder = <String>[];
      when(
        () => mockRepo.logPlay(
          quizId: any(named: 'quizId'),
          isCleared: any(named: 'isCleared'),
          score: any(named: 'score'),
          failureCount: any(named: 'failureCount'),
        ),
      ).thenAnswer((_) async => callOrder.add('logPlay'));
      when(
        () => mockRepo.saveBestRecord(
          quizId: any(named: 'quizId'),
          isCleared: any(named: 'isCleared'),
          clearTimeMs: any(named: 'clearTimeMs'),
          score: any(named: 'score'),
          failureCount: any(named: 'failureCount'),
        ),
      ).thenAnswer((_) async => callOrder.add('saveBestRecord'));

      final container = _makeContainer(mockRepo);
      await container.read(stageListProvider.future);

      await container
          .read(stageListProvider.notifier)
          .onQuizCleared(
            quizId: 'shopping_water',
            clearTimeMs: 3000,
            score: 500,
            failureCount: 1,
          );

      expect(callOrder, ['logPlay', 'saveBestRecord']);
    });
  });
}