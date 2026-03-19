import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/application/quiz_cart_use_case.dart';
import 'package:shopping/src/domain/entities/cart_item.dart';
import 'package:shopping/src/domain/entities/shopping_cart.dart';

/// カートの合計金額を当てるクイズ画面
class CartQuizScreen extends ConsumerStatefulWidget {
  const CartQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<CartQuizScreen> createState() => _CartQuizScreenState();
}

class _CartQuizScreenState extends ConsumerState<CartQuizScreen> {
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

  final _useCase = const QuizCartUseCase();
  QuizStatus _status = QuizStatus.idle;
  int _failureCount = 0;
  DateTime? _startedAt;
  int _elapsedMs = 0;
  int? _selectedChoice;

  @override
  void initState() {
    super.initState();
    _startedAt = DateTime.now();
    _status = QuizStatus.playing;
  }

  void _onChoiceTap(int choice) {
    if (_status != QuizStatus.playing) return;
    final elapsed = DateTime.now().difference(_startedAt!).inMilliseconds;

    setState(() {
      _selectedChoice = choice;
      _elapsedMs = elapsed;
      if (_useCase.isClear(cart: _cart, selectedTotal: choice)) {
        _status = QuizStatus.correct;
      } else {
        _status = QuizStatus.incorrect;
        _failureCount++;
      }
    });
  }

  void _retry() {
    setState(() {
      _status = QuizStatus.playing;
      _startedAt = DateTime.now();
      _selectedChoice = null;
    });
  }

  int get _score {
    if (_status != QuizStatus.correct) return 0;
    const baseScore = 1000;
    final penalty = (_elapsedMs / 100).floor();
    final failurePenalty = _failureCount * 100;
    return (baseScore - penalty - failurePenalty).clamp(0, baseScore);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: const Text('NantoMall - カート確認')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          selected: _selectedChoice == c,
                          onSelected: (_) => _onChoiceTap(c),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
        if (_status == QuizStatus.correct || _status == QuizStatus.incorrect)
          Positioned.fill(
            child: QuizResultOverlay(
              status: _status,
              score: _score,
              elapsedMs: _elapsedMs,
              onRetry: _retry,
              onNext: _status == QuizStatus.correct ? widget.onCompleted : null,
            ),
          ),
      ],
    );
  }
}
