import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/domain/entities/cart_item.dart';
import 'package:system/system.dart';
import 'package:shopping/src/domain/shopping_quiz_config.dart';
import 'package:shopping/src/i18n/shopping_translations_extension.dart';
import 'package:shopping/src/presentation/shopping_app.dart';
import 'package:shopping/src/presentation/water_quiz/water_quiz_notifier.dart';

class WaterQuizScreen extends ConsumerStatefulWidget {
  const WaterQuizScreen({
    super.key,
    this.onCompleted,
    this.timerBubbleKey,
    this.onMissionCutInFinished,
    this.waterItemKey,
  });

  final VoidCallback? onCompleted;

  /// チュートリアル用：FloatingMissionBubble に設定する GlobalKey。
  final GlobalKey? timerBubbleKey;

  /// チュートリアル用：MissionCutIn 完了後に呼ばれるコールバック。
  final VoidCallback? onMissionCutInFinished;

  /// チュートリアル用：water_pura_aqua アイテムタイルに設定する GlobalKey。
  final GlobalKey? waterItemKey;

  @override
  ConsumerState<WaterQuizScreen> createState() => _WaterQuizScreenState();
}

class _WaterQuizScreenState extends ConsumerState<WaterQuizScreen> {
  bool _showCutIn = true;

  // リトライ時に ShoppingApp の内部状態（検索クエリ・ナビ選択等）を
  // リセットするためのキー。インクリメントで再生成を促す。
  int _appKey = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(waterQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(waterQuizProvider);
    final missionText = context.s.water.missionText;

    return ShoppingApp(
      key: ValueKey(_appKey),
      cart: quizState.cart,
      onAddToCart: (CartItem item) =>
          ref.read(waterQuizProvider.notifier).addToCart(item),
      onUpdateQuantity: (String id, int qty) =>
          ref.read(waterQuizProvider.notifier).updateQuantity(id, qty),
      onRemoveFromCart: (String id) =>
          ref.read(waterQuizProvider.notifier).removeFromCart(id),
      onPurchase: () => ref.read(waterQuizProvider.notifier).purchase(),
      highlightedItemId: quizState.hintItemId,
      quizStatus: quizState.status,
      remainingSeconds: quizState.remainingSeconds,
      missionText: missionText,
      hintUsed: quizState.hintUsed,
      timeLimitSeconds: ShoppingQuizConfig.waterTimeLimitSeconds,
      onHintTap: () => ref.read(waterQuizProvider.notifier).useHint(),
      onGiveUp: () => ref.read(waterQuizProvider.notifier).giveUp(),
      cartBottomSheetBuilder: (context) => const _WaterCartSheet(),
      timerBubbleKey: widget.timerBubbleKey,
      waterItemKey: widget.waterItemKey,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: ShoppingQuizConfig.waterTimeLimitSeconds,
            onFinished: () {
              setState(() => _showCutIn = false);
              widget.onMissionCutInFinished?.call();
            },
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
                ref.read(waterQuizProvider.notifier).retry();
              },
              onNext: quizState.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              isLimitReached: ref.watch(isPlayLimitReachedProvider).valueOrNull ?? false,
              insight: Builder(
                builder: (context) {
                  final insight = context.s.water.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '🛒',
                        title: insight.iconTitle,
                        desc: insight.iconDesc,
                      ),
                      QuizInsightItem(
                        emoji: '🎨',
                        title: insight.colorTitle,
                        desc: insight.colorDesc,
                      ),
                      QuizInsightItem(
                        emoji: '📱',
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

class _WaterCartSheet extends ConsumerWidget {
  const _WaterCartSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(waterQuizProvider);
    return AmazonCartSheet(
      cart: state.cart,
      onRemoveFromCart: (String id) =>
          ref.read(waterQuizProvider.notifier).removeFromCart(id),
      onPurchase: () {
        Navigator.of(context).pop();
        ref.read(waterQuizProvider.notifier).purchase();
      },
    );
  }
}

