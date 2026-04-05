import 'package:chat/src/domain/entities/chat_contact.dart';
import 'package:chat/src/domain/entities/chat_message.dart';
import 'package:chat/src/i18n/chat_translations_extension.dart';
import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';

/// LINE 風のチャットルーム UI（共通ウィジェット）
class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({
    super.key,
    required this.contact,
    required this.messages,
    required this.inputText,
    required this.onInputChanged,
    required this.onSendMessage,
    required this.onStampTap,
    required this.onMessageLongPress,
    required this.isStampPanelOpen,
    required this.onStampSelected,
    required this.showTextInput,
    required this.showStampButton,
    required this.stamps,
    required this.quizStatus,
    required this.remainingSeconds,
    required this.timeLimitSeconds,
    required this.missionText,
    required this.onGiveUp,
    required this.overlays,
    this.highlightMyMessages = false,
  });

  final ChatContact contact;
  final List<ChatMessage> messages;
  final String inputText;
  final ValueChanged<String> onInputChanged;
  final VoidCallback onSendMessage;
  final VoidCallback onStampTap;
  final void Function(ChatMessage message) onMessageLongPress;
  final bool isStampPanelOpen;
  final void Function(String stampId) onStampSelected;
  final bool showTextInput;
  final bool showStampButton;
  final List<String> stamps;
  final QuizStatus quizStatus;
  final int remainingSeconds;
  final int timeLimitSeconds;
  final String missionText;
  final VoidCallback onGiveUp;
  final List<Widget> overlays;

  /// 自分のメッセージをハイライト表示（Quiz1 のヒント）
  final bool highlightMyMessages;

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final _scrollController = ScrollController();
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.inputText);
  }

  @override
  void didUpdateWidget(ChatRoomScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.inputText != oldWidget.inputText &&
        widget.inputText.isEmpty &&
        _textController.text.isNotEmpty) {
      _textController.clear();
    }
    // メッセージ追加時にスクロール
    if (widget.messages.length != oldWidget.messages.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: const Color(0xFFB2DFDB),
      body: Stack(
        children: [
          Column(
            children: [
              // AppBar 風ヘッダー
              _ChatAppBar(
                contact: widget.contact,
                quizStatus: widget.quizStatus,
                remainingSeconds: widget.remainingSeconds,
                timeLimitSeconds: widget.timeLimitSeconds,
                missionText: widget.missionText,
                onGiveUp: widget.onGiveUp,
              ),
              // メッセージリスト
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  itemCount: widget.messages.length,
                  itemBuilder: (context, index) {
                    final message = widget.messages[index];
                    if (message.isDeleted) {
                      return const SizedBox.shrink();
                    }
                    return GestureDetector(
                      onLongPress: () =>
                          widget.onMessageLongPress(message),
                      child: _MessageBubble(
                        message: message,
                        isHighlighted: widget.highlightMyMessages &&
                            message.isMine,
                      ),
                    );
                  },
                ),
              ),
              // スタンプパネル
              if (widget.isStampPanelOpen)
                _StampPanel(
                  stamps: widget.stamps,
                  onStampSelected: widget.onStampSelected,
                ),
              // 入力エリア
              _InputBar(
                controller: _textController,
                onChanged: widget.onInputChanged,
                onSend: widget.onSendMessage,
                onStampTap: widget.onStampTap,
                showTextInput: widget.showTextInput,
                showStampButton: widget.showStampButton,
                squareText: UnreadableText(sq.common.sendButton),
                stampHintText: UnreadableText(sq.common.typeMessage),
                colorScheme: colorScheme,
              ),
            ],
          ),
          // フローティングミッションバブル（プレイ中のみ表示）
          if (widget.quizStatus == QuizStatus.playing)
            FloatingMissionBubble(
              remainingSeconds: widget.remainingSeconds,
              missionText: widget.missionText,
              hintUsed: false,
              timeLimitSeconds: widget.timeLimitSeconds,
              onGiveUp: widget.onGiveUp,
            ),
          // オーバーレイ（MissionCutIn, QuizResultOverlay など）
          ...widget.overlays,
        ],
      ),
    );
  }
}

// ─── AppBar ───────────────────────────────────────────────────────────────

class _ChatAppBar extends StatelessWidget {
  const _ChatAppBar({
    required this.contact,
    required this.quizStatus,
    required this.remainingSeconds,
    required this.timeLimitSeconds,
    required this.missionText,
    required this.onGiveUp,
  });

  final ChatContact contact;
  final QuizStatus quizStatus;
  final int remainingSeconds;
  final int timeLimitSeconds;
  final String missionText;
  final VoidCallback onGiveUp;

  @override
  Widget build(BuildContext context) {
    const lineGreen = Color(0xFF00B900);

    return Container(
      color: lineGreen,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 56,
          child: Row(
            children: [
              const SizedBox(width: 8),
              const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              // アバター
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white.withValues(alpha: 0.3),
                child: Text(
                  contact.name[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UnreadableText(
                      contact.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    if (contact.isOnline)
                      const Text(
                        '●',
                        style: TextStyle(color: Colors.white70, fontSize: 10),
                      ),
                  ],
                ),
              ),
              const Icon(Icons.call, color: Colors.white),
              const SizedBox(width: 16),
              const Icon(Icons.videocam, color: Colors.white),
              const SizedBox(width: 16),
              const Icon(Icons.more_vert, color: Colors.white),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── メッセージバブル ─────────────────────────────────────────────────────

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({
    required this.message,
    this.isHighlighted = false,
  });

  final ChatMessage message;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    final isMine = message.isMine;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment:
            isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMine) ...[
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey.shade400,
              child: const Icon(Icons.person, size: 16, color: Colors.white),
            ),
            const SizedBox(width: 8),
          ],
          if (message.isStamp)
            Container(
              padding: const EdgeInsets.all(8),
              decoration: isHighlighted
                  ? BoxDecoration(
                      border: Border.all(
                        color: Colors.yellow,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    )
                  : null,
              child: Text(message.stampId ?? message.text, style: const TextStyle(fontSize: 40)),
            )
          else
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.widthOf(context) * 0.65,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: isMine
                    ? const Color(0xFFB2FF8C)
                    : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(isMine ? 16 : 4),
                  bottomRight: Radius.circular(isMine ? 4 : 16),
                ),
                border: isHighlighted
                    ? Border.all(color: Colors.yellow, width: 3)
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: UnreadableText(message.text),
            ),
          if (isMine) const SizedBox(width: 8),
        ],
      ),
    );
  }
}

// ─── スタンプパネル ────────────────────────────────────────────────────────

class _StampPanel extends StatelessWidget {
  const _StampPanel({
    required this.stamps,
    required this.onStampSelected,
  });

  final List<String> stamps;
  final void Function(String stampId) onStampSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 40,
            color: Colors.grey.shade200,
            child: const Row(
              children: [
                SizedBox(width: 16),
                Text('😊', style: TextStyle(fontSize: 20)),
                SizedBox(width: 16),
                Text('🎁', style: TextStyle(fontSize: 20)),
                SizedBox(width: 16),
                Text('🌟', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: stamps.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => onStampSelected(stamps[index]),
                  child: Center(
                    child: Text(
                      stamps[index],
                      style: const TextStyle(fontSize: 36),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ─── 入力バー ─────────────────────────────────────────────────────────────

class _InputBar extends StatelessWidget {
  const _InputBar({
    required this.controller,
    required this.onChanged,
    required this.onSend,
    required this.onStampTap,
    required this.showTextInput,
    required this.showStampButton,
    required this.squareText,
    required this.stampHintText,
    required this.colorScheme,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onSend;
  final VoidCallback onStampTap;
  final bool showTextInput;
  final bool showStampButton;
  final Widget squareText;
  final Widget stampHintText;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            if (showStampButton)
              IconButton(
                icon: const Text('😊', style: TextStyle(fontSize: 22)),
                onPressed: onStampTap,
              ),
            if (showTextInput)
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextField(
                    controller: controller,
                    onChanged: onChanged,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      hintText: '',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                  ),
                ),
              )
            else
              const Spacer(),
            const SizedBox(width: 8),
            if (showTextInput)
              GestureDetector(
                onTap: onSend,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00B900),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
