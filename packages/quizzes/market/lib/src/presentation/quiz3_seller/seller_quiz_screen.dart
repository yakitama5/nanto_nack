import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../domain/market_quiz_config.dart';
import '../../domain/market_quiz_type.dart';
import '../../i18n/market_translations_extension.dart';
import '../flea_market_quiz_notifier.dart';
import '../flea_market_scaffold.dart';

class SellerQuizScreen extends ConsumerStatefulWidget {
  const SellerQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<SellerQuizScreen> createState() => _SellerQuizScreenState();
}

class _SellerQuizScreenState extends ConsumerState<SellerQuizScreen> {
  static const _quizType = MarketQuizType.quiz3;
  bool _showCutIn = true;
  int _retryCount = 0;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(fleaMarketQuizProvider(_quizType));
    final notifier = ref.read(fleaMarketQuizProvider(_quizType).notifier);
    final missionText = context.s.quiz3.missionText;
    final isDone = state.status == QuizStatus.correct ||
        state.status == QuizStatus.timeUp ||
        state.status == QuizStatus.giveUp;

    return FleaMarketScaffold(
      key: ValueKey(_retryCount),
      quizType: _quizType,
      missionText: missionText,
      onGiveUp: notifier.giveUp,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: MarketQuizConfig.timeLimitSeconds,
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
                  final insight = ctx.s.quiz3.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '⭐',
                        title: insight.ratingTitle,
                        desc: insight.ratingDesc,
                      ),
                      QuizInsightItem(
                        emoji: '👤',
                        title: insight.profileTitle,
                        desc: insight.profileDesc,
                      ),
                      QuizInsightItem(
                        emoji: '📊',
                        title: insight.trustTitle,
                        desc: insight.trustDesc,
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
