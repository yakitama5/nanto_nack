import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

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
              isLimitReached: ref.isPlayLimitReached,
              insight: Builder(
                builder: (context) {
                  final insight = context.s.quiz1.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '➕',
                        title: insight.plusTitle,
                        desc: insight.plusDesc,
                      ),
                      QuizInsightItem(
                        emoji: '🎰',
                        title: insight.pickerTitle,
                        desc: insight.pickerDesc,
                      ),
                      QuizInsightItem(
                        emoji: '💾',
                        title: insight.saveTitle,
                        desc: insight.saveDesc,
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

