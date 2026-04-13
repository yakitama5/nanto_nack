import 'package:chat/src/domain/chat_catalog.dart';
import 'package:chat/src/domain/chat_quiz_config.dart';
import 'package:chat/src/i18n/chat_translations_extension.dart';
import 'package:chat/src/presentation/chat_room_screen.dart';
import 'package:chat/src/presentation/quiz1_send_message/send_message_quiz_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

class SendMessageQuizScreen extends ConsumerStatefulWidget {
  const SendMessageQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<SendMessageQuizScreen> createState() =>
      _SendMessageQuizScreenState();
}

class _SendMessageQuizScreenState
    extends ConsumerState<SendMessageQuizScreen> {
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(sendMessageQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sendMessageQuizProvider);
    final missionText = context.s.quiz1.missionText;
    final contact = ChatCatalog.contacts.first;

    return ChatRoomScreen(
      contact: contact,
      messages: state.messages,
      inputText: state.inputText,
      onInputChanged: (text) =>
          ref.read(sendMessageQuizProvider.notifier).updateInputText(text),
      onSendMessage: () =>
          ref.read(sendMessageQuizProvider.notifier).sendMessage(),
      onStampTap: () {},
      onMessageLongPress: (_) {},
      isStampPanelOpen: false,
      onStampSelected: (_) {},
      showTextInput: true,
      showStampButton: false,
      stamps: const [],
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: ChatQuizConfig.quiz1SendMessageTimeLimitSeconds,
      missionText: missionText,
      onGiveUp: () =>
          ref.read(sendMessageQuizProvider.notifier).giveUp(),
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: ChatQuizConfig.quiz1SendMessageTimeLimitSeconds,
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
                ref.read(sendMessageQuizProvider.notifier).retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              insight: _SendMessageInsight(missionText: missionText),
            ),
          ),
      ],
    );
  }
}

class _SendMessageInsight extends StatelessWidget {
  const _SendMessageInsight({required this.missionText});

  final String missionText;

  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz1.insight;
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
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Theme.of(context).extension<ChatAppTheme>()!.subTextColor),
        ),
        const SizedBox(height: 12),
        _InsightItem(emoji: '⌨️', title: insight.inputTitle, desc: insight.inputDesc),
        const SizedBox(height: 10),
        _InsightItem(emoji: '➡️', title: insight.sendTitle, desc: insight.sendDesc),
        const SizedBox(height: 10),
        _InsightItem(emoji: '💬', title: insight.bubbleTitle, desc: insight.bubbleDesc),
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
                    ?.copyWith(color: Theme.of(context).extension<ChatAppTheme>()!.subTextColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
