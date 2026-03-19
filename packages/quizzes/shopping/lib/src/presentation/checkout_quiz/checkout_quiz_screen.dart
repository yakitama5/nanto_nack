import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/presentation/checkout_quiz/checkout_quiz_notifier.dart';
import 'package:shopping/src/presentation/checkout_quiz/checkout_quiz_state.dart';

class CheckoutQuizScreen extends ConsumerStatefulWidget {
  const CheckoutQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<CheckoutQuizScreen> createState() =>
      _CheckoutQuizScreenState();
}

class _CheckoutQuizScreenState extends ConsumerState<CheckoutQuizScreen> {
  final _addressController = TextEditingController();
  static const _timeLimitSeconds = 90;
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(checkoutQuizProvider.notifier).startQuiz();
    });
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(checkoutQuizProvider);

    // 住所変更をNotifierに反映（コントローラとの同期）
    ref.listen<CheckoutQuizState>(checkoutQuizProvider, (prev, next) {
      if (next.address != _addressController.text) {
        _addressController.text = next.address;
      }
    });

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
                  onChanged: (v) =>
                      ref.read(checkoutQuizProvider.notifier).updateAddress(v),
                ),
                const SizedBox(height: 24),
                Text(
                  'お支払い方法',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                ...['クレジットカード', 'コンビニ払い', '代金引換'].map(
                  (method) => RadioListTile<String>(
                    title: Text(method),
                    value: method,
                    groupValue: quizState.selectedPayment,
                    onChanged: (v) {
                      if (v != null) {
                        ref
                            .read(checkoutQuizProvider.notifier)
                            .selectPayment(v);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16),
                CheckboxListTile(
                  title: const Text('注文内容を確認しました'),
                  value: quizState.isConfirmed,
                  onChanged: (v) => ref
                      .read(checkoutQuizProvider.notifier)
                      .toggleConfirmed(value: v ?? false),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: quizState.status == QuizStatus.playing
                        ? () =>
                            ref.read(checkoutQuizProvider.notifier).confirm()
                        : null,
                    child: const Text('注文を確定する'),
                  ),
                ),
              ],
            ),
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
              missionText: '購入手続きを完了してください',
              hintUsed: false,
              timeLimitSeconds: _timeLimitSeconds,
            ),
          ),
        // カットイン演出
        if (_showCutIn)
          MissionCutIn(
            missionText: '購入手続きを完了してください',
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
                ref.read(checkoutQuizProvider.notifier).retry();
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
