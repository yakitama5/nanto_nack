import 'package:chat/src/domain/chat_catalog.dart';
import 'package:chat/src/domain/chat_quiz_config.dart';
import 'package:chat/src/domain/entities/chat_contact.dart';
import 'package:chat/src/i18n/chat_translations_extension.dart';
import 'package:chat/src/presentation/quiz4_create_group/create_group_quiz_notifier.dart';
import 'package:chat/src/presentation/quiz4_create_group/create_group_quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

class CreateGroupQuizScreen extends ConsumerStatefulWidget {
  const CreateGroupQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<CreateGroupQuizScreen> createState() =>
      _CreateGroupQuizScreenState();
}

class _CreateGroupQuizScreenState
    extends ConsumerState<CreateGroupQuizScreen> {
  bool _showCutIn = true;
  late final TextEditingController _groupNameController;

  @override
  void initState() {
    super.initState();
    _groupNameController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(createGroupQuizProvider.notifier).startQuiz();
    });
  }

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createGroupQuizProvider);
    final missionText = context.s.quiz4.missionText;
    final sq = context.sq;

    final ext = Theme.of(context).extension<ChatAppTheme>()!;
    return Scaffold(
      backgroundColor: ext.scaffoldBackground,
      body: Stack(
        children: [
          Column(
            children: [
              // LINE風ヘッダー
              _ChatListAppBar(
                quizStatus: state.status,
                remainingSeconds: state.remainingSeconds,
                timeLimitSeconds: ChatQuizConfig.quiz4CreateGroupTimeLimitSeconds,
                missionText: missionText,
                onGiveUp: () =>
                    ref.read(createGroupQuizProvider.notifier).giveUp(),
                step: state.step,
                onBack: () {
                  if (state.step == CreateGroupStep.nameInput) {
                    ref
                        .read(createGroupQuizProvider.notifier)
                        .backToSelectMembers();
                  }
                },
              ),
              Expanded(
                child: switch (state.step) {
                  CreateGroupStep.contactList => _ContactListView(
                      onCreateGroupTap: () => ref
                          .read(createGroupQuizProvider.notifier)
                          .startGroupCreation(),
                    ),
                  CreateGroupStep.selectMembers => _SelectMembersView(
                      candidates: ChatCatalog.groupCandidates,
                      selectedMembers: state.selectedMembers,
                      onToggleMember: (contact) => ref
                          .read(createGroupQuizProvider.notifier)
                          .toggleMember(contact),
                      onNext: state.selectedMembers.length >= 2
                          ? () => ref
                              .read(createGroupQuizProvider.notifier)
                              .proceedToNameInput()
                          : null,
                    ),
                  CreateGroupStep.nameInput => _GroupNameInputView(
                      controller: _groupNameController,
                      selectedMembers: state.selectedMembers,
                      onNameChanged: (name) => ref
                          .read(createGroupQuizProvider.notifier)
                          .updateGroupName(name),
                      onCreate: () => ref
                          .read(createGroupQuizProvider.notifier)
                          .createGroup(),
                      squareText: sq,
                    ),
                },
              ),
            ],
          ),
          // フローティングミッションバブル（プレイ中のみ表示）
          if (state.status == QuizStatus.playing)
            FloatingMissionBubble(
              remainingSeconds: state.remainingSeconds,
              missionText: missionText,
              hintUsed: false,
              timeLimitSeconds: ChatQuizConfig.quiz4CreateGroupTimeLimitSeconds,
              onGiveUp: () =>
                  ref.read(createGroupQuizProvider.notifier).giveUp(),
            ),
          // オーバーレイ
          if (_showCutIn)
            MissionCutIn(
              missionText: missionText,
              timeLimitSeconds: ChatQuizConfig.quiz4CreateGroupTimeLimitSeconds,
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
                  setState(() {
                    _showCutIn = true;
                    _groupNameController.clear();
                  });
                  ref.read(createGroupQuizProvider.notifier).retry();
                },
                onNext: state.status == QuizStatus.correct
                    ? widget.onCompleted
                    : null,
                onBack: () => Navigator.of(context).pop(),
                isLimitReached: ref.watch(isPlayLimitReachedProvider).valueOrNull ?? false,
                insight: _CreateGroupInsight(),
              ),
            ),
        ],
      ),
    );
  }
}

// ─── ヘッダー ──────────────────────────────────────────────────────────────

class _ChatListAppBar extends StatelessWidget {
  const _ChatListAppBar({
    required this.quizStatus,
    required this.remainingSeconds,
    required this.timeLimitSeconds,
    required this.missionText,
    required this.onGiveUp,
    required this.step,
    required this.onBack,
  });

  final QuizStatus quizStatus;
  final int remainingSeconds;
  final int timeLimitSeconds;
  final String missionText;
  final VoidCallback onGiveUp;
  final CreateGroupStep step;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    final ext = Theme.of(context).extension<ChatAppTheme>()!;
    final showBack = step != CreateGroupStep.contactList;

    return Container(
      color: ext.brandColor,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 56,
          child: Row(
            children: [
              if (showBack) ...[
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios,
                      color: Colors.white, size: 20),
                  onPressed: onBack,
                ),
              ] else
                const SizedBox(width: 16),
              Expanded(
                child: UnreadableText(
                  sq.common.appTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              // グループ作成ボタン（contactList ステップのみ）
              if (step == CreateGroupStep.contactList)
                IconButton(
                  icon: const Icon(
                    Icons.group_add,
                    color: Colors.white,
                  ),
                  onPressed: null, // タップはFABで受け付ける
                ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── コンタクトリスト ──────────────────────────────────────────────────────

class _ContactListView extends StatelessWidget {
  const _ContactListView({required this.onCreateGroupTap});

  final VoidCallback onCreateGroupTap;

  @override
  Widget build(BuildContext context) {
    final contacts = ChatCatalog.contacts;
    final ext = Theme.of(context).extension<ChatAppTheme>()!;

    return Stack(
      children: [
        ListView.separated(
          itemCount: contacts.length,
          separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
          itemBuilder: (context, index) {
            final contact = contacts[index];
            return ListTile(
              tileColor: ext.surfaceColor,
              leading: CircleAvatar(
                backgroundColor: ext.avatarBackground,
                child: Text(
                  contact.name[0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: UnreadableText(
                contact.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: UnreadableText(
                contact.lastMessage,
                style: TextStyle(color: ext.subTextColor, fontSize: 12),
              ),
              trailing: contact.unreadCount > 0
                  ? CircleAvatar(
                      radius: 10,
                      backgroundColor: ext.brandColor,
                      child: Text(
                        '${contact.unreadCount}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    )
                  : null,
            );
          },
        ),
        // FAB: グループ作成
        Positioned(
          right: 16,
          bottom: 16,
          child: FloatingActionButton(
            onPressed: onCreateGroupTap,
            backgroundColor: ext.brandColor,
            child: const Icon(Icons.group_add, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

// ─── メンバー選択 ──────────────────────────────────────────────────────────

class _SelectMembersView extends StatelessWidget {
  const _SelectMembersView({
    required this.candidates,
    required this.selectedMembers,
    required this.onToggleMember,
    required this.onNext,
  });

  final List<ChatContact> candidates;
  final List<ChatContact> selectedMembers;
  final void Function(ChatContact) onToggleMember;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    final ext = Theme.of(context).extension<ChatAppTheme>()!;

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: candidates.length,
            separatorBuilder: (_, __) =>
                const Divider(height: 1, indent: 72),
            itemBuilder: (context, index) {
              final contact = candidates[index];
              final isSelected =
                  selectedMembers.any((m) => m.id == contact.id);
              return ListTile(
                tileColor: ext.surfaceColor,
                leading: CircleAvatar(
                  backgroundColor: ext.avatarBackground,
                  child: Text(
                    contact.name[0],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: UnreadableText(
                  contact.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Checkbox(
                  value: isSelected,
                  activeColor: ext.brandColor,
                  onChanged: (_) => onToggleMember(contact),
                ),
                onTap: () => onToggleMember(contact),
              );
            },
          ),
        ),
        // 次へボタン
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onNext,
              style: FilledButton.styleFrom(
                backgroundColor: ext.brandColor,
              ),
              child: UnreadableText(
                sq.common.createGroup,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── グループ名入力 ────────────────────────────────────────────────────────

class _GroupNameInputView extends StatelessWidget {
  const _GroupNameInputView({
    required this.controller,
    required this.selectedMembers,
    required this.onNameChanged,
    required this.onCreate,
    required this.squareText,
  });

  final TextEditingController controller;
  final List<ChatContact> selectedMembers;
  final ValueChanged<String> onNameChanged;
  final VoidCallback onCreate;
  final dynamic squareText;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ChatAppTheme>()!;
    return Column(
      children: [
        Container(
          color: ext.surfaceColor,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // グループアバター
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: ext.borderColor,
                      child: const Icon(Icons.group, size: 40),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: ext.brandColor,
                        child: const Icon(
                          Icons.camera_alt,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // グループ名入力
              TextField(
                controller: controller,
                onChanged: onNameChanged,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ext.scaffoldBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // 選択メンバー
              Wrap(
                spacing: 8,
                children: selectedMembers.map((m) {
                  return Chip(
                    avatar: CircleAvatar(
                      backgroundColor: ext.avatarBackground,
                      child: Text(
                        m.name[0],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    label: UnreadableText(m.name),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        const Spacer(),
        // 作成ボタン
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onCreate,
              style: FilledButton.styleFrom(
                backgroundColor: ext.brandColor,
              ),
              child: Text(
                context.sq.common.createButton,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── UX 解説 ──────────────────────────────────────────────────────────────

class _CreateGroupInsight extends StatelessWidget {
  const _CreateGroupInsight();

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
              ?.copyWith(color: Theme.of(context).extension<ChatAppTheme>()!.subTextColor),
        ),
        const SizedBox(height: 12),
        _InsightItem(emoji: '➕', title: insight.plusTitle, desc: insight.plusDesc),
        const SizedBox(height: 10),
        _InsightItem(emoji: '🧭', title: insight.wizardTitle, desc: insight.wizardDesc),
        const SizedBox(height: 10),
        _InsightItem(emoji: '☑️', title: insight.checkboxTitle, desc: insight.checkboxDesc),
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
