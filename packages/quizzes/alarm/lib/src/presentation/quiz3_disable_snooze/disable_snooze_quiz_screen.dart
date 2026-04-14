import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../domain/alarm_catalog.dart';
import '../../domain/alarm_quiz_config.dart';
import '../../i18n/alarm_translations_extension.dart';
import '../alarm_app_screen.dart';
import 'disable_snooze_quiz_notifier.dart';

/// Quiz 3「一番上のアラームのスヌーズをオフにして保存してください」
///
/// 最初にアラーム一覧を表示し、ユーザーが一番上のアラームをタップすると
/// 編集フォームに遷移する。スヌーズをオフにして保存すると正解。
class DisableSnoozeQuizScreen extends ConsumerStatefulWidget {
  /// コンストラクタ
  const DisableSnoozeQuizScreen({super.key, this.onCompleted});

  /// クイズ完了コールバック
  final VoidCallback? onCompleted;

  @override
  ConsumerState<DisableSnoozeQuizScreen> createState() =>
      _DisableSnoozeQuizScreenState();
}

class _DisableSnoozeQuizScreenState
    extends ConsumerState<DisableSnoozeQuizScreen> {
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(disableSnoozeQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(disableSnoozeQuizProvider);
    final missionText = context.s.quiz3.missionText;
    final notifier = ref.read(disableSnoozeQuizProvider.notifier);

    final mainScreen = state.showEditForm
        ? AlarmEditScreen(
            alarm: state.draftAlarm,
            quizStatus: state.status,
            remainingSeconds: state.remainingSeconds,
            timeLimitSeconds: AlarmQuizConfig.quiz3DisableSnoozeTimeLimitSeconds,
            missionText: missionText,
            onGiveUp: notifier.giveUp,
            highlightSnoozeToggle: state.status == QuizStatus.playing,
            // スヌーズがオフになったら保存ボタンをハイライト
            highlightSaveButton: state.status == QuizStatus.playing &&
                !state.draftAlarm.snoozeEnabled,
            onSnoozeToggle: notifier.toggleSnooze,
            onSave: notifier.tapSave,
            onCancel: notifier.tapCancel,
            onHourChanged: (h) =>
                notifier.changeTime(h, state.draftAlarm.minute),
            onMinuteChanged: (m) =>
                notifier.changeTime(state.draftAlarm.hour, m),
            overlays: const [],
          )
        : AlarmListScreen(
            alarms: AlarmCatalog.initialAlarms,
            quizStatus: state.status,
            remainingSeconds: state.remainingSeconds,
            timeLimitSeconds: AlarmQuizConfig.quiz3DisableSnoozeTimeLimitSeconds,
            missionText: missionText,
            onGiveUp: notifier.giveUp,
            onAlarmTap: notifier.tapAlarm,
            overlays: const [],
          );

    return Stack(
      fit: StackFit.expand,
      children: [
        mainScreen,
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: AlarmQuizConfig.quiz3DisableSnoozeTimeLimitSeconds,
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
              isLimitReached: ref.isPlayLimitReached,
              insight: _DisableSnoozeInsight(),
            ),
          ),
      ],
    );
  }
}

class _DisableSnoozeInsight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz3.insight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuizInsightHeader(title: insight.title, subtitle: insight.subtitle),
        const SizedBox(height: 12),
        QuizInsightItem(
          emoji: '🔘',
          title: insight.toggleTitle,
          desc: insight.toggleDesc,
        ),
        const SizedBox(height: 10),
        QuizInsightItem(
          emoji: '↔️',
          title: insight.vs_arrow_title,
          desc: insight.vs_arrow_desc,
        ),
        const SizedBox(height: 10),
        QuizInsightItem(
          emoji: '🎨',
          title: insight.colorTitle,
          desc: insight.colorDesc,
        ),
      ],
    );
  }
}
