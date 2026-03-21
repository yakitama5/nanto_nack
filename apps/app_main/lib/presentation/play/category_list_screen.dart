import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../domain/category.dart';
import '../../domain/stage.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: MaxWidthBox(
        maxWidth: 800,
        child: CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              title: Text(t.play.selectCategory),
              centerTitle: false,
              backgroundColor: colorScheme.surface,
              foregroundColor: colorScheme.onSurface,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
                child: Text(
                  t.play.selectCategoryDescription,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: kAllCategories.length,
                itemBuilder: (context, index) {
                  final category = kAllCategories[index];
                  final stageCount = kAllStages
                      .where((s) => s.category == category.id)
                      .length;
                  return _CategoryCard(
                    category: category,
                    stageCount: stageCount,
                    onTap: () =>
                        context.push('/play/${category.id}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.category,
    required this.stageCount,
    required this.onTap,
  });

  final Category category;
  final int stageCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final ext =
        Theme.of(context).extension<NantoNackThemeExtension>()!;
    final colorScheme = Theme.of(context).colorScheme;

    final categoryColor = _categoryColor(category.id, ext);
    final categoryContainerColor =
        _categoryContainerColor(category.id, ext);

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: categoryColor.withValues(alpha: 0.3),
        ),
      ),
      color: categoryContainerColor,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: categoryColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  category.icon,
                  size: 28,
                  color: categoryColor,
                ),
              ),
              const Spacer(),
              Text(
                category.label,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                t.play.stageCount.replaceAll(
                  '{count}',
                  stageCount.toString(),
                ),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: categoryColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _categoryColor(String categoryId, NantoNackThemeExtension ext) {
    return switch (categoryId) {
      'shopping' => ext.shoppingCategoryColor,
      _ => ext.shoppingCategoryColor,
    };
  }

  Color _categoryContainerColor(
    String categoryId,
    NantoNackThemeExtension ext,
  ) {
    return switch (categoryId) {
      'shopping' => ext.shoppingCategoryContainerColor,
      _ => ext.shoppingCategoryContainerColor,
    };
  }
}
