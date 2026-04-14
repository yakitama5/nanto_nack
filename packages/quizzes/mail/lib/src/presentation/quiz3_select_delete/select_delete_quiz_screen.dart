import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mail/src/i18n/mail_translations_extension.dart';
import 'package:mail/src/presentation/mail_app_bar.dart';
import 'package:mail/src/presentation/mail_list_item.dart';
import 'package:mail/src/presentation/quiz3_select_delete/select_delete_quiz_notifier.dart';
import 'package:quiz_core/quiz_core.dart';

class SelectDeleteQuizScreen extends ConsumerStatefulWidget {
  const SelectDeleteQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<SelectDeleteQuizScreen> createState() =>
      _SelectDeleteQuizScreenState();
}

class _SelectDeleteQuizScreenState
    extends ConsumerState<SelectDeleteQuizScreen> {
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(selectDeleteQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(selectDeleteQuizProvider);
    final s = context.s;
    final sq = context.sq;
    final missionText = s.quiz3.missionText;

    final selectedCount = state.mailApp.selectedMailIds.length;
    final isSelectionMode = state.mailApp.isSelectionMode;

    return QuizExitScope(
      quizStatus: state.status,
      child: Scaffold(
        appBar: MailAppBar(
          selectedCount: selectedCount,
          searchHint: sq.common.searchHint,
          selectedCountText: sq.common.selectedCount
              .replaceAll('{count}', '$selectedCount'),
          onClearSelection:
              ref.read(selectDeleteQuizProvider.notifier).clearSelection,
          onDeleteSelected:
              ref.read(selectDeleteQuizProvider.notifier).moveToTrash,
        ),
        body: Stack(
          children: [
            ListView.separated(
              itemCount: state.mailApp.currentFolderMails.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (context, index) {
                final mail = state.mailApp.currentFolderMails[index];
                final isSelected =
                    state.mailApp.selectedMailIds.contains(mail.id);
                return MailListItem(
                  mail: mail,
                  isSelected: isSelected,
                  archiveLabel: sq.common.archiveAction,
                  isSelectionMode: isSelectionMode,
                  onTap: isSelectionMode
                      ? () => ref
                          .read(selectDeleteQuizProvider.notifier)
                          .toggleSelection(mail.id)
                      : null,
                  onLongPress: () => ref
                      .read(selectDeleteQuizProvider.notifier)
                      .toggleSelection(mail.id),
                );
              },
            ),
            FloatingMissionBubble(
              missionText: missionText,
              remainingSeconds: 0,
              hintUsed: false,
            ),
            if (_showCutIn)
              MissionCutIn(
                missionText: missionText,
                timeLimitSeconds: 0,
                onFinished: () => setState(() => _showCutIn = false),
              ),
            if (state.status == QuizStatus.correct ||
                state.status == QuizStatus.giveUp)
              Positioned.fill(
                child: QuizResultOverlay(
                  status: state.status,
                  score: state.score,
                  elapsedMs: state.elapsedMs,
                  onRetry: () {
                    setState(() => _showCutIn = true);
                    ref.read(selectDeleteQuizProvider.notifier).retry();
                  },
                  onNext: state.status == QuizStatus.correct
                      ? widget.onCompleted
                      : null,
                  onBack: () => Navigator.of(context).pop(),
                  insight: const _SelectDeleteInsight(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SelectDeleteInsight extends StatelessWidget {
  const _SelectDeleteInsight();

  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz3.insight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.lightbulb, color: Color(0xFFFFD814), size: 20),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                insight.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          insight.subtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: const Color(0xFF757575),
              ),
        ),
        const SizedBox(height: 12),
        _InsightItem(
          emoji: '👆',
          title: insight.longPressTitle,
          desc: insight.longPressDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '✅',
          title: insight.checkTitle,
          desc: insight.checkDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '🔵',
          title: insight.headerTitle,
          desc: insight.headerDesc,
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
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: const Color(0xFF757575),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
