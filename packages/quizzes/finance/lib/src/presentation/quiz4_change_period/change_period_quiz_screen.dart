import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../domain/finance_quiz_config.dart';
import '../../domain/finance_quiz_type.dart';
import '../../i18n/finance_translations_extension.dart';
import '../stock_app_quiz_notifier.dart';
import '../stock_app_scaffold.dart';

class ChangePeriodQuizScreen extends ConsumerStatefulWidget {
  const ChangePeriodQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<ChangePeriodQuizScreen> createState() =>
      _ChangePeriodQuizScreenState();
}

class _ChangePeriodQuizScreenState
    extends ConsumerState<ChangePeriodQuizScreen> {
  static const _quizType = FinanceQuizType.quiz4;
  bool _showCutIn = true;
  int _retryCount = 0;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(stockAppQuizProvider(_quizType));
    final notifier = ref.read(stockAppQuizProvider(_quizType).notifier);
    final missionText = context.s.quiz4.missionText;
    final isDone = state.status == QuizStatus.correct ||
        state.status == QuizStatus.timeUp ||
        state.status == QuizStatus.giveUp;

    return StockAppScaffold(
      key: ValueKey(_retryCount),
      quizType: _quizType,
      missionText: missionText,
      onGiveUp: notifier.giveUp,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: FinanceQuizConfig.timeLimitSeconds,
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
                  final insight = ctx.s.quiz4.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '🔘',
                        title: insight.chipTitle,
                        desc: insight.chipDesc,
                      ),
                      QuizInsightItem(
                        emoji: '📅',
                        title: insight.periodTitle,
                        desc: insight.periodDesc,
                      ),
                      QuizInsightItem(
                        emoji: '✅',
                        title: insight.activeTitle,
                        desc: insight.activeDesc,
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
