import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/domain/catalog.dart';
import 'package:shopping/src/domain/entities/cart_item.dart';
import 'package:shopping/src/presentation/cart_badge.dart';
import 'package:shopping/src/presentation/shopping_item_tile.dart';
import 'package:shopping/src/presentation/water_quiz/water_quiz_notifier.dart';
import 'package:shopping/src/presentation/water_quiz/water_quiz_state.dart';

class WaterQuizScreen extends ConsumerStatefulWidget {
  const WaterQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<WaterQuizScreen> createState() => _WaterQuizScreenState();
}

class _WaterQuizScreenState extends ConsumerState<WaterQuizScreen> {
  static const _missionText = '水を2つ購入してください';
  static const _timeLimitSeconds = 60;

  bool _showCutIn = true;

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

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('NantoMall'),
            actions: [
              CartBadge(
                count: quizState.cart.totalCount,
                onTap: () => _showCart(context),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: kShoppingCatalog.length,
                  itemBuilder: (context, index) {
                    final item = kShoppingCatalog[index];
                    final isHinted = quizState.hintItemId == item.id;
                    return ShoppingItemTile(
                      item: item,
                      highlighted: isHinted,
                      onAddToCart: () =>
                          ref.read(waterQuizProvider.notifier).addToCart(
                                CartItem(
                                  id: item.id,
                                  name: item.name,
                                  price: item.price,
                                  quantity: 1,
                                ),
                              ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // フローティングミッションバー
        if (quizState.status == QuizStatus.playing)
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 16,
            right: 16,
            child: FloatingMissionBar(
              remainingSeconds: quizState.remainingSeconds,
              missionText: _missionText,
              hintUsed: quizState.hintUsed,
              timeLimitSeconds: _timeLimitSeconds,
              onHintTap: () =>
                  ref.read(waterQuizProvider.notifier).useHint(),
            ),
          ),
        // カットイン演出（クイズ開始時のみ）
        if (_showCutIn)
          MissionCutIn(
            missionText: _missionText,
            timeLimitSeconds: _timeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
          ),
        // 正誤結果オーバーレイ
        if (quizState.status == QuizStatus.correct ||
            quizState.status == QuizStatus.incorrect ||
            quizState.status == QuizStatus.timeUp)
          Positioned.fill(
            child: QuizResultOverlay(
              status: quizState.status,
              score: quizState.score,
              elapsedMs: quizState.elapsedMs,
              onRetry: () {
                setState(() => _showCutIn = true);
                ref.read(waterQuizProvider.notifier).retry();
              },
              onNext: quizState.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
            ),
          ),
      ],
    );
  }

  void _showCart(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => const _CartBottomSheet(),
    );
  }
}

class _CartBottomSheet extends ConsumerWidget {
  const _CartBottomSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(waterQuizProvider);
    final cart = quizState.cart;

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'カート',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          if (cart.isEmpty)
            const Padding(
              padding: EdgeInsets.all(32),
              child: Text('カートは空です'),
            )
          else ...[
            ...cart.items.map(
              (item) => ListTile(
                title: Text(item.name),
                subtitle: Text('¥${item.price} × ${item.quantity}'),
                trailing: Text('¥${item.totalPrice}'),
                leading: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => ref
                      .read(waterQuizProvider.notifier)
                      .removeFromCart(item.id),
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('合計'),
                  Text(
                    '¥${cart.totalPrice}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    ref.read(waterQuizProvider.notifier).purchase();
                  },
                  child: const Text('購入する'),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
