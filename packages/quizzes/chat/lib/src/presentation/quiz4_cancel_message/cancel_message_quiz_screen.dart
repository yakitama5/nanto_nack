import 'package:chat/src/domain/chat_catalog.dart';
import 'package:chat/src/domain/entities/chat_message.dart';
import 'package:chat/src/i18n/chat_translations_extension.dart';
import 'package:chat/src/presentation/chat_app_shell.dart';
import 'package:chat/src/presentation/chat_room_screen.dart';
import 'package:chat/src/presentation/quiz4_cancel_message/cancel_message_quiz_notifier.dart';
import 'package:chat/src/presentation/quiz4_cancel_message/cancel_message_quiz_state.dart';
import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

class CancelMessageQuizScreen extends ConsumerStatefulWidget {
  const CancelMessageQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<CancelMessageQuizScreen> createState() =>
      _CancelMessageQuizScreenState();
}

class _CancelMessageQuizScreenState
    extends ConsumerState<CancelMessageQuizScreen> {
  static const _timeLimitSeconds = 60;
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(cancelMessageQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cancelMessageQuizProvider);
    final missionText = context.s.quiz4.missionText;
    final notifier = ref.read(cancelMessageQuizProvider.notifier);

    final overlays = _buildOverlays(state, missionText, notifier);

    if (state.isInChatRoom) {
      return ChatRoomScreen(
        contact: ChatCatalog.quiz4Contacts(clock.now())[0], // Alice（最上位）
        messages: state.messages,
        inputText: '',
        onInputChanged: (_) {},
        onSendMessage: () {},
        onStampTap: () {},
        onMessageLongPress: (message) =>
            _showCancelMenu(context, message, notifier),
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
      );
    }

    // トークリストはquiz4専用（Aliceが最上位）
    final contacts = ChatCatalog.quiz4Contacts(clock.now());

    return ChatAppShell(
      currentTab: state.currentTab,
      onTabChanged: notifier.switchTab,
      contacts: contacts,
      onContactTap: (contact) {
        // 一番上のコンタクト（Alice）をタップでチャットルームへ
        if (contact.id == contacts.first.id) notifier.openChatRoom();
      },
      talkTabBadgeCount: 0,
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

  void _showCancelMenu(
    BuildContext context,
    ChatMessage message,
    CancelMessageQuizNotifier notifier,
  ) {
    // 自分のメッセージのみ長押しメニューを表示
    if (!message.isMine) return;

    final sq = context.sq;
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => SafeArea(
        child: ListTile(
          leading: const Icon(Icons.undo, color: Colors.red),
          title: UnreadableText(
            sq.common.unsendMessage,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.of(ctx).pop();
            notifier.cancelMessage(message.id);
          },
        ),
      ),
    );
  }

  List<Widget> _buildOverlays(
    CancelMessageQuizState state,
    String missionText,
    CancelMessageQuizNotifier notifier,
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
            insight: const _CancelMessageInsight(),
          ),
        ),
    ];
  }
}

class _CancelMessageInsight extends StatelessWidget {
  const _CancelMessageInsight();

  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz4.insight;
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
          emoji: '📋',
          title: insight.listTitle,
          desc: insight.listDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '👇',
          title: insight.longPressTitle,
          desc: insight.longPressDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '🔴',
          title: insight.redTitle,
          desc: insight.redDesc,
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
