import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:system/system.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../application/tutorial/tutorial_notifier.dart';
import '../../domain/category.dart';
import '../../domain/stage.dart';
import '../tutorial/nantom_speech_bubble.dart';

class CategoryListScreen extends ConsumerStatefulWidget {
  const CategoryListScreen({super.key});

  @override
  ConsumerState<CategoryListScreen> createState() =>
      _CategoryListScreenState();
}

class _CategoryListScreenState extends ConsumerState<CategoryListScreen> {
  final _shoppingCardKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeShowTutorial());
  }

  Future<void> _maybeShowTutorial() async {
    final tutState = await ref.read(tutorialNotifierProvider.future);
    if (!mounted) return;
    if (!tutState.isCompleted &&
        tutState.screen == TutorialScreen.categoryList) {
      // プロバイダーロード完了後、ウィジェットが再ビルドされるまで待つ
      // （_shoppingCardKey がウィジェットに設定されてから表示する）
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _showTutorial();
      });
    }
  }

  void _showTutorial() {
    // 画面が最前面にあること・ターゲットキーが設定されていることを確認
    if (ModalRoute.of(context)?.isCurrent != true) return;
    if (_shoppingCardKey.currentContext == null) return;

    final t = Translations.of(context);

    final targets = [
      // Step 4: Shopping カテゴリタイル（笑顔）
      TargetFocus(
        identify: 'category_shopping',
        keyTarget: _shoppingCardKey,
        shape: ShapeLightFocus.RRect,
        radius: 20,
        paddingFocus: 8,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (ctx, ctl) => NantomSpeechBubble(
              expression: NantomExpression.smile,
              text: t.tutorial.step4,
            ),
          ),
        ],
      ),
    ];

    void navigateToWaterQuiz() {
      ref
          .read(tutorialNotifierProvider.notifier)
          .advanceTo(TutorialScreen.waterQuiz);
      context.push('/shopping/water', extra: true);
    }

    TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black,
      opacityShadow: 0.85,
      textSkip: t.tutorial.skip,
      skipWidget: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
        ),
        child: Text(
          t.tutorial.skip,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onClickTarget: (target) {
        if (target.identify == 'category_shopping') {
          navigateToWaterQuiz();
        }
      },
      onClickOverlay: (target) {
        if (target.identify == 'category_shopping') {
          navigateToWaterQuiz();
        }
      },
      onFinish: () {
        // コーチマーク自体の完了（ターゲットクリック後に呼ばれる）
      },
      onSkip: () {
        // ウィジェットツリーのビルド中に provider を更新するとエラーになるため遅延させる
        Future.microtask(
          () => ref.read(tutorialNotifierProvider.notifier).complete(),
        );
        return true;
      },
    ).show(context: context);
  }

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
              padding: EdgeInsets.fromLTRB(
                16,
                16,
                16,
                MediaQuery.paddingOf(context).bottom + 24,
              ),
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
                  // Shopping カードは常にキーを設定（チュートリアルのタイミング問題を避けるため）
                  final cardKey =
                      category.id == 'shopping' ? _shoppingCardKey : null;
                  return Consumer(
                    builder: (context, ref, _) => _CategoryCard(
                      key: cardKey,
                      category: category,
                      stageCount: stageCount,
                      onTap: () {
                        ref
                            .read(analyticsServiceProvider)
                            .logCategorySelected(
                              categoryId: category.id,
                            );
                        context.push('/play/${category.id}');
                      },
                    ),
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
    super.key,
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

    // Coming Soon の場合はグレースケール表示
    final effectiveColor = category.isComingSoon
        ? colorScheme.onSurfaceVariant.withValues(alpha: 0.4)
        : categoryColor;
    final effectiveContainerColor = category.isComingSoon
        ? colorScheme.surfaceContainerHighest.withValues(alpha: 0.5)
        : categoryContainerColor;

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: effectiveColor.withValues(alpha: 0.3),
        ),
      ),
      color: effectiveContainerColor,
      child: InkWell(
        onTap: category.isComingSoon ? null : onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: effectiveColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      category.icon,
                      size: 28,
                      color: effectiveColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    _categoryLabel(category.id, t),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: category.isComingSoon
                              ? colorScheme.onSurfaceVariant
                              : colorScheme.onSurface,
                        ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    category.isComingSoon
                        ? 'Coming Soon'
                        : t.play.stageCount.replaceAll(
                            '{count}',
                            stageCount.toString(),
                          ),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: effectiveColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              // Coming Soon バッジ
              if (category.isComingSoon)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.onSurfaceVariant.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.lock_outline,
                          size: 10,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          t.play.comingSoon,
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    fontSize: 10,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
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
      'calendar' => t.play.categoryLabel.calendar,
      _ => categoryId,
    };
  }

  Color _categoryColor(String categoryId, NantoNackThemeExtension ext) {
    return switch (categoryId) {
      'shopping' => ext.shoppingCategoryColor,
      'chat' => ext.chatCategoryColor,
      'streaming' => ext.streamingCategoryColor,
      'map' => ext.mapCategoryColor,
      'alarm' => ext.alarmCategoryColor,
      'payment' => ext.paymentCategoryColor,
      'mail' => ext.mailCategoryColor,
      'news' => ext.newsCategoryColor,
      'calendar' => ext.calendarCategoryColor,
      _ => ext.shoppingCategoryColor,
    };
  }

  Color _categoryContainerColor(
    String categoryId,
    NantoNackThemeExtension ext,
  ) {
    return switch (categoryId) {
      'shopping' => ext.shoppingCategoryContainerColor,
      'chat' => ext.chatCategoryContainerColor,
      'streaming' => ext.streamingCategoryContainerColor,
      'map' => ext.mapCategoryContainerColor,
      'alarm' => ext.alarmCategoryContainerColor,
      'payment' => ext.paymentCategoryContainerColor,
      'mail' => ext.mailCategoryContainerColor,
      'news' => ext.newsCategoryContainerColor,
      'calendar' => ext.calendarCategoryContainerColor,
      _ => ext.shoppingCategoryContainerColor,
    };
  }
}
