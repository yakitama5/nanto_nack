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
    // selectedPeriod や毎秒更新される remainingSeconds が state を頻繁に変更するため、
    // 全体の watch を避け、結果表示に必要な最小フィールドのみ select で購読する
    final status = ref.watch(
      stockAppQuizProvider(_quizType).select((s) => s.status),
    );
    final score = ref.watch(
      stockAppQuizProvider(_quizType).select((s) => s.score),
    );
    final elapsedMs = ref.watch(
      stockAppQuizProvider(_quizType).select((s) => s.elapsedMs),
    );
    final notifier = ref.read(stockAppQuizProvider(_quizType).notifier);
    final missionText = context.s.quiz4.missionText;
    final isDone = status == QuizStatus.correct ||
        status == QuizStatus.timeUp ||
        status == QuizStatus.giveUp;

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
              status: status,
              score: score,
              elapsedMs: elapsedMs,
              onRetry: () {
                setState(() {
                  _showCutIn = true;
                  _retryCount++;
                });
                notifier.retry();
              },
              onNext: status == QuizStatus.correct ? widget.onCompleted : null,
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
