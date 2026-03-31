import 'package:chat/src/domain/chat_catalog.dart';
import 'package:chat/src/i18n/chat_translations_extension.dart';
import 'package:chat/src/presentation/chat_room_screen.dart';
import 'package:chat/src/presentation/quiz2_send_stamp/send_stamp_quiz_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

class SendStampQuizScreen extends ConsumerStatefulWidget {
  const SendStampQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<SendStampQuizScreen> createState() =>
      _SendStampQuizScreenState();
}

class _SendStampQuizScreenState extends ConsumerState<SendStampQuizScreen> {
  static const _timeLimitSeconds = 60;
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
      timeLimitSeconds: _timeLimitSeconds,
      missionText: missionText,
      onGiveUp: () => ref.read(sendStampQuizProvider.notifier).giveUp(),
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: _timeLimitSeconds,
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
              ?.copyWith(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 12),
        _InsightItem(emoji: '😊', title: insight.emojiTitle, desc: insight.emojiDesc),
        const SizedBox(height: 10),
        _InsightItem(emoji: '🎨', title: insight.iconTitle, desc: insight.iconDesc),
        const SizedBox(height: 10),
        _InsightItem(emoji: '🟢', title: insight.colorTitle, desc: insight.colorDesc),
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
                    ?.copyWith(color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
