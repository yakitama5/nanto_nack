import 'package:chat/src/domain/chat_catalog.dart';
import 'package:chat/src/i18n/chat_translations_extension.dart';
import 'package:chat/src/presentation/chat_app_shell.dart';
import 'package:chat/src/presentation/chat_room_screen.dart';
import 'package:chat/src/presentation/quiz3_send_image/send_image_quiz_notifier.dart';
import 'package:chat/src/presentation/quiz3_send_image/send_image_quiz_state.dart';
import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

class SendImageQuizScreen extends ConsumerStatefulWidget {
  const SendImageQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<SendImageQuizScreen> createState() =>
      _SendImageQuizScreenState();
}

class _SendImageQuizScreenState extends ConsumerState<SendImageQuizScreen> {
  static const _timeLimitSeconds = 60;
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(sendImageQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sendImageQuizProvider);
    final missionText = context.s.quiz3.missionText;
    final notifier = ref.read(sendImageQuizProvider.notifier);

    final overlays = _buildOverlays(state, missionText, notifier);

    if (state.isInChatRoom) {
      return ChatRoomScreen(
        contact: ChatCatalog.quiz3Contacts(clock.now())[2], // Carol
        messages: state.messages,
        inputText: '',
        onInputChanged: (_) {},
        onSendMessage: () {},
        onStampTap: () {},
        onMessageLongPress: (_) {},
        isStampPanelOpen: false,
        onStampSelected: (_) {},
        showTextInput: false,
        showStampButton: false,
        stamps: const [],
        quizStatus: state.status,
        remainingSeconds: state.remainingSeconds,
        timeLimitSeconds: _timeLimitSeconds,
        missionText: missionText,
        onGiveUp: notifier.giveUp,
        overlays: overlays,
        showImageButton: true,
        isImagePickerOpen: state.isImagePickerOpen,
        onImageButtonTap: notifier.toggleImagePicker,
        onImageSelected: notifier.sendImage,
      );
    }

    return ChatAppShell(
      currentTab: state.currentTab,
      onTabChanged: notifier.switchTab,
      contacts: ChatCatalog.quiz3Contacts(clock.now()),
      onContactTap: (contact) {
        if (contact.id == 'carol') notifier.openChatRoom();
      },
      talkTabBadgeCount: 1,
      overlays: [
        if (state.status == QuizStatus.playing)
          FloatingMissionBubble(
            remainingSeconds: state.remainingSeconds,
            missionText: missionText,
            hintUsed: false,
            timeLimitSeconds: _timeLimitSeconds,
            onGiveUp: notifier.giveUp,
          ),
        ...overlays,
      ],
    );
  }

  List<Widget> _buildOverlays(
    SendImageQuizState state,
    String missionText,
    SendImageQuizNotifier notifier,
  ) {
    return [
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
              notifier.retry();
            },
            onNext: state.status == QuizStatus.correct
                ? widget.onCompleted
                : null,
            onBack: () => Navigator.of(context).pop(),
            insight: const _SendImageInsight(),
          ),
        ),
    ];
  }
}

class _SendImageInsight extends StatelessWidget {
  const _SendImageInsight();

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
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 12),
        _InsightItem(
          emoji: '➕',
          title: insight.plusTitle,
          desc: insight.plusDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '📷',
          title: insight.photoTitle,
          desc: insight.photoDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '🖼️',
          title: insight.galleryTitle,
          desc: insight.galleryDesc,
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
                    ?.copyWith(color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
