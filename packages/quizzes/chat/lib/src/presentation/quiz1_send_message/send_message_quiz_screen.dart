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
              insight: Builder(
                builder: (context) {
                  final insight = context.s.quiz1.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '⌨️',
                        title: insight.inputTitle,
                        desc: insight.inputDesc,
                      ),
                      QuizInsightItem(
                        emoji: '➡️',
                        title: insight.sendTitle,
                        desc: insight.sendDesc,
                      ),
                      QuizInsightItem(
                        emoji: '💬',
                        title: insight.bubbleTitle,
                        desc: insight.bubbleDesc,
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

