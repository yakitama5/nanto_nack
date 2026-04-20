import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/domain/shopping_quiz_config.dart';
import 'package:system/system.dart';
import 'package:shopping/src/i18n/shopping_translations_extension.dart';
import 'package:shopping/src/presentation/checkout_quiz/checkout_quiz_notifier.dart';
import 'package:shopping/src/presentation/checkout_quiz/checkout_quiz_state.dart';

class CheckoutQuizScreen extends ConsumerStatefulWidget {
  const CheckoutQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<CheckoutQuizScreen> createState() => _CheckoutQuizScreenState();
}

class _CheckoutQuizScreenState extends ConsumerState<CheckoutQuizScreen> {
  final _addressController = TextEditingController();
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
    final ext = Theme.of(context).extension<ShoppingAppTheme>()!;
    final quizState = ref.watch(checkoutQuizProvider);
    final missionText = context.s.checkout.missionText;
    final qt = context.sq.checkout;

    // 住所変更をNotifierに反映（コントローラとの同期）
    ref.listen<CheckoutQuizState>(checkoutQuizProvider, (prev, next) {
      if (next.address != _addressController.text) {
        _addressController.text = next.address;
      }
    });

    return QuizExitScope(
      quizStatus: quizState.status,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: ext.scaffoldBackground,
            appBar: AppBar(
              backgroundColor: ext.navyColor,
              title: UnreadableText(
                qt.appTitle,
                isObfuscated: true,
                animateOnObfuscate: false,
                style: const TextStyle(color: Colors.white),
              ),
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // ステップインジケーター
                  _StepIndicator(currentStep: 2),
                  const SizedBox(height: 8),
                  // 1. お届け先住所
                  _SectionCard(
                    icon: Icons.location_on_outlined,
                    title: qt.addressSection,
                    child: TextField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: CustomLanguageEncoder.encode(
                          qt.addressPlaceholder,
                        ),
                        filled: true,
                        fillColor: ext.surfaceColor,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ext.subTextColor),
                        ),
                      ),
                      onChanged: (v) => ref
                          .read(checkoutQuizProvider.notifier)
                          .updateAddress(v),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // 2. お支払い方法
                  _SectionCard(
                    icon: Icons.credit_card,
                    title: qt.paymentSection,
                    child: _PaymentMethodGroup(
                      selectedPayment: quizState.selectedPayment,
                      onChanged: (v) {
                        if (v != null) {
                          ref
                              .read(checkoutQuizProvider.notifier)
                              .selectPayment(v);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  // 3. 注文内容の確認
                  _OrderSummaryCard(
                    isConfirmed: quizState.isConfirmed,
                    onConfirmChanged: (v) => ref
                        .read(checkoutQuizProvider.notifier)
                        .toggleConfirmed(value: v ?? false),
                  ),
                  const SizedBox(height: 16),
                  // 注文確定ボタン
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ext.addToCartButtonColor,
                          foregroundColor: ext.cartButtonForeground,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: ext.orangeAccentBorder),
                          ),
                        ),
                        onPressed: quizState.status == QuizStatus.playing
                            ? () => ref
                                  .read(checkoutQuizProvider.notifier)
                                  .confirm()
                            : null,
                        child: UnreadableText(
                          qt.confirmButton,
                          isObfuscated: true,
                          animateOnObfuscate: false,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // フローティングミッションバブル（ドラッグ可能な円形タイマー）
          if (quizState.status == QuizStatus.playing)
            FloatingMissionBubble(
              remainingSeconds: quizState.remainingSeconds,
              missionText: missionText,
              hintUsed: false,
              timeLimitSeconds: ShoppingQuizConfig.checkoutTimeLimitSeconds,
              onGiveUp: () => ref.read(checkoutQuizProvider.notifier).giveUp(),
            ),
          // カットイン演出
          if (_showCutIn)
            MissionCutIn(
              missionText: missionText,
              timeLimitSeconds: ShoppingQuizConfig.checkoutTimeLimitSeconds,
              onFinished: () => setState(() => _showCutIn = false),
            ),
          // 正誤結果オーバーレイ
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
                  setState(() => _showCutIn = true);
                  ref.read(checkoutQuizProvider.notifier).retry();
                },
                onNext: quizState.status == QuizStatus.correct
                    ? widget.onCompleted
                    : null,
                onBack: () => Navigator.of(context).pop(),
                isLimitReached: ref.watch(isPlayLimitReachedProvider).valueOrNull ?? false,
                insight: Builder(
                builder: (context) {
                  final insight = context.s.checkout.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '📋',
                        title: insight.stepTitle,
                        desc: insight.stepDesc,
                      ),
                      QuizInsightItem(
                        emoji: '💳',
                        title: insight.iconTitle,
                        desc: insight.iconDesc,
                      ),
                      QuizInsightItem(
                        emoji: '✅',
                        title: insight.confirmTitle,
                        desc: insight.confirmDesc,
                      ),
                    ],
                  );
                },
              ),
              ),
            ),
        ],
      ),
    );
  }
}

// ─── ステップインジケーター ───────────────────────────────────────

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ShoppingAppTheme>()!;
    final qt = context.sq.checkout;
    final steps = [qt.step1, qt.step2, qt.step3];

    return Container(
      color: ext.surfaceColor,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        children: List.generate(steps.length * 2 - 1, (i) {
          if (i.isOdd) {
            return Expanded(
              child: Container(height: 1, color: ext.subTextColor),
            );
          }
          final stepIndex = i ~/ 2 + 1;
          final isDone = stepIndex < currentStep;
          final isCurrent = stepIndex == currentStep;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDone || isCurrent
                      ? ext.categoryBarBackground
                      : ext.scaffoldBackground,
                ),
                child: Center(
                  child: isDone
                      ? const Icon(Icons.check, color: Colors.white, size: 14)
                      : Text(
                          '$stepIndex',
                          style: TextStyle(
                            color: isCurrent
                                ? Colors.white
                                : ext.subTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 4),
              UnreadableText(
                steps[i ~/ 2],
                isObfuscated: true,
                animateOnObfuscate: false,
                style: TextStyle(
                  fontSize: 10,
                  color: isCurrent
                      ? ext.primaryTextColor
                      : ext.subTextColor,
                  fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

// ─── セクションカード ─────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.icon,
    required this.title,
    required this.child,
  });

  final IconData icon;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ShoppingAppTheme>()!;
    return Container(
      color: ext.surfaceColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Row(
              children: [
                Icon(icon, size: 20, color: ext.amazonTealColor),
                const SizedBox(width: 8),
                UnreadableText(
                  title,
                  isObfuscated: true,
                  animateOnObfuscate: false,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: child,
          ),
        ],
      ),
    );
  }
}

// ─── お支払い方法選択グループ ─────────────────────────────────────

class _PaymentMethodGroup extends StatelessWidget {
  const _PaymentMethodGroup({
    required this.selectedPayment,
    required this.onChanged,
  });

  final String? selectedPayment;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    final qt = context.sq.checkout;
    final methods = [
      (value: qt.paymentCreditCard, icon: Icons.credit_card),
      (value: qt.paymentConvenience, icon: Icons.store),
      (value: qt.paymentCOD, icon: Icons.local_shipping_outlined),
    ];

    return RadioGroup<String>(
      groupValue: selectedPayment,
      onChanged: onChanged,
      child: Column(
        children: methods
            .map(
              (method) => RadioListTile<String>(
                title: Row(
                  children: [
                    Icon(method.icon, size: 18, color: Theme.of(context).extension<ShoppingAppTheme>()!.subTextColor),
                    const SizedBox(width: 8),
                    UnreadableText(
                      method.value,
                      isObfuscated: true,
                      animateOnObfuscate: false,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                value: method.value,
                activeColor: Theme.of(context).extension<ShoppingAppTheme>()!.amazonTealColor,
                contentPadding: EdgeInsets.zero,
                dense: true,
              ),
            )
            .toList(),
      ),
    );
  }
}

// ─── 注文確認サマリーカード ───────────────────────────────────────

class _OrderSummaryCard extends StatelessWidget {
  const _OrderSummaryCard({
    required this.isConfirmed,
    required this.onConfirmChanged,
  });

  final bool isConfirmed;
  final ValueChanged<bool?> onConfirmChanged;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ShoppingAppTheme>()!;
    final qt = context.sq.checkout;
    return Container(
      color: ext.surfaceColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Row(
              children: [
                Icon(
                  Icons.receipt_long_outlined,
                  size: 20,
                  color: ext.amazonTealColor,
                ),
                const SizedBox(width: 8),
                UnreadableText(
                  qt.summarySection,
                  isObfuscated: true,
                  animateOnObfuscate: false,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // 注文内容（ダミー）
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _SummaryRow(
                  label: qt.subtotal,
                  value: UnreadableText(
                    '¥780',
                    isObfuscated: true,
                    animateOnObfuscate: false,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 6),
                _SummaryRow(
                  label: qt.shipping,
                  value: UnreadableText(
                    '¥0',
                    isObfuscated: true,
                    animateOnObfuscate: false,
                    style: TextStyle(
                      fontSize: 14,
                      color: ext.amazonTealColor,
                    ),
                  ),
                ),
                const Divider(height: 16),
                _SummaryRow(
                  label: qt.total,
                  value: UnreadableText(
                    '¥780',
                    isObfuscated: true,
                    animateOnObfuscate: false,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // 確認チェックボックス
          CheckboxListTile(
            title: UnreadableText(
              qt.confirmCheck,
              isObfuscated: true,
              animateOnObfuscate: false,
              style: const TextStyle(fontSize: 14),
            ),
            value: isConfirmed,
            onChanged: onConfirmChanged,
            activeColor: ext.amazonTealColor,
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.label, required this.value});

  final String label;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        UnreadableText(
          label,
          isObfuscated: true,
          animateOnObfuscate: false,
          style: TextStyle(fontSize: 14, color: Theme.of(context).extension<ShoppingAppTheme>()!.primaryTextColor),
        ),
        value,
      ],
    );
  }
}
