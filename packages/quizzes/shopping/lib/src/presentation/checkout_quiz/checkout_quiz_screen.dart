import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/i18n/shopping_translations_extension.dart';
import 'package:shopping/src/presentation/checkout_quiz/checkout_quiz_notifier.dart';
import 'package:shopping/src/presentation/checkout_quiz/checkout_quiz_state.dart';

// Amazon風カラー定数
const _kNavyColor = Color(0xFF131921);

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
    final missionText = context.s.checkout.missionText;
    final qt = context.sq.checkout;

    // 住所変更をNotifierに反映（コントローラとの同期）
    ref.listen<CheckoutQuizState>(checkoutQuizProvider, (prev, next) {
      if (next.address != _addressController.text) {
        _addressController.text = next.address;
      }
    });

    return Stack(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            textTheme: GoogleFonts.notoSansJpTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          child: DefaultTextStyle.merge(
            style: GoogleFonts.notoSansJp(),
            child: Scaffold(
          backgroundColor: const Color(0xFFF3F3F3),
          appBar: AppBar(
            backgroundColor: _kNavyColor,
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
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    onChanged: (v) =>
                        ref.read(checkoutQuizProvider.notifier).updateAddress(v),
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
                        backgroundColor: const Color(0xFFFFD814),
                        foregroundColor: Colors.black87,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Color(0xFFFFA41C)),
                        ),
                      ),
                      onPressed: quizState.status == QuizStatus.playing
                          ? () =>
                              ref.read(checkoutQuizProvider.notifier).confirm()
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
                const SizedBox(height: 80), // FloatingMissionBar 分の余白
              ],
            ),
          ),
          ),
          ),
        ),
        // フローティングミッションバー
        if (quizState.status == QuizStatus.playing)
          Positioned(
            top: MediaQuery.paddingOf(context).top + kToolbarHeight + 8,
            left: 16,
            right: 16,
            child: FloatingMissionBar(
              remainingSeconds: quizState.remainingSeconds,
              missionText: missionText,
              hintUsed: false,
              timeLimitSeconds: _timeLimitSeconds,
            ),
          ),
        // カットイン演出
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
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

// ─── ステップインジケーター ───────────────────────────────────────

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    final qt = context.sq.checkout;
    final steps = [qt.step1, qt.step2, qt.step3];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        children: List.generate(steps.length * 2 - 1, (i) {
          if (i.isOdd) {
            return Expanded(
              child: Container(height: 1, color: Colors.grey.shade300),
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
                      ? const Color(0xFF232F3E)
                      : Colors.grey.shade200,
                ),
                child: Center(
                  child: isDone
                      ? const Icon(Icons.check, color: Colors.white, size: 14)
                      : Text(
                          '$stepIndex',
                          style: TextStyle(
                            color:
                                isCurrent ? Colors.white : Colors.grey.shade500,
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
                      ? const Color(0xFF232F3E)
                      : Colors.grey.shade500,
                  fontWeight:
                      isCurrent ? FontWeight.bold : FontWeight.normal,
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
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Row(
              children: [
                Icon(icon, size: 20, color: const Color(0xFF007185)),
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
                    Icon(method.icon, size: 18, color: Colors.grey.shade600),
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
                activeColor: const Color(0xFF007185),
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
    final qt = context.sq.checkout;
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Row(
              children: [
                const Icon(
                  Icons.receipt_long_outlined,
                  size: 20,
                  color: Color(0xFF007185),
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
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF007185),
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
            activeColor: const Color(0xFF007185),
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
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        value,
      ],
    );
  }
}
