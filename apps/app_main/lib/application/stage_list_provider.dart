import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../domain/stage.dart';

/// ステージ一覧をDriftのクリア状況と組み合わせて返す AsyncNotifierProvider
final stageListProvider =
    AsyncNotifierProvider<StageListNotifier, List<StageWithStatus>>(
  StageListNotifier.new,
);

class StageListNotifier extends AsyncNotifier<List<StageWithStatus>> {
  @override
  Future<List<StageWithStatus>> build() async {
    return _buildStageList();
  }

  Future<List<StageWithStatus>> _buildStageList() async {
    final repo = ref.watch(quizResultRepositoryProvider);
    final stages = kAllStages;
    final results = <StageWithStatus>[];

    for (var i = 0; i < stages.length; i++) {
      final stage = stages[i];
      final result = await repo.findById(stage.id);

      final StageStatus status;
      if (result != null && result.isCleared) {
        status = StageStatus.cleared;
      } else {
        // 同カテゴリ内での前のステージを探す
        Stage? sameCategoryPrev;
        for (var j = i - 1; j >= 0; j--) {
          if (stages[j].category == stage.category) {
            sameCategoryPrev = stages[j];
            break;
          }
        }

        if (sameCategoryPrev == null) {
          // カテゴリ内の最初のステージは常に解放
          status = StageStatus.available;
        } else {
          // 同カテゴリの前のステージがクリア済みなら解放
          final prevResult = await repo.findById(sameCategoryPrev.id);
          status = (prevResult != null && prevResult.isCleared)
              ? StageStatus.available
              : StageStatus.locked;
        }
      }

      results.add(
        StageWithStatus(
          stage: stage,
          status: status,
          clearTimeMs: result?.clearTimeMs,
          score: result?.score,
        ),
      );
    }

    return results;
  }

  /// クリア結果を保存してリストを再構築
  Future<void> onQuizCleared({
    required String quizId,
    required int clearTimeMs,
    required int score,
    required int failureCount,
  }) async {
    final repo = ref.read(quizResultRepositoryProvider);
    await repo.logPlay(
      quizId: quizId,
      isCleared: true,
      score: score,
      failureCount: failureCount,
    );
    await repo.saveBestRecord(
      quizId: quizId,
      isCleared: true,
      clearTimeMs: clearTimeMs,
      score: score,
      failureCount: failureCount,
    );
    ref.invalidateSelf();
  }
}
