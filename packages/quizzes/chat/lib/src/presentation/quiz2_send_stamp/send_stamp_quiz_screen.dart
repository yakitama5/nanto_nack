import 'package:chat/src/domain/chat_catalog.dart';
import 'package:chat/src/domain/chat_quiz_config.dart';
import 'package:chat/src/i18n/chat_translations_extension.dart';
import 'package:chat/src/presentation/chat_room_screen.dart';
import 'package:chat/src/presentation/quiz2_send_stamp/send_stamp_quiz_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

class SendStampQuizScreen extends ConsumerStatefulWidget {
  const SendStampQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<SendStampQuizScreen> createState() =>
      _SendStampQuizScreenState();
}

class _SendStampQuizScreenState extends ConsumerState<SendStampQuizScreen> {
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(sendStampQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sendStampQuizProvider);
    final missionText = context.s.quiz2.missionText;
    final contact = ChatCatalog.contacts[1];

    return ChatRoomScreen(
      contact: contact,
      messages: state.messages,
      inputText: '',
      onInputChanged: (_) {},
      onSendMessage: () {},
      onStampTap: () =>
          ref.read(sendStampQuizProvider.notifier).toggleStampPanel(),
      onMessageLongPress: (_) {},
      isStampPanelOpen: state.isStampPanelOpen,
      onStampSelected: (stampId) =>
          ref.read(sendStampQuizProvider.notifier).sendStamp(stampId),
      showTextInput: false,
      showStampButton: true,
      stamps: ChatCatalog.stamps,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: ChatQuizConfig.quiz2SendStampTimeLimitSeconds,
      missionText: missionText,
      onGiveUp: () => ref.read(sendStampQuizProvider.notifier).giveUp(),
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: ChatQuizConfig.quiz2SendStampTimeLimitSeconds,
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
                ref.read(sendStampQuizProvider.notifier).retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              isLimitReached: ref.isPlayLimitReached,
              insight: _SendStampInsight(),
            ),
          ),
      ],
    );
  }
}

class _SendStampInsight extends StatelessWidget {
  const _SendStampInsight();

  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz2.insight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuizInsightHeader(title: insight.title, subtitle: insight.subtitle),
        const SizedBox(height: 12),
        QuizInsightItem(emoji: '😊', title: insight.emojiTitle, desc: insight.emojiDesc),
        const SizedBox(height: 10),
        QuizInsightItem(emoji: '🎨', title: insight.iconTitle, desc: insight.iconDesc),
        const SizedBox(height: 10),
        QuizInsightItem(emoji: '🟢', title: insight.colorTitle, desc: insight.colorDesc),
      ],
    );
  }
}
