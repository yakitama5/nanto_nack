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
  const StageListScreen({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final stageListAsync = ref.watch(stageListProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<NantoNackThemeExtension>()!;
    final category = kAllCategories.firstWhere(
      (c) => c.id == categoryId,
      orElse: () => kAllCategories.first,
    );

    final categoryColor = switch (categoryId) {
      'shopping' => ext.shoppingCategoryColor,
      _ => colorScheme.primary,
    };

    return Scaffold(
      body: MaxWidthBox(
        maxWidth: 800,
        child: stageListAsync.when(
          loading: () =>
              const Center(child: CircularProgressIndicator()),
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
                .where((s) => s.stage.category == categoryId)
                .toList();

            return RefreshIndicator(
              onRefresh: () async =>
                  ref.invalidate(stageListProvider),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar.medium(
                    title: Text(category.label),
                    centerTitle: false,
                    backgroundColor: colorScheme.surface,
                    foregroundColor: colorScheme.onSurface,
                    // カテゴリーアイコンを表示
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
                          'ステージがありません',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    )
                  else
                    SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverList.builder(
                        itemCount: categoryStages.length,
                        itemBuilder: (context, index) {
                          final item = categoryStages[index];
                          // 全ステージの中でのインデックスを計算
                          final globalIndex = kAllStages.indexWhere(
                            (s) => s.id == item.stage.id,
                          );
                          final stageNumber = globalIndex + 1;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: StageCard(
                              stageNumber: stageNumber,
                              title: item.stage.title,
                              status: item.status,
                              clearTimeMs: item.clearTimeMs,
                              score: item.score,
                              onTap: () =>
                                  _onStageTap(context, ref, item),
                            ),
                          );
                        },
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

  Future<void> _onStageTap(
    BuildContext context,
    WidgetRef ref,
    StageWithStatus item,
  ) async {
    if (item.status == StageStatus.locked) return;

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
      // push が完了（クイズ画面が pop）したタイミングでリストを再取得する。
      // クイズ画面内で保存した結果を反映させるために invalidate が必要。
      await context.push(item.stage.routePath);
      ref.invalidate(stageListProvider);
    }
  }
}
