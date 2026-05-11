import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../domain/weather_quiz_config.dart';
import '../../i18n/weather_translations_extension.dart';
import '../weather_app_scaffold.dart';
import 'pull_refresh_quiz_notifier.dart';

class PullRefreshQuizScreen extends ConsumerStatefulWidget {
  const PullRefreshQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<PullRefreshQuizScreen> createState() =>
      _PullRefreshQuizScreenState();
}

class _PullRefreshQuizScreenState extends ConsumerState<PullRefreshQuizScreen> {
  bool _showCutIn = true;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(pullRefreshQuizProvider);
    final notifier = ref.read(pullRefreshQuizProvider.notifier);
    final missionText = context.s.quiz2.missionText;
    final isDone = state.status == QuizStatus.correct ||
        state.status == QuizStatus.timeUp ||
        state.status == QuizStatus.giveUp;

    return WeatherAppScaffold(
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: WeatherQuizConfig.quiz2TimeLimitSeconds,
      missionText: missionText,
      hintUsed: state.hintUsed,
      onHintTap: notifier.useHint,
      onGiveUp: notifier.giveUp,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: WeatherQuizConfig.quiz2TimeLimitSeconds,
            onFinished: () {
              if (!mounted) {
                return;
              }
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
                  final insight = context.s.quiz2.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '⬇️',
                        title: insight.pullTitle,
                        desc: insight.pullDesc,
                      ),
                      QuizInsightItem(
                        emoji: '⏳',
                        title: insight.indicatorTitle,
                        desc: insight.indicatorDesc,
                      ),
                      QuizInsightItem(
                        emoji: '📏',
                        title: insight.thresholdTitle,
                        desc: insight.thresholdDesc,
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
