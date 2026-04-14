import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../domain/payment_catalog.dart';
import '../../domain/payment_method.dart';
import '../../domain/payment_quiz_config.dart';
import '../../i18n/payment_translations_extension.dart';
import '../payment_app_screen.dart';
import 'reveal_balance_quiz_notifier.dart';

/// Quiz 2「残高を隠してください」
class RevealBalanceQuizScreen extends ConsumerStatefulWidget {
  /// コンストラクタ
  const RevealBalanceQuizScreen({super.key, this.onCompleted});

  /// クイズ完了コールバック
  final VoidCallback? onCompleted;

  @override
  ConsumerState<RevealBalanceQuizScreen> createState() =>
      _RevealBalanceQuizScreenState();
}

class _RevealBalanceQuizScreenState
    extends ConsumerState<RevealBalanceQuizScreen> {
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(revealBalanceQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(revealBalanceQuizProvider);
    final missionText = context.s.quiz2.missionText;
    final notifier = ref.read(revealBalanceQuizProvider.notifier);

    return PaymentHomeScreen(
      balance: PaymentCatalog.initialBalance,
      balanceHidden: state.balanceHidden,
      currentPaymentMethod: PaymentMethod.balance,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: PaymentQuizConfig.quiz2RevealBalanceTimeLimitSeconds,
      missionText: missionText,
      onGiveUp: notifier.giveUp,
      // ヒント使用後に目アイコンをハイライト
      highlightEyeIcon: state.hintUsed,
      hintUsed: state.hintUsed,
      onHintTap: notifier.useHint,
      onBalanceVisibilityTap: notifier.tapEyeIcon,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: PaymentQuizConfig.quiz2RevealBalanceTimeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
          ),
        if (state.status == QuizStatus.correct ||
            state.status == QuizStatus.timeUp ||
            state.status == QuizStatus.giveUp)
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
              insight: _RevealBalanceInsight(),
            ),
          ),
      ],
    );
  }
}

class _RevealBalanceInsight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz2.insight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuizInsightHeader(title: insight.title, subtitle: insight.subtitle),
        const SizedBox(height: 12),
        QuizInsightItem(
          emoji: '👁️',
          title: insight.eyeTitle,
          desc: insight.eyeDesc,
        ),
        const SizedBox(height: 10),
        QuizInsightItem(
          emoji: '***',
          title: insight.maskTitle,
          desc: insight.maskDesc,
        ),
        const SizedBox(height: 10),
        QuizInsightItem(
          emoji: '🔒',
          title: insight.privacyTitle,
          desc: insight.privacyDesc,
        ),
      ],
    );
  }
}
