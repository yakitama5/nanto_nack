import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mail/src/i18n/mail_translations_extension.dart';
import 'package:mail/src/presentation/mail_app_bar.dart';
import 'package:mail/src/presentation/mail_drawer.dart';
import 'package:mail/src/presentation/mail_list_item.dart';
import 'package:mail/src/presentation/quiz2_empty_trash/empty_trash_quiz_notifier.dart';
import 'package:quiz_core/quiz_core.dart';

class EmptyTrashQuizScreen extends ConsumerStatefulWidget {
  const EmptyTrashQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<EmptyTrashQuizScreen> createState() =>
      _EmptyTrashQuizScreenState();
}

class _EmptyTrashQuizScreenState extends ConsumerState<EmptyTrashQuizScreen> {
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(emptyTrashQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(emptyTrashQuizProvider);
    final s = context.s;
    final sq = context.sq;
    final missionText = s.quiz2.missionText;

    return QuizExitScope(
      quizStatus: state.status,
      child: Scaffold(
        appBar: MailAppBar(
          selectedCount: 0,
          searchHint: sq.common.searchHint,
          selectedCountText: '',
        ),
        drawer: MailDrawer(
          currentFolder: state.mailApp.currentFolder,
          inboxLabel: sq.common.inbox,
          sentLabel: sq.common.sent,
          trashLabel: sq.common.trash,
          emptyTrashLabel: sq.common.emptyTrash,
          appTitle: sq.common.appTitle,
          onFolderChanged:
              ref.read(emptyTrashQuizProvider.notifier).changeFolder,
          onEmptyTrash:
              ref.read(emptyTrashQuizProvider.notifier).emptyTrash,
        ),
        body: Stack(
          children: [
            state.mailApp.currentFolderMails.isEmpty
                ? Center(
                    child: Text(
                      sq.common.noMails,
                      style: const TextStyle(color: Color(0xFF5F6368)),
                    ),
                  )
                : ListView.separated(
                    itemCount: state.mailApp.currentFolderMails.length,
                    separatorBuilder: (_, __) =>
                        const Divider(height: 1, indent: 72),
                    itemBuilder: (context, index) {
                      final mail = state.mailApp.currentFolderMails[index];
                      return MailListItem(
                        mail: mail,
                        isSelected: false,
                        archiveLabel: sq.common.archiveAction,
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
                    ref.read(emptyTrashQuizProvider.notifier).retry();
                  },
                  onNext: state.status == QuizStatus.correct
                      ? widget.onCompleted
                      : null,
                  onBack: () => Navigator.of(context).pop(),
                  insight: const _EmptyTrashInsight(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _EmptyTrashInsight extends StatelessWidget {
  const _EmptyTrashInsight();

  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz2.insight;
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
          emoji: '☰',
          title: insight.drawerTitle,
          desc: insight.drawerDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '🗑️',
          title: insight.trashTitle,
          desc: insight.trashDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '✨',
          title: insight.emptyTitle,
          desc: insight.emptyDesc,
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
