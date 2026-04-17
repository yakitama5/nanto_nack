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
      'chat' => ext.chatCategoryColor,
      'streaming' => ext.streamingCategoryColor,
      'map' => ext.mapCategoryColor,
      'alarm' => ext.alarmCategoryColor,
      'payment' => ext.paymentCategoryColor,
      'mail' => ext.shoppingCategoryColor,
      'news' => ext.newsCategoryColor,
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
                    title: Text(_categoryLabel(categoryId, t)),
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
                            // カテゴリ内での連番を使用する（表示はカテゴリ内1始まり）
                            final stageNumber = index + 1;
                            return StageCard(
                              stageNumber: stageNumber,
                              title: _stageTitle(item.stage.id, t),
                              status: item.status,
                              difficulty: item.stage.difficulty,
                              clearTimeMs: item.clearTimeMs,
                              score: item.score,
                              onTap: () =>
                                  _onStageTap(context, ref, item),
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

  String _categoryLabel(String categoryId, Translations t) {
    return switch (categoryId) {
      'shopping' => t.play.categoryLabel.shopping,
      'chat' => t.play.categoryLabel.chat,
      'streaming' => t.play.categoryLabel.streaming,
      'map' => t.play.categoryLabel.map,
      'alarm' => t.play.categoryLabel.alarm,
      'payment' => t.play.categoryLabel.payment,
      'mail' => t.play.categoryLabel.mail,
      'news' => t.play.categoryLabel.news,
      _ => categoryId,
    };
  }

  String _stageTitle(String stageId, Translations t) {
    return switch (stageId) {
      'shopping_water' => t.play.stageTitle.shopping_water,
      'shopping_checkout' => t.play.stageTitle.shopping_checkout,
      'shopping_reorder' => t.play.stageTitle.shopping_reorder,
      'shopping_cart' => t.play.stageTitle.shopping_cart,
      'chat_quiz1' => t.play.stageTitle.chat_quiz1,
      'chat_quiz2' => t.play.stageTitle.chat_quiz2,
      'chat_quiz3' => t.play.stageTitle.chat_quiz3,
      'chat_quiz4' => t.play.stageTitle.chat_quiz4,
      'streaming_quiz1' => t.play.stageTitle.streaming_quiz1,
      'streaming_quiz2' => t.play.stageTitle.streaming_quiz2,
      'streaming_quiz3' => t.play.stageTitle.streaming_quiz3,
      'streaming_quiz4' => t.play.stageTitle.streaming_quiz4,
      'map_quiz1' => t.play.stageTitle.map_quiz1,
      'map_quiz2' => t.play.stageTitle.map_quiz2,
      'map_quiz3' => t.play.stageTitle.map_quiz3,
      'map_quiz4' => t.play.stageTitle.map_quiz4,
      'alarm_quiz1' => t.play.stageTitle.alarm_quiz1,
      'alarm_quiz2' => t.play.stageTitle.alarm_quiz2,
      'alarm_quiz3' => t.play.stageTitle.alarm_quiz3,
      'alarm_quiz4' => t.play.stageTitle.alarm_quiz4,
      'payment_quiz1' => t.play.stageTitle.payment_quiz1,
      'payment_quiz2' => t.play.stageTitle.payment_quiz2,
      'payment_quiz3' => t.play.stageTitle.payment_quiz3,
      'payment_quiz4' => t.play.stageTitle.payment_quiz4,
      'mail_quiz1' => t.play.stageTitle.mail_quiz1,
      'mail_quiz2' => t.play.stageTitle.mail_quiz2,
      'mail_quiz3' => t.play.stageTitle.mail_quiz3,
      'mail_quiz4' => t.play.stageTitle.mail_quiz4,
      'news_quiz1' => t.play.stageTitle.news_quiz1,
      'news_quiz2' => t.play.stageTitle.news_quiz2,
      'news_quiz3' => t.play.stageTitle.news_quiz3,
      'news_quiz4' => t.play.stageTitle.news_quiz4,
      'calendar_quiz1' => t.play.stageTitle.calendar_quiz1,
      'calendar_quiz2' => t.play.stageTitle.calendar_quiz2,
      'calendar_quiz3' => t.play.stageTitle.calendar_quiz3,
      'calendar_quiz4' => t.play.stageTitle.calendar_quiz4,
      _ => stageId,
    };
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
      await ref.read(analyticsServiceProvider).logPlayLimitReached(
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

    if (context.mounted) {
      await ref.read(analyticsServiceProvider).logStageSelected(
            stageId: item.stage.id,
            categoryId: item.stage.category,
          );
      if (context.mounted) {
        // push が完了（クイズ画面が pop）したタイミングでリストを再取得する。
        // クイズ画面内で保存した結果を反映させるために invalidate が必要。
        await context.push(item.stage.routePath);
        ref.invalidate(stageListProvider);
      }
    }
  }
}
