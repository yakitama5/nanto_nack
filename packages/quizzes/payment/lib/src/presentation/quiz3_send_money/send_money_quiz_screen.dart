import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../domain/payment_catalog.dart';
import '../../domain/payment_method.dart';
import '../../domain/payment_quiz_config.dart';
import '../../i18n/payment_translations_extension.dart';
import '../payment_app_screen.dart';
import 'send_money_quiz_notifier.dart';
import 'send_money_quiz_state.dart';

/// Quiz 3「友達に5,000円を送金してください」
class SendMoneyQuizScreen extends ConsumerStatefulWidget {
  /// コンストラクタ
  const SendMoneyQuizScreen({super.key, this.onCompleted});

  /// クイズ完了コールバック
  final VoidCallback? onCompleted;

  @override
  ConsumerState<SendMoneyQuizScreen> createState() =>
      _SendMoneyQuizScreenState();
}

class _SendMoneyQuizScreenState extends ConsumerState<SendMoneyQuizScreen> {
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(sendMoneyQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sendMoneyQuizProvider);
    final missionText = context.s.quiz3.missionText;
    final notifier = ref.read(sendMoneyQuizProvider.notifier);

    final resultOverlays = _buildResultOverlays(state, notifier);

    if (state.showSendScreen) {
      return SendMoneyScreen(
        contacts: PaymentCatalog.contacts,
        selectedContactId: state.selectedContactId,
        amount: state.amount,
        quizStatus: state.status,
        remainingSeconds: state.remainingSeconds,
        timeLimitSeconds: PaymentQuizConfig.quiz3SendMoneyTimeLimitSeconds,
        missionText: missionText,
        onGiveUp: notifier.giveUp,
        onContactSelect: notifier.selectContact,
        onAmountKey: notifier.onAmountKey,
        onSend: notifier.tapSendMoney,
        onBack: notifier.closeSendScreen,
        hintUsed: state.hintUsed,
        onHintTap: notifier.useHint,
        overlays: resultOverlays,
      );
    }

    return PaymentHomeScreen(
      balance: PaymentCatalog.initialBalance,
      balanceHidden: false,
      currentPaymentMethod: PaymentMethod.balance,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: PaymentQuizConfig.quiz3SendMoneyTimeLimitSeconds,
      missionText: missionText,
      onGiveUp: notifier.giveUp,
      highlightSendTile: state.hintUsed,
      hintUsed: state.hintUsed,
      onHintTap: notifier.useHint,
      onSendTap: notifier.tapSend,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: PaymentQuizConfig.quiz3SendMoneyTimeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
          ),
        ...resultOverlays,
      ],
    );
  }

  List<Widget> _buildResultOverlays(
    SendMoneyQuizState state,
    SendMoneyQuizNotifier notifier,
  ) {
    if (state.status == QuizStatus.correct ||
        state.status == QuizStatus.incorrect ||
        state.status == QuizStatus.timeUp ||
        state.status == QuizStatus.giveUp) {
      return [
        Positioned.fill(
          child: QuizResultOverlay(
            status: state.status,
            score: state.score,
            elapsedMs: state.elapsedMs,
            onRetry: () {
              setState(() => _showCutIn = true);
              notifier.retry();
            },
            onNext: state.status == QuizStatus.correct
                ? widget.onCompleted
                : null,
            onBack: () => Navigator.of(context).pop(),
            insight: _SendMoneyInsight(),
          ),
        ),
      ];
    }
    return [];
  }
}

class _SendMoneyInsight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz3.insight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InsightHeader(title: insight.title, subtitle: insight.subtitle),
        const SizedBox(height: 12),
        _InsightItem(
          emoji: '✈️',
          title: insight.sendTitle,
          desc: insight.sendDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '🔢',
          title: insight.amountTitle,
          desc: insight.amountDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '✅',
          title: insight.confirmTitle,
          desc: insight.confirmDesc,
        ),
      ],
    );
  }
}

class _InsightHeader extends StatelessWidget {
  const _InsightHeader({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.lightbulb, color: Color(0xFFFFD814), size: 20),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context)
                    .extension<PaymentAppTheme>()!
                    .secondaryTextColor,
              ),
        ),
      ],
    );
  }
}

class _InsightItem extends StatelessWidget {
  const _InsightItem({
    required this.emoji,
    required this.title,
    required this.desc,
  });

  final String emoji;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    final secondaryTextColor =
        Theme.of(context).extension<PaymentAppTheme>()!.secondaryTextColor;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 18)),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                desc,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: secondaryTextColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
