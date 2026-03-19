import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/application/quiz_checkout_use_case.dart';

class CheckoutQuizScreen extends ConsumerStatefulWidget {
  const CheckoutQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<CheckoutQuizScreen> createState() =>
      _CheckoutQuizScreenState();
}

class _CheckoutQuizScreenState extends ConsumerState<CheckoutQuizScreen> {
  final _useCase = const QuizCheckoutUseCase();
  final _addressController = TextEditingController();
  String? _selectedPayment;
  bool _isConfirmed = false;
  QuizStatus _status = QuizStatus.playing;
  DateTime? _startedAt;
  int _elapsedMs = 0;
  int _failureCount = 0;

  @override
  void initState() {
    super.initState();
    _startedAt = DateTime.now();
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  void _onConfirm() {
    final elapsed = DateTime.now().difference(_startedAt!).inMilliseconds;
    final isAddressEntered = _addressController.text.trim().isNotEmpty;

    setState(() {
      _elapsedMs = elapsed;
      if (_useCase.isClear(
        isAddressEntered: isAddressEntered,
        isPaymentSelected: _selectedPayment != null,
        isConfirmed: _isConfirmed,
      )) {
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
      _isConfirmed = false;
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
          appBar: AppBar(title: const Text('NantoMall - お支払い')),
          body: SingleChildScrollView(
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
                          child: Text('ミッション: 購入手続きを完了してください'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'お届け先住所',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '例: 東京都渋谷区...',
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'お支払い方法',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                RadioGroup<String>(
                  groupValue: _selectedPayment,
                  onChanged: (v) => setState(() => _selectedPayment = v),
                  child: Column(
                    children: ['クレジットカード', 'コンビニ払い', '代金引換']
                        .map(
                          (method) => RadioListTile<String>(
                            title: Text(method),
                            value: method,
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 16),
                CheckboxListTile(
                  title: const Text('注文内容を確認しました'),
                  value: _isConfirmed,
                  onChanged: (v) => setState(() => _isConfirmed = v ?? false),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _onConfirm,
                    child: const Text('注文を確定する'),
                  ),
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
