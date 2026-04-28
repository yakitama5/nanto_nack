import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../domain/payment_catalog.dart';
import '../../domain/payment_method.dart';
import '../../domain/payment_quiz_config.dart';
import '../../i18n/payment_translations_extension.dart';
import '../payment_app_screen.dart';
import 'show_qr_quiz_notifier.dart';

/// Quiz 1「バーコードを提示してください」
class ShowQrQuizScreen extends ConsumerStatefulWidget {
  /// コンストラクタ
  const ShowQrQuizScreen({super.key, this.onCompleted});

  /// クイズ完了コールバック
  final VoidCallback? onCompleted;

  @override
  ConsumerState<ShowQrQuizScreen> createState() => _ShowQrQuizScreenState();
}

class _ShowQrQuizScreenState extends ConsumerState<ShowQrQuizScreen> {
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(showQrQuizProvider);
    final missionText = context.s.quiz1.missionText;
    final notifier = ref.read(showQrQuizProvider.notifier);

    if (state.paymentShown &&
        state.status != QuizStatus.correct &&
        state.status != QuizStatus.timeUp &&
        state.status != QuizStatus.giveUp) {
      return PaymentScreen(
        quizStatus: state.status,
        remainingSeconds: state.remainingSeconds,
        timeLimitSeconds: PaymentQuizConfig.quiz1ShowQrTimeLimitSeconds,
        missionText: missionText,
        onGiveUp: notifier.giveUp,
        onBack: notifier.closePaymentScreen,
        overlays: const [],
        currentPaymentMethod: PaymentMethod.balance,
      );
    }

    return PaymentHomeScreen(
      balance: PaymentCatalog.initialBalance,
      balanceHidden: false,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: PaymentQuizConfig.quiz1ShowQrTimeLimitSeconds,
      missionText: missionText,
      onGiveUp: notifier.giveUp,
      currentPaymentMethod: PaymentMethod.balance,
      highlightPaymentButton: state.hintUsed,
      hintUsed: state.hintUsed,
      onHintTap: notifier.useHint,
      onPaymentTap: notifier.tapPayment,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: PaymentQuizConfig.quiz1ShowQrTimeLimitSeconds,
            onFinished: () {
              if (!mounted) return;
              setState(() => _showCutIn = false);
              ref.read(showQrQuizProvider.notifier).startQuiz();
            },
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
              insight: Builder(
                builder: (context) {
                  final insight = context.s.quiz1.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '💳',
                        title: insight.qrTitle,
                        desc: insight.qrDesc,
                      ),
                      QuizInsightItem(
                        emoji: '🎨',
                        title: insight.cameraTitle,
                        desc: insight.cameraDesc,
                      ),
                      QuizInsightItem(
                        emoji: '⬆️',
                        title: insight.colorTitle,
                        desc: insight.colorDesc,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}

