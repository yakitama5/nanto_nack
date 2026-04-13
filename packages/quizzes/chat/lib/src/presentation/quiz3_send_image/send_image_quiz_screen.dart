import 'package:chat/src/domain/chat_catalog.dart';
import 'package:chat/src/domain/chat_quiz_config.dart';
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
  bool _showCutIn = true;
  // テキスト入力の現在値
  String _inputText = '';
  // スタンプパネルの開閉状態（Quiz3 では画像ピッカーと排他だが画像ピッカーは Notifier 管理）
  bool _isStampPanelOpen = false;

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
      final contact = state.openedContact!;
      final messages = state.messages;
      return ChatRoomScreen(
        contact: contact,
        messages: messages,
        inputText: _inputText,
        onInputChanged: (text) => setState(() => _inputText = text),
        onSendMessage: () {
          notifier.sendTextMessage(_inputText);
          setState(() => _inputText = '');
        },
        onStampTap: () => setState(() {
          // スタンプパネルを開くときは画像ピッカーを閉じる（排他制御）
          _isStampPanelOpen = !_isStampPanelOpen;
          // Notifier 側の isImagePickerOpen も閉じる
          if (_isStampPanelOpen && state.isImagePickerOpen) {
            notifier.toggleImagePicker();
          }
        }),
        onMessageLongPress: (_) {},
        isStampPanelOpen: _isStampPanelOpen,
        onStampSelected: notifier.sendStampAsMessage,
        // テキスト入力・スタンプ・画像送信を有効化してUIを一貫させる
        showTextInput: true,
        showStampButton: true,
        showImageButton: true,
        stamps: ChatCatalog.stamps,
        quizStatus: state.status,
        remainingSeconds: state.remainingSeconds,
        timeLimitSeconds: ChatQuizConfig.quiz3SendImageTimeLimitSeconds,
        missionText: missionText,
        onGiveUp: notifier.giveUp,
        overlays: overlays,
        isImagePickerOpen: state.isImagePickerOpen,
        onImageButtonTap: () {
          // 画像ピッカーを開くときはスタンプパネルを閉じる（排他制御）
          notifier.toggleImagePicker();
          setState(() => _isStampPanelOpen = false);
        },
        onImageSelected: notifier.sendImage,
        // バックアローでチャットリストへ戻れるようにする
        onBackToChatList: notifier.closeChatRoom,
      );
    }

    return ChatAppShell(
      currentTab: state.currentTab,
      onTabChanged: notifier.switchTab,
      contacts: ChatCatalog.quiz3Contacts(clock.now()),
      onContactTap: notifier.openChatRoom,
      quizStatus: state.status,
      talkTabBadgeCount: 1,
      overlays: [
        if (state.status == QuizStatus.playing)
          FloatingMissionBubble(
            remainingSeconds: state.remainingSeconds,
            missionText: missionText,
            hintUsed: false,
            timeLimitSeconds: ChatQuizConfig.quiz3SendImageTimeLimitSeconds,
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
          timeLimitSeconds: ChatQuizConfig.quiz3SendImageTimeLimitSeconds,
          onFinished: () {
            setState(() => _showCutIn = false);
            notifier.startTimer();
          },
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
              ?.copyWith(color: Theme.of(context).extension<ChatAppTheme>()!.subTextColor),
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
                    ?.copyWith(color: Theme.of(context).extension<ChatAppTheme>()!.subTextColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
