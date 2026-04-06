import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../domain/payment_catalog.dart';
import '../../domain/payment_method.dart';
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
  static const _timeLimitSeconds = 30;
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(showQrQuizProvider.notifier).startQuiz();
    });
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
        timeLimitSeconds: _timeLimitSeconds,
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
      timeLimitSeconds: _timeLimitSeconds,
      missionText: missionText,
      onGiveUp: notifier.giveUp,
      currentPaymentMethod: PaymentMethod.balance,
      highlightPaymentButton: state.status == QuizStatus.playing,
      onPaymentTap: notifier.tapPayment,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: _timeLimitSeconds,
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
              insight: _ShowQrInsight(),
            ),
          ),
      ],
    );
  }
}

class _ShowQrInsight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz1.insight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InsightHeader(title: insight.title, subtitle: insight.subtitle),
        const SizedBox(height: 12),
        _InsightItem(
          emoji: '💳',
          title: insight.qrTitle,
          desc: insight.qrDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '🎨',
          title: insight.cameraTitle,
          desc: insight.cameraDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '⬆️',
          title: insight.colorTitle,
          desc: insight.colorDesc,
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
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.grey.shade600),
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
                    ?.copyWith(color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
