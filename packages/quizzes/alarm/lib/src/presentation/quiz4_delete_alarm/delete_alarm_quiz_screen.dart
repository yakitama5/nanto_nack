import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

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
              isLimitReached: ref.isPlayLimitReached,
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
        QuizInsightHeader(title: insight.title, subtitle: insight.subtitle),
        const SizedBox(height: 12),
        QuizInsightItem(
          emoji: '👈',
          title: insight.swipeTitle,
          desc: insight.swipeDesc,
        ),
        const SizedBox(height: 10),
        QuizInsightItem(
          emoji: '🔴',
          title: insight.redTitle,
          desc: insight.redDesc,
        ),
        const SizedBox(height: 10),
        QuizInsightItem(
          emoji: '👻',
          title: insight.hiddenTitle,
          desc: insight.hiddenDesc,
        ),
      ],
    );
  }
}
