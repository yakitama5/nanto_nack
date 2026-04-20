import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../domain/alarm_catalog.dart';
import '../../domain/alarm_quiz_config.dart';
import '../../i18n/alarm_translations_extension.dart';
import '../alarm_app_screen.dart';
import 'set_weekdays_quiz_notifier.dart';

/// Quiz 2「真ん中のアラーム（alarm_2）を平日だけに設定する」
///
/// 最初にアラーム一覧を表示し、ユーザーが2番目のアラームをタップすると
/// 編集フォームに遷移する。編集フォームで平日（月〜金）を選択して保存すると正解。
class SetWeekdaysQuizScreen extends ConsumerStatefulWidget {
  /// コンストラクタ
  const SetWeekdaysQuizScreen({super.key, this.onCompleted});

  /// クイズ完了コールバック
  final VoidCallback? onCompleted;

  @override
  ConsumerState<SetWeekdaysQuizScreen> createState() =>
      _SetWeekdaysQuizScreenState();
}

class _SetWeekdaysQuizScreenState
    extends ConsumerState<SetWeekdaysQuizScreen> {
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(setWeekdaysQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(setWeekdaysQuizProvider);
    final missionText = context.s.quiz2.missionText;
    final notifier = ref.read(setWeekdaysQuizProvider.notifier);

    final mainScreen = state.showEditForm
        ? AlarmEditScreen(
            alarm: state.draftAlarm,
            quizStatus: state.status,
            remainingSeconds: state.remainingSeconds,
            timeLimitSeconds: AlarmQuizConfig.quiz2SetWeekdaysTimeLimitSeconds,
            missionText: missionText,
            onGiveUp: notifier.giveUp,
            highlightDayButtons: state.status == QuizStatus.playing,
            // 平日が1つ以上選択されているときに保存ボタンをハイライト
            highlightSaveButton: state.status == QuizStatus.playing &&
                state.draftAlarm.activeDays.isNotEmpty,
            onDayToggle: notifier.toggleDay,
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
            timeLimitSeconds: AlarmQuizConfig.quiz2SetWeekdaysTimeLimitSeconds,
            missionText: missionText,
            onGiveUp: notifier.giveUp,
            // Quiz2では + ボタンを使わないのでハイライトしない
            highlightAddButton: false,
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
            timeLimitSeconds: AlarmQuizConfig.quiz2SetWeekdaysTimeLimitSeconds,
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
              insight: _SetWeekdaysInsight(),
            ),
          ),
      ],
    );
  }
}

class _SetWeekdaysInsight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz2.insight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InsightHeader(title: insight.title, subtitle: insight.subtitle),
        const SizedBox(height: 12),
        _InsightItem(
          emoji: '📅',
          title: insight.dotTitle,
          desc: insight.dotDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '5⃣',
          title: insight.weekdayTitle,
          desc: insight.weekdayDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '🔵',
          title: insight.highlightTitle,
          desc: insight.highlightDesc,
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
