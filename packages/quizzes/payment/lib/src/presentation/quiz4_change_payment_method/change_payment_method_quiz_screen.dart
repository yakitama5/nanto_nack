import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../domain/payment_catalog.dart';
import '../../domain/payment_method.dart';
import '../../i18n/payment_translations_extension.dart';
import '../payment_app_screen.dart';
import 'change_payment_method_quiz_notifier.dart';
import 'change_payment_method_quiz_state.dart';

/// Quiz 4「支払い方法を変更してバーコードを提示してください」
class ChangePaymentMethodQuizScreen extends ConsumerStatefulWidget {
  /// コンストラクタ
  const ChangePaymentMethodQuizScreen({super.key, this.onCompleted});

  /// クイズ完了コールバック
  final VoidCallback? onCompleted;

  @override
  ConsumerState<ChangePaymentMethodQuizScreen> createState() =>
      _ChangePaymentMethodQuizScreenState();
}

class _ChangePaymentMethodQuizScreenState
    extends ConsumerState<ChangePaymentMethodQuizScreen> {
  static const _timeLimitSeconds = 60;
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(changePaymentMethodQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(changePaymentMethodQuizProvider);
    final missionText = context.s.quiz4.missionText;
    final notifier = ref.read(changePaymentMethodQuizProvider.notifier);
    final resultOverlays = _buildResultOverlays(state, notifier);

    // 支払い画面を表示する条件（クリア/タイムアップ/ギブアップ中は除く）
    if (state.paymentScreenShown &&
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
        overlays: resultOverlays,
        currentPaymentMethod: state.currentPaymentMethod,
        onChangePaymentMethod: notifier.changePaymentMethod,
        // 残高が選択されている間は支払い元ボタンをハイライト（変更を促す）
        highlightPaymentMethodButton: state.status == QuizStatus.playing &&
            state.currentPaymentMethod == PaymentMethod.balance,
      );
    }

    return PaymentHomeScreen(
      balance: PaymentCatalog.initialBalance,
      balanceHidden: false,
      currentPaymentMethod: state.currentPaymentMethod,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: _timeLimitSeconds,
      missionText: missionText,
      onGiveUp: notifier.giveUp,
      // 残高選択中はカルーセルをハイライト（スワイプで変更できることを示す）
      highlightPaymentCarousel: state.status == QuizStatus.playing &&
          state.currentPaymentMethod == PaymentMethod.balance,
      // クレカ選択済みなら支払いボタンをハイライト（支払い画面を開くよう促す）
      highlightPaymentButton: state.status == QuizStatus.playing &&
          state.currentPaymentMethod == PaymentMethod.creditCard,
      onPaymentTap: notifier.tapPayment,
      onPaymentMethodChanged: notifier.changePaymentMethod,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: _timeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
          ),
        ...resultOverlays,
      ],
    );
  }

  List<Widget> _buildResultOverlays(
    ChangePaymentMethodQuizState state,
    ChangePaymentMethodQuizNotifier notifier,
  ) {
    if (state.status == QuizStatus.correct ||
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
            insight: _ChangePaymentMethodInsight(),
          ),
        ),
      ];
    }
    return [];
  }
}

class _ChangePaymentMethodInsight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz4.insight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InsightHeader(title: insight.title, subtitle: insight.subtitle),
        const SizedBox(height: 12),
        _InsightItem(
          emoji: '💳',
          title: insight.routeATitle,
          desc: insight.routeADesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '👆',
          title: insight.routeBTitle,
          desc: insight.routeBDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '🔽',
          title: insight.dropdownTitle,
          desc: insight.dropdownDesc,
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
