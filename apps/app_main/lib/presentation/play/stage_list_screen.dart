import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:system/system.dart';

import '../../application/stage_list_provider.dart';
import '../../domain/category.dart';
import '../../domain/stage.dart';

class StageListScreen extends ConsumerWidget {
  const StageListScreen({super.key, required this.category});

  final QuizCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final stageListAsync = ref.watch(stageListProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<NantoNackThemeExtension>()!;
    final categoryColor = category.color(ext);

    return Scaffold(
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
          data: (stages) {
            final categoryStages = stages
                .where((s) => s.stage.category == category)
                .toList();

            return RefreshIndicator(
              onRefresh: () async => ref.invalidate(stageListProvider),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar.medium(
                    title: Text(category.label(t)),
                    centerTitle: false,
                    backgroundColor: colorScheme.surface,
                    foregroundColor: colorScheme.onSurface,
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => context.pop(),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: categoryColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            category.icon,
                            color: categoryColor,
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (categoryStages.isEmpty)
                    SliverFillRemaining(
                      child: Center(
                        child: Text(
                          t.play.noStages,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    )
                  else
                    SliverPadding(
                      padding: EdgeInsets.fromLTRB(
                        16,
                        16,
                        16,
                        MediaQuery.paddingOf(context).bottom + 24,
                      ),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.9,
                            ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final item = categoryStages[index];
                            final stageNumber = index + 1;
                            return StageCard(
                              stageNumber: stageNumber,
                              title: _stageTitle(item.stage.id, t),
                              status: item.status,
                              difficulty: item.stage.difficulty,
                              clearTimeMs: item.clearTimeMs,
                              score: item.score,
                              onTap: () => _onStageTap(context, ref, item),
                            );
                          },
                          childCount: categoryStages.length,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String _stageTitle(String stageId, Translations t) {
    try {
      return GenericQuizStage.fromId(stageId).label(t, category);
    } catch (_) {
      return stageId;
    }
  }

  Future<void> _onStageTap(
    BuildContext context,
    WidgetRef ref,
    StageWithStatus item,
  ) async {
    if (item.status == StageStatus.locked) return;

    final remoteConfig = ref.read(remoteConfigServiceProvider);
    if (remoteConfig.isPlayLimitEnabled) {
      final userStatusRepo = ref.read(userStatusRepositoryProvider);
      final isLimitReached = await userStatusRepo.isLimitReached(
        dailyLimit: remoteConfig.dailyPlayLimit,
      );
      if (isLimitReached && context.mounted) {
        await ref
            .read(analyticsServiceProvider)
            .logPlayLimitReached(
              stageId: item.stage.id,
            );
        if (context.mounted) {
          await PlayLimitModal.show(
            context,
            onUpgrade: () {
              // TODO: IAP 実装後に課金フローへ
            },
          );
        }
        return;
      }
    }

    if (context.mounted) {
      await ref
          .read(analyticsServiceProvider)
          .logStageSelected(
            stageId: item.stage.id,
            categoryId: item.stage.category.id,
          );
      if (context.mounted) {
        await context.push(item.stage.routePath);
        ref.invalidate(stageListProvider);
      }
    }
  }
}
