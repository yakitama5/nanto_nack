import 'package:chat/src/domain/chat_catalog.dart';
import 'package:chat/src/domain/chat_quiz_config.dart';
import 'package:chat/src/domain/entities/chat_contact.dart';
import 'package:chat/src/domain/entities/chat_message.dart';
import 'package:chat/src/i18n/chat_translations_extension.dart';
import 'package:chat/src/presentation/chat_app_shell.dart';
import 'package:chat/src/presentation/chat_room_screen.dart';
import 'package:chat/src/presentation/quiz1_send_stamp/send_stamp_quiz_notifier.dart';
import 'package:chat/src/presentation/quiz1_send_stamp/send_stamp_quiz_state.dart';
import 'package:clock/clock.dart';
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
  // テキスト入力の現在値（チャットルーム画面でのみ使用）
  String _inputText = '';
  // 画像ピッカーパネルの開閉状態
  bool _isImagePickerOpen = false;
  // 間違ったコンタクトのルームに入ったときに保持するコンタクト情報
  ChatContact? _openedContact;

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
    final missionText = context.s.quiz1.missionText;
    final notifier = ref.read(sendStampQuizProvider.notifier);

    final overlays = _buildOverlays(state, missionText, notifier);

    if (state.isInChatRoom) {
      // 間違ったルームの場合はタップしたコンタクトと空メッセージを表示する
      final contact = state.isCorrectChatRoom
          ? ChatCatalog.quiz1Contacts(clock.now())[0] // Alice
          : _openedContact!;
      final messages =
          state.isCorrectChatRoom ? state.messages : <ChatMessage>[];
      return ChatRoomScreen(
        contact: contact,
        messages: messages,
        inputText: _inputText,
        onInputChanged: (text) => setState(() => _inputText = text),
        onSendMessage: () {
          notifier.sendTextMessage(_inputText);
          setState(() => _inputText = '');
        },
        onStampTap: notifier.toggleStampPanel,
        onMessageLongPress: (_) {},
        isStampPanelOpen: state.isStampPanelOpen,
        onStampSelected: notifier.sendStamp,
        // テキスト入力・画像送信を有効化してUIを一貫させる
        showTextInput: true,
        showStampButton: true,
        showImageButton: true,
        stamps: ChatCatalog.stamps,
        quizStatus: state.status,
        remainingSeconds: state.remainingSeconds,
        timeLimitSeconds: ChatQuizConfig.quiz1SendStampTimeLimitSeconds,
        missionText: missionText,
        onGiveUp: notifier.giveUp,
        overlays: overlays,
        isImagePickerOpen: _isImagePickerOpen,
        onImageButtonTap: () => setState(() {
          _isImagePickerOpen = !_isImagePickerOpen;
        }),
        onImageSelected: (path) {
          notifier.sendImageAsMessage(path);
          setState(() => _isImagePickerOpen = false);
        },
        // バックアローでチャットリストへ戻れるようにする
        onBackToChatList: notifier.closeChatRoom,
      );
    }

    return ChatAppShell(
      currentTab: state.currentTab,
      onTabChanged: (tab) {
        notifier.switchTab(tab);
      },
      contacts: ChatCatalog.quiz1Contacts(clock.now()),
      // Alice なら正解チャットルームへ、それ以外は間違ったルームへ遷移する
      onContactTap: (contact) {
        if (contact.id == 'alice') {
          notifier.openChatRoom();
        } else {
          setState(() => _openedContact = contact);
          notifier.openWrongChatRoom();
        }
      },
      quizStatus: state.status,
      talkTabBadgeCount: 1,
      overlays: [
        // チャットルーム外でもミッションバブルを表示
        if (state.status == QuizStatus.playing)
          FloatingMissionBubble(
            remainingSeconds: state.remainingSeconds,
            missionText: missionText,
            hintUsed: false,
            timeLimitSeconds: ChatQuizConfig.quiz1SendStampTimeLimitSeconds,
            onGiveUp: notifier.giveUp,
          ),
        ...overlays,
      ],
    );
  }

  List<Widget> _buildOverlays(
    SendStampQuizState state,
    String missionText,
    SendStampQuizNotifier notifier,
  ) {
    return [
      if (_showCutIn)
        MissionCutIn(
          missionText: missionText,
          timeLimitSeconds: ChatQuizConfig.quiz1SendStampTimeLimitSeconds,
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
            insight: const _SendStampInsight(),
          ),
        ),
    ];
  }
}

class _SendStampInsight extends StatelessWidget {
  const _SendStampInsight();

  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz1.insight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuizInsightHeader(title: insight.title, subtitle: insight.subtitle),
        const SizedBox(height: 12),
        QuizInsightItem(
          emoji: '🔴',
          title: insight.badgeTitle,
          desc: insight.badgeDesc,
        ),
        const SizedBox(height: 10),
        QuizInsightItem(
          emoji: '😊',
          title: insight.stampTitle,
          desc: insight.stampDesc,
        ),
        const SizedBox(height: 10),
        QuizInsightItem(
          emoji: '📱',
          title: insight.tabTitle,
          desc: insight.tabDesc,
        ),
      ],
    );
  }
}
