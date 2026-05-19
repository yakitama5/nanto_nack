import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../domain/weather_quiz_config.dart';
import '../../i18n/weather_translations_extension.dart';
import '../weather_app_scaffold.dart';
import 'radar_map_quiz_notifier.dart';

class RadarMapQuizScreen extends ConsumerStatefulWidget {
  const RadarMapQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<RadarMapQuizScreen> createState() => _RadarMapQuizScreenState();
}

class _RadarMapQuizScreenState extends ConsumerState<RadarMapQuizScreen> {
  bool _showCutIn = true;
  int _retryCount = 0;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(radarMapQuizProvider);
    final notifier = ref.read(radarMapQuizProvider.notifier);
    final missionText = context.s.quiz4.missionText;
    final isDone = state.status == QuizStatus.correct ||
        state.status == QuizStatus.timeUp ||
        state.status == QuizStatus.giveUp;

    return WeatherAppScaffold(
      key: ValueKey(_retryCount),
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: WeatherQuizConfig.quiz4TimeLimitSeconds,
      missionText: missionText,
      hintUsed: state.hintUsed,
      onHintTap: notifier.useHint,
      onGiveUp: notifier.giveUp,
      highlightRadarMap: state.hintUsed && state.status == QuizStatus.playing,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: WeatherQuizConfig.quiz4TimeLimitSeconds,
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
                  final insight = context.s.quiz4.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '👆',
                        title: insight.tapTitle,
                        desc: insight.tapDesc,
                      ),
                      QuizInsightItem(
                        emoji: '✨',
                        title: insight.heroTitle,
                        desc: insight.heroDesc,
                      ),
                      QuizInsightItem(
                        emoji: '🌧️',
                        title: insight.radarTitle,
                        desc: insight.radarDesc,
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
