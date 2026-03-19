import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:system/system.dart';

import '../../application/stage_list_provider.dart';
import '../../domain/stage.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stageListAsync = ref.watch(stageListProvider);
    final t = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.app.title),
        centerTitle: true,
      ),
      body: MaxWidthBox(
        maxWidth: 800,
        child: stageListAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(t.error.unknown),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => ref.invalidate(stageListProvider),
                  child: Text(t.error.retry),
                ),
              ],
            ),
          ),
          data: (stages) => _StageListView(stages: stages),
        ),
      ),
    );
  }
}

class _StageListView extends ConsumerWidget {
  const _StageListView({required this.stages});

  final List<StageWithStatus> stages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: stages.length,
      itemBuilder: (context, index) {
        final item = stages[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: StageCard(
            stageNumber: index + 1,
            title: item.stage.title,
            status: item.status,
            clearTimeMs: item.clearTimeMs,
            score: item.score,
            onTap: () => _onStageTap(context, ref, item),
          ),
        );
      },
    );
  }

  Future<void> _onStageTap(
    BuildContext context,
    WidgetRef ref,
    StageWithStatus item,
  ) async {
    if (item.status == StageStatus.locked) return;

    // プレイ上限チェック
    final userStatusRepo = ref.read(userStatusRepositoryProvider);
    final isLimited = await userStatusRepo.isLimitReached();
    if (isLimited && context.mounted) {
      await PlayLimitModal.show(
        context,
        onUpgrade: () {
          // TODO: IAP 実装後に課金フローへ
        },
      );
      return;
    }

    if (context.mounted) {
      context.push(item.stage.routePath);
    }
  }
}
