import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../domain/alarm_catalog.dart';
import '../../domain/alarm_quiz_config.dart';
import '../../i18n/alarm_translations_extension.dart';
import '../alarm_app_screen.dart';
import 'add_alarm_quiz_notifier.dart';

/// Quiz 1「新しくアラームを追加してください」
class AddAlarmQuizScreen extends ConsumerStatefulWidget {
  /// コンストラクタ
  const AddAlarmQuizScreen({super.key, this.onCompleted});

  /// クイズ完了コールバック
  final VoidCallback? onCompleted;

  @override
  ConsumerState<AddAlarmQuizScreen> createState() => _AddAlarmQuizScreenState();
}

class _AddAlarmQuizScreenState extends ConsumerState<AddAlarmQuizScreen> {
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(addAlarmQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addAlarmQuizProvider);
    final missionText = context.s.quiz1.missionText;
    final notifier = ref.read(addAlarmQuizProvider.notifier);

    final mainScreen = state.showEditForm
        ? AlarmEditScreen(
            alarm: state.draftAlarm,
            quizStatus: state.status,
            remainingSeconds: state.remainingSeconds,
            timeLimitSeconds: AlarmQuizConfig.quiz1AddAlarmTimeLimitSeconds,
            missionText: missionText,
            onGiveUp: notifier.giveUp,
            highlightSaveButton: true,
            onSave: notifier.tapSave,
            onCancel: notifier.tapCancel,
            overlays: const [],
          )
        : AlarmListScreen(
            alarms: AlarmCatalog.initialAlarms,
            quizStatus: state.status,
            remainingSeconds: state.remainingSeconds,
            timeLimitSeconds: AlarmQuizConfig.quiz1AddAlarmTimeLimitSeconds,
            missionText: missionText,
            onGiveUp: notifier.giveUp,
            highlightAddButton: state.status == QuizStatus.playing,
            onAddTap: notifier.tapAdd,
            overlays: const [],
          );

    return Stack(
      fit: StackFit.expand,
      children: [
        mainScreen,
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: AlarmQuizConfig.quiz1AddAlarmTimeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
          ),
        if (state.status == QuizStatus.correct ||
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
              onNext:
                  state.status == QuizStatus.correct ? widget.onCompleted : null,
              onBack: () => Navigator.of(context).pop(),
              insight: _AddAlarmInsight(),
            ),
          ),
      ],
    );
  }
}

class _AddAlarmInsight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz1.insight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InsightHeader(title: insight.title, subtitle: insight.subtitle),
        const SizedBox(height: 12),
        _InsightItem(
          emoji: '➕',
          title: insight.plusTitle,
          desc: insight.plusDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '🎰',
          title: insight.pickerTitle,
          desc: insight.pickerDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '💾',
          title: insight.saveTitle,
          desc: insight.saveDesc,
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
