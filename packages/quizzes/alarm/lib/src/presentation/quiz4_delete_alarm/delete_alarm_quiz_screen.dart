import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../domain/alarm_quiz_config.dart';
import '../../i18n/alarm_translations_extension.dart';
import '../alarm_app_screen.dart';
import 'delete_alarm_quiz_notifier.dart';

/// Quiz 4「一番上のアラームを削除してください」
class DeleteAlarmQuizScreen extends ConsumerStatefulWidget {
  /// コンストラクタ
  const DeleteAlarmQuizScreen({super.key, this.onCompleted});

  /// クイズ完了コールバック
  final VoidCallback? onCompleted;

  @override
  ConsumerState<DeleteAlarmQuizScreen> createState() =>
      _DeleteAlarmQuizScreenState();
}

class _DeleteAlarmQuizScreenState
    extends ConsumerState<DeleteAlarmQuizScreen> {
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(deleteAlarmQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(deleteAlarmQuizProvider);
    final missionText = context.s.quiz4.missionText;
    final notifier = ref.read(deleteAlarmQuizProvider.notifier);

    return Stack(
      fit: StackFit.expand,
      children: [
        AlarmListScreen(
          alarms: state.alarms,
          quizStatus: state.status,
          remainingSeconds: state.remainingSeconds,
          timeLimitSeconds: AlarmQuizConfig.quiz4DeleteAlarmTimeLimitSeconds,
          missionText: missionText,
          onGiveUp: notifier.giveUp,
          onAlarmSwipeDeleteConfirm: notifier.confirmDelete,
          overlays: const [],
        ),
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: AlarmQuizConfig.quiz4DeleteAlarmTimeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
          ),
        if (state.status == QuizStatus.correct ||
            state.status == QuizStatus.incorrect ||
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
              insight: _DeleteAlarmInsight(),
            ),
          ),
      ],
    );
  }
}

class _DeleteAlarmInsight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz4.insight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InsightHeader(title: insight.title, subtitle: insight.subtitle),
        const SizedBox(height: 12),
        _InsightItem(
          emoji: '👈',
          title: insight.swipeTitle,
          desc: insight.swipeDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '🔴',
          title: insight.redTitle,
          desc: insight.redDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '👻',
          title: insight.hiddenTitle,
          desc: insight.hiddenDesc,
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
              ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
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
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
