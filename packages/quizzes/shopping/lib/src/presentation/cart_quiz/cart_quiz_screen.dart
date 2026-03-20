import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/domain/entities/cart_item.dart';
import 'package:shopping/src/domain/entities/shopping_cart.dart';
import 'package:shopping/src/presentation/cart_quiz/cart_quiz_notifier.dart';

/// カートの合計金額を当てるクイズ画面
class CartQuizScreen extends ConsumerStatefulWidget {
  const CartQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<CartQuizScreen> createState() => _CartQuizScreenState();
}

class _CartQuizScreenState extends ConsumerState<CartQuizScreen> {
  bool _showCutIn = true;

  // クイズ問題として使用するカート（固定データ）
  static final _cart = ShoppingCart(
    items: const [
      CartItem(id: 'water_500ml', name: '天然水 500ml', price: 100, quantity: 3),
      CartItem(id: 'tea_500ml', name: '緑茶 500ml', price: 150, quantity: 2),
      CartItem(
        id: 'coffee_500ml',
        name: 'ブラックコーヒー 500ml',
        price: 180,
        quantity: 1,
      ),
    ],
  );

  static const _choices = [480, 580, 630, 750];
  static const _timeLimitSeconds = 60;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(cartQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(cartQuizProvider);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: const Text('NantoMall - カート確認')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ミッションカード
                Card(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.assignment,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text('ミッション: このカートの合計金額を選んでください'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'カートの中身',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                ..._cart.items.map(
                  (item) => ListTile(
                    title: Text(item.name),
                    trailing: Text(
                      '¥${item.price} × ${item.quantity} = ¥${item.totalPrice}',
                    ),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 16),
                Text(
                  '合計金額はいくらですか？',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: _choices
                      .map(
                        (c) => ChoiceChip(
                          label: Text('¥$c'),
                          selected: quizState.selectedChoice == c,
                          onSelected: (_) => ref
                              .read(cartQuizProvider.notifier)
                              .selectChoice(choice: c, cart: _cart),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
        // フローティングミッションバー
        if (quizState.status == QuizStatus.playing)
          Positioned(
            top: MediaQuery.paddingOf(context).top + 8,
            left: 16,
            right: 16,
            child: FloatingMissionBar(
              remainingSeconds: quizState.remainingSeconds,
              missionText: 'このカートの合計金額を選んでください',
              hintUsed: quizState.hintUsed,
              timeLimitSeconds: _timeLimitSeconds,
              onHintTap: () =>
                  ref.read(cartQuizProvider.notifier).useHint(),
            ),
          ),
        // カットイン演出
        if (_showCutIn)
          MissionCutIn(
            missionText: 'このカートの合計金額を選んでください',
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
                ref.read(cartQuizProvider.notifier).retry();
              },
              onNext: quizState.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
            ),
          ),
      ],
    );
  }
}
