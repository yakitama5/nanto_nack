import 'package:chat/src/domain/chat_catalog.dart';
import 'package:chat/src/domain/chat_quiz_config.dart';
import 'package:chat/src/domain/entities/chat_message.dart';
import 'package:chat/src/i18n/chat_translations_extension.dart';
import 'package:chat/src/presentation/chat_room_screen.dart';
import 'package:chat/src/presentation/quiz3_delete_message/delete_message_quiz_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

class DeleteMessageQuizScreen extends ConsumerStatefulWidget {
  const DeleteMessageQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<DeleteMessageQuizScreen> createState() =>
      _DeleteMessageQuizScreenState();
}

class _DeleteMessageQuizScreenState
    extends ConsumerState<DeleteMessageQuizScreen> {
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(deleteMessageQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(deleteMessageQuizProvider);
    final missionText = context.s.quiz3.missionText;
    final contact = ChatCatalog.contacts[2];

    return ChatRoomScreen(
      contact: contact,
      messages: state.messages,
      inputText: '',
      onInputChanged: (_) {},
      onSendMessage: () {},
      onStampTap: () {},
      onMessageLongPress: (message) =>
          _showDeleteDialog(context, message),
      isStampPanelOpen: false,
      onStampSelected: (_) {},
      showTextInput: false,
      showStampButton: false,
      stamps: const [],
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: ChatQuizConfig.quiz3DeleteMessageTimeLimitSeconds,
      missionText: missionText,
      onGiveUp: () =>
          ref.read(deleteMessageQuizProvider.notifier).giveUp(),
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: ChatQuizConfig.quiz3DeleteMessageTimeLimitSeconds,
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
                ref.read(deleteMessageQuizProvider.notifier).retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              isLimitReached: ref.isPlayLimitReached,
              insight: _DeleteMessageInsight(),
            ),
          ),
      ],
    );
  }

  void _showDeleteDialog(BuildContext context, ChatMessage message) {
    // 自分のメッセージのみ削除可能
    if (!message.isMine) return;

    final sq = context.sq;
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: UnreadableText(
                sq.common.deleteButton,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(ctx).pop();
                ref
                    .read(deleteMessageQuizProvider.notifier)
                    .deleteMessage(message.id);
              },
            ),
            ListTile(
              leading: const Icon(Icons.cancel_outlined),
              title: UnreadableText(sq.common.cancelButton),
              onTap: () => Navigator.of(ctx).pop(),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeleteMessageInsight extends StatelessWidget {
  const _DeleteMessageInsight();

  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz3.insight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuizInsightHeader(title: insight.title, subtitle: insight.subtitle),
        const SizedBox(height: 12),
        QuizInsightItem(emoji: '👇', title: insight.longPressTitle, desc: insight.longPressDesc),
        const SizedBox(height: 10),
        QuizInsightItem(emoji: '📋', title: insight.contextMenuTitle, desc: insight.contextMenuDesc),
        const SizedBox(height: 10),
        QuizInsightItem(emoji: '🔴', title: insight.destructiveTitle, desc: insight.destructiveDesc),
      ],
    );
  }
}
