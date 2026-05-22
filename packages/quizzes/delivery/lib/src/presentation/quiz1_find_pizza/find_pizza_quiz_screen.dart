import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../domain/delivery_quiz_config.dart';
import '../../domain/delivery_view_state.dart';
import '../../i18n/delivery_translations_extension.dart';
import '../delivery_app_scaffold.dart';
import 'find_pizza_quiz_notifier.dart';

class FindPizzaQuizScreen extends ConsumerStatefulWidget {
  const FindPizzaQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<FindPizzaQuizScreen> createState() =>
      _FindPizzaQuizScreenState();
}

class _FindPizzaQuizScreenState extends ConsumerState<FindPizzaQuizScreen> {
  bool _showCutIn = true;
  int _retryCount = 0;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(findPizzaQuizProvider);
    final notifier = ref.read(findPizzaQuizProvider.notifier);
    final missionText = context.s.quiz1.missionText;
    final isDone = state.status == QuizStatus.correct ||
        state.status == QuizStatus.timeUp ||
        state.status == QuizStatus.giveUp;

    return DeliveryAppScaffold(
      key: ValueKey(_retryCount),
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: DeliveryQuizConfig.quiz1TimeLimitSeconds,
      missionText: missionText,
      hintUsed: state.hintUsed,
      onHintTap: notifier.useHint,
      onGiveUp: notifier.giveUp,
      initialViewState: DeliveryViewState.browsing,
      highlightCategory: state.hintUsed && state.status == QuizStatus.playing,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: DeliveryQuizConfig.quiz1TimeLimitSeconds,
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
                  final insight = ctx.s.quiz1.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '👉',
                        title: insight.scrollTitle,
                        desc: insight.scrollDesc,
                      ),
                      QuizInsightItem(
                        emoji: '🍕',
                        title: insight.iconTitle,
                        desc: insight.iconDesc,
                      ),
                      QuizInsightItem(
                        emoji: '💡',
                        title: insight.affordanceTitle,
                        desc: insight.affordanceDesc,
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
