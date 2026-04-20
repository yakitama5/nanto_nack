import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/domain/entities/cart_item.dart';
import 'package:system/system.dart';
import 'package:shopping/src/domain/shopping_quiz_config.dart';
import 'package:shopping/src/i18n/shopping_translations_extension.dart';
import 'package:shopping/src/presentation/reorder_quiz/reorder_quiz_notifier.dart';
import 'package:shopping/src/presentation/shopping_app.dart';

class ReorderQuizScreen extends ConsumerStatefulWidget {
  const ReorderQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<ReorderQuizScreen> createState() => _ReorderQuizScreenState();
}

class _ReorderQuizScreenState extends ConsumerState<ReorderQuizScreen> {
  bool _showCutIn = true;

  // リトライ時に ShoppingApp の内部状態をリセットするキー
  int _appKey = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(reorderQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(reorderQuizProvider);
    final missionText = context.s.reorder.missionText;

    return ShoppingApp(
      key: ValueKey(_appKey),
      cart: quizState.cart,
      onAddToCart: (CartItem item) =>
          ref.read(reorderQuizProvider.notifier).addToCart(item),
      onUpdateQuantity: (String id, int qty) =>
          ref.read(reorderQuizProvider.notifier).updateQuantity(id, qty),
      onRemoveFromCart: (String id) =>
          ref.read(reorderQuizProvider.notifier).removeFromCart(id),
      onPurchase: () => ref.read(reorderQuizProvider.notifier).purchase(),
      highlightedItemId: null,
      quizStatus: quizState.status,
      remainingSeconds: quizState.remainingSeconds,
      missionText: missionText,
      hintUsed: quizState.hintUsed,
      timeLimitSeconds: ShoppingQuizConfig.reorderTimeLimitSeconds,
      hintNavIndex: 2,
      onHintTap: () => ref.read(reorderQuizProvider.notifier).useHint(),
      onGiveUp: () => ref.read(reorderQuizProvider.notifier).giveUp(),
      cartBottomSheetBuilder: (context) => const _ReorderCartSheet(),
      recentOrder: ShoppingRecentOrder(
        targetItemId: quizState.targetItemId,
        isPlayable: quizState.status == QuizStatus.playing,
        onReorder: () =>
            ref.read(reorderQuizProvider.notifier).reorderFromHistory(),
      ),
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: ShoppingQuizConfig.reorderTimeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
          ),
        if (quizState.status == QuizStatus.correct ||
            quizState.status == QuizStatus.incorrect ||
            quizState.status == QuizStatus.timeUp ||
            quizState.status == QuizStatus.giveUp)
          Positioned.fill(
            child: QuizResultOverlay(
              status: quizState.status,
              score: quizState.score,
              elapsedMs: quizState.elapsedMs,
              onRetry: () {
                setState(() {
                  _showCutIn = true;
                  _appKey++;
                });
                ref.read(reorderQuizProvider.notifier).retry();
              },
              onNext: quizState.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              isLimitReached: ref.isPlayLimitReached,
              insight: Builder(
                builder: (context) {
                  final insight = context.s.reorder.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '🖼️',
                        title: insight.imageTitle,
                        desc: insight.imageDesc,
                      ),
                      QuizInsightItem(
                        emoji: '💰',
                        title: insight.priceTitle,
                        desc: insight.priceDesc,
                      ),
                      QuizInsightItem(
                        emoji: '🔄',
                        title: insight.patternTitle,
                        desc: insight.patternDesc,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}

// ─── カートシート（リアクティブ更新のため ConsumerWidget） ─────────────────

class _ReorderCartSheet extends ConsumerWidget {
  const _ReorderCartSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reorderQuizProvider);
    return AmazonCartSheet(
      cart: state.cart,
      onRemoveFromCart: (String id) =>
          ref.read(reorderQuizProvider.notifier).removeFromCart(id),
      onPurchase: () {
        Navigator.of(context).pop();
        ref.read(reorderQuizProvider.notifier).purchase();
      },
    );
  }
}

