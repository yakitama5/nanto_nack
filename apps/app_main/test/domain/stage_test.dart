import 'package:app_main/domain/stage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_core/quiz_core.dart';

void main() {
  group('Stage', () {
    test('全フィールドが正しく設定される', () {
      const stage = Stage(
        id: 'test_id',
        title: 'テストタイトル',
        description: 'テスト説明文',
        category: 'test_category',
        routePath: '/test/path',
        difficulty: 3,
      );

      expect(stage.id, 'test_id');
      expect(stage.title, 'テストタイトル');
      expect(stage.description, 'テスト説明文');
      expect(stage.category, 'test_category');
      expect(stage.routePath, '/test/path');
      expect(stage.difficulty, 3);
    });

    test('難易度1のステージを作成できる', () {
      const stage = Stage(
        id: 's1',
        title: 'Easy',
        description: 'desc',
        category: 'cat',
        routePath: '/easy',
        difficulty: 1,
      );
      expect(stage.difficulty, 1);
    });

    test('難易度5のステージを作成できる', () {
      const stage = Stage(
        id: 's5',
        title: 'Hard',
        description: 'desc',
        category: 'cat',
        routePath: '/hard',
        difficulty: 5,
      );
      expect(stage.difficulty, 5);
    });
  });

  group('kAllStages', () {
    test('4ステージが定義されている', () {
      expect(kAllStages.length, 4);
    });

    test('全ステージに difficulty フィールドが設定されている', () {
      for (final stage in kAllStages) {
        expect(stage.difficulty, isNotNull);
        expect(stage.difficulty, greaterThanOrEqualTo(1));
        expect(stage.difficulty, lessThanOrEqualTo(5));
      }
    });

    test('shopping_water のルートパスは /shopping/water', () {
      final stage = kAllStages.firstWhere((s) => s.id == 'shopping_water');
      expect(stage.routePath, '/shopping/water');
      expect(stage.difficulty, 1);
    });

    test('shopping_checkout のルートパスは /shopping/checkout', () {
      final stage = kAllStages.firstWhere((s) => s.id == 'shopping_checkout');
      expect(stage.routePath, '/shopping/checkout');
      expect(stage.difficulty, 2);
    });

    test('shopping_reorder のルートパスは /shopping/reorder', () {
      final stage = kAllStages.firstWhere((s) => s.id == 'shopping_reorder');
      expect(stage.routePath, '/shopping/reorder');
      expect(stage.difficulty, 3);
    });

    test('shopping_cart のルートパスは /shopping/cart', () {
      final stage = kAllStages.firstWhere((s) => s.id == 'shopping_cart');
      expect(stage.routePath, '/shopping/cart');
      expect(stage.difficulty, 5);
    });

    test('全ステージのカテゴリは shopping', () {
      for (final stage in kAllStages) {
        expect(stage.category, 'shopping');
      }
    });

    test('全ステージのIDは重複しない', () {
      final ids = kAllStages.map((s) => s.id).toList();
      final uniqueIds = ids.toSet();
      expect(uniqueIds.length, ids.length);
    });

    test('全ステージのルートパスは重複しない', () {
      final paths = kAllStages.map((s) => s.routePath).toList();
      final uniquePaths = paths.toSet();
      expect(uniquePaths.length, paths.length);
    });

    test('難易度は昇順に並んでいる (水→checkout→reorder→cart)', () {
      final difficulties = kAllStages.map((s) => s.difficulty).toList();
      for (var i = 0; i < difficulties.length - 1; i++) {
        expect(
          difficulties[i],
          lessThan(difficulties[i + 1]),
          reason:
              'ステージ[$i] の難易度 ${difficulties[i]} は [$i+1] の ${difficulties[i + 1]} より小さい必要がある',
        );
      }
    });

    test('shopping_reorder は3番目のステージ', () {
      expect(kAllStages[2].id, 'shopping_reorder');
    });
  });

  group('StageWithStatus', () {
    const stage = Stage(
      id: 'test',
      title: 'Test',
      description: 'desc',
      category: 'shopping',
      routePath: '/test',
      difficulty: 2,
    );

    test('初期値が正しく設定される', () {
      const stageWithStatus = StageWithStatus(
        stage: stage,
        status: StageStatus.available,
      );

      expect(stageWithStatus.stage, stage);
      expect(stageWithStatus.status, StageStatus.available);
      expect(stageWithStatus.clearTimeMs, isNull);
      expect(stageWithStatus.score, isNull);
    });

    test('clearTimeMs と score を指定できる', () {
      const stageWithStatus = StageWithStatus(
        stage: stage,
        status: StageStatus.cleared,
        clearTimeMs: 12345,
        score: 900,
      );

      expect(stageWithStatus.clearTimeMs, 12345);
      expect(stageWithStatus.score, 900);
    });

    test('copyWith でステータスを更新できる', () {
      const original = StageWithStatus(
        stage: stage,
        status: StageStatus.locked,
      );

      final updated = original.copyWith(status: StageStatus.cleared);

      expect(updated.status, StageStatus.cleared);
      expect(updated.stage, stage);
      expect(updated.clearTimeMs, isNull);
    });

    test('copyWith でクリアタイムを更新できる', () {
      const original = StageWithStatus(
        stage: stage,
        status: StageStatus.cleared,
        clearTimeMs: 5000,
        score: 700,
      );

      final updated = original.copyWith(clearTimeMs: 3000);

      expect(updated.clearTimeMs, 3000);
      expect(updated.score, 700);
      expect(updated.status, StageStatus.cleared);
    });

    test('copyWith でスコアを更新できる', () {
      const original = StageWithStatus(
        stage: stage,
        status: StageStatus.cleared,
        clearTimeMs: 5000,
        score: 700,
      );

      final updated = original.copyWith(score: 950);

      expect(updated.score, 950);
      expect(updated.clearTimeMs, 5000);
    });

    test('copyWith で何も指定しない場合は全フィールドが変わらない', () {
      const original = StageWithStatus(
        stage: stage,
        status: StageStatus.available,
        clearTimeMs: 4000,
        score: 600,
      );

      final copy = original.copyWith();

      expect(copy.stage, original.stage);
      expect(copy.status, original.status);
      expect(copy.clearTimeMs, original.clearTimeMs);
      expect(copy.score, original.score);
    });

    test('ロック状態のステージを作成できる', () {
      const stageWithStatus = StageWithStatus(
        stage: stage,
        status: StageStatus.locked,
      );
      expect(stageWithStatus.status, StageStatus.locked);
    });
  });
}