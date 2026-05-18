import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../domain/weather_quiz_config.dart';
import '../../i18n/weather_translations_extension.dart';
import '../weather_app_scaffold.dart';
import 'expand_forecast_quiz_notifier.dart';

class ExpandForecastQuizScreen extends ConsumerStatefulWidget {
  const ExpandForecastQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<ExpandForecastQuizScreen> createState() =>
      _ExpandForecastQuizScreenState();
}

class _ExpandForecastQuizScreenState
    extends ConsumerState<ExpandForecastQuizScreen> {
  bool _showCutIn = true;
  int _retryCount = 0;
  bool _hintUsed = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(expandForecastQuizProvider);
    final notifier = ref.read(expandForecastQuizProvider.notifier);
    final missionText = context.s.quiz3.missionText;
    final isDone = state.status == QuizStatus.correct ||
        state.status == QuizStatus.timeUp ||
        state.status == QuizStatus.giveUp;

    return WeatherAppScaffold(
      key: ValueKey(_retryCount),
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: WeatherQuizConfig.quiz3TimeLimitSeconds,
      missionText: missionText,
      hintUsed: _hintUsed,
      onHintTap: () => setState(() => _hintUsed = true),
      onGiveUp: notifier.giveUp,
      highlightWednesdayForecast: _hintUsed && state.status == QuizStatus.playing,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: WeatherQuizConfig.quiz3TimeLimitSeconds,
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
                setState(() {
                  _showCutIn = true;
                  _retryCount++;
                  _hintUsed = false;
                });
                notifier.retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              isLimitReached: ref.isPlayLimitReached,
              insight: Builder(
                builder: (context) {
                  final insight = context.s.quiz3.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '🔽',
                        title: insight.expandTitle,
                        desc: insight.expandDesc,
                      ),
                      QuizInsightItem(
                        emoji: '›',
                        title: insight.arrowTitle,
                        desc: insight.arrowDesc,
                      ),
                      QuizInsightItem(
                        emoji: '🌧️',
                        title: insight.hourlyTitle,
                        desc: insight.hourlyDesc,
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
