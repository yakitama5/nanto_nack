import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

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
            isLimitReached: ref.isPlayLimitReached,
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
        QuizInsightHeader(title: insight.title, subtitle: insight.subtitle),
        const SizedBox(height: 12),
        QuizInsightItem(
          emoji: '✈️',
          title: insight.sendTitle,
          desc: insight.sendDesc,
        ),
        const SizedBox(height: 10),
        QuizInsightItem(
          emoji: '🔢',
          title: insight.amountTitle,
          desc: insight.amountDesc,
        ),
        const SizedBox(height: 10),
        QuizInsightItem(
          emoji: '✅',
          title: insight.confirmTitle,
          desc: insight.confirmDesc,
        ),
      ],
    );
  }
}
