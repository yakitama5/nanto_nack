import 'package:chat/src/domain/chat_catalog.dart';
import 'package:chat/src/domain/chat_quiz_config.dart';
import 'package:chat/src/domain/entities/chat_contact.dart';
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
import 'package:system/system.dart';

class CancelMessageQuizScreen extends ConsumerStatefulWidget {
  const CancelMessageQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<CancelMessageQuizScreen> createState() =>
      _CancelMessageQuizScreenState();
}

class _CancelMessageQuizScreenState
    extends ConsumerState<CancelMessageQuizScreen> {
  bool _showCutIn = true;
  // 間違ったコンタクトのルームに入ったときに保持するコンタクト情報
  ChatContact? _openedContact;

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
      final isCorrect = state.isCorrectChatRoom;
      // 間違ったルームの場合はタップしたコンタクトと空メッセージを表示する
      final contact = isCorrect
          ? ChatCatalog.quiz4Contacts(clock.now())[0] // Alice（最上位）
          : _openedContact!;
      final messages = isCorrect ? state.messages : <ChatMessage>[];
      return ChatRoomScreen(
        contact: contact,
        messages: messages,
        inputText: '',
        onInputChanged: (_) {},
        onSendMessage: () {},
        onStampTap: () {},
        // 間違ったルームでは長押しメニューを表示しない（アクション実行で不正解になるため）
        onMessageLongPress: isCorrect
            ? (message) => _showCancelMenu(context, message, notifier)
            : (_) {},
        isStampPanelOpen: false,
        onStampSelected: (_) {},
        showTextInput: false,
        showStampButton: false,
        stamps: const [],
        quizStatus: state.status,
        remainingSeconds: state.remainingSeconds,
        timeLimitSeconds: ChatQuizConfig.quiz4CancelMessageTimeLimitSeconds,
        missionText: missionText,
        onGiveUp: notifier.giveUp,
        overlays: overlays,
        // 間違ったルームではバックアローで戻れるようにする
        onBackToChatList: isCorrect ? null : notifier.closeChatRoom,
      );
    }

    // トークリストはquiz4専用（Aliceが最上位）
    final contacts = ChatCatalog.quiz4Contacts(clock.now());

    return ChatAppShell(
      currentTab: state.currentTab,
      onTabChanged: notifier.switchTab,
      contacts: contacts,
      // 一番上のコンタクト（Alice）なら正解ルームへ、それ以外は間違ったルームへ遷移する
      onContactTap: (contact) {
        if (contact.id == contacts.first.id) {
          notifier.openChatRoom();
        } else {
          setState(() => _openedContact = contact);
          notifier.openWrongChatRoom();
        }
      },
      quizStatus: state.status,
      talkTabBadgeCount: 0,
      overlays: [
        if (state.status == QuizStatus.playing)
          FloatingMissionBubble(
            remainingSeconds: state.remainingSeconds,
            missionText: missionText,
            hintUsed: false,
            timeLimitSeconds: ChatQuizConfig.quiz4CancelMessageTimeLimitSeconds,
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
          timeLimitSeconds: ChatQuizConfig.quiz4CancelMessageTimeLimitSeconds,
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
        QuizInsightHeader(title: insight.title, subtitle: insight.subtitle),
        const SizedBox(height: 12),
        QuizInsightItem(
          emoji: '📋',
          title: insight.listTitle,
          desc: insight.listDesc,
        ),
        const SizedBox(height: 10),
        QuizInsightItem(
          emoji: '👇',
          title: insight.longPressTitle,
          desc: insight.longPressDesc,
        ),
        const SizedBox(height: 10),
        QuizInsightItem(
          emoji: '🔴',
          title: insight.redTitle,
          desc: insight.redDesc,
        ),
      ],
    );
  }
}
