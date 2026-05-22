import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../domain/delivery_quiz_config.dart';
import '../../domain/delivery_view_state.dart';
import '../../i18n/delivery_translations_extension.dart';
import '../delivery_app_scaffold.dart';
import 'increment_quantity_quiz_notifier.dart';

class IncrementQuantityQuizScreen extends ConsumerStatefulWidget {
  const IncrementQuantityQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<IncrementQuantityQuizScreen> createState() =>
      _IncrementQuantityQuizScreenState();
}

class _IncrementQuantityQuizScreenState
    extends ConsumerState<IncrementQuantityQuizScreen> {
  bool _showCutIn = true;
  int _retryCount = 0;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(incrementQuantityQuizProvider);
    final notifier = ref.read(incrementQuantityQuizProvider.notifier);
    final missionText = context.s.quiz2.missionText;
    final isDone = state.status == QuizStatus.correct ||
        state.status == QuizStatus.timeUp ||
        state.status == QuizStatus.giveUp;

    return DeliveryAppScaffold(
      key: ValueKey(_retryCount),
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: DeliveryQuizConfig.quiz2TimeLimitSeconds,
      missionText: missionText,
      hintUsed: state.hintUsed,
      onHintTap: notifier.useHint,
      onGiveUp: notifier.giveUp,
      initialViewState: DeliveryViewState.browsing,
      highlightStepper: state.hintUsed && state.status == QuizStatus.playing,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: DeliveryQuizConfig.quiz2TimeLimitSeconds,
            onFinished: () {
              if (!mounted) return;
              setState(() => _showCutIn = false);
              notifier.startQuiz();
            },
          ),
        if (isDone)
          Positioned.fill(
            child: QuizResultOverlay(
              status: state.status,
              score: state.score,
              elapsedMs: state.elapsedMs,
              onRetry: () {
                setState(() {
                  _showCutIn = true;
                  _retryCount++;
                });
                notifier.retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              isLimitReached: ref.isPlayLimitReached,
              insight: Builder(
                builder: (ctx) {
                  final insight = ctx.s.quiz2.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '➕',
                        title: insight.stepperTitle,
                        desc: insight.stepperDesc,
                      ),
                      QuizInsightItem(
                        emoji: '1️⃣',
                        title: insight.minTitle,
                        desc: insight.minDesc,
                      ),
                      QuizInsightItem(
                        emoji: '💬',
                        title: insight.feedbackTitle,
                        desc: insight.feedbackDesc,
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
