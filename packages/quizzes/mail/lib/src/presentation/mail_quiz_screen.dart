import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mail/src/domain/mail_quiz_config.dart';
import 'package:mail/src/i18n/mail_translations_extension.dart';
import 'package:mail/src/presentation/mail_app_bar.dart';
import 'package:mail/src/presentation/mail_drawer.dart';
import 'package:mail/src/presentation/mail_list_item.dart';
import 'package:mail/src/presentation/mail_quiz_notifier.dart';
import 'package:mail/src/presentation/mail_quiz_state.dart';
import 'package:mail/src/presentation/mail_quiz_type.dart';
import 'package:quiz_core/quiz_core.dart';

/// メールアプリ謎解きの共通画面。
///
/// [type] によって Quiz1〜4 のいずれかとして動作する。
/// UI の骨格・ライフサイクル（cutIn / resultOverlay / giveUp）は共通。
/// クイズ固有の操作（アーカイブ・ゴミ箱・選択削除・検索）は [type] で分岐する。
class MailQuizScreen extends ConsumerStatefulWidget {
  const MailQuizScreen({
    super.key,
    required this.type,
    this.onCompleted,
  });

  final MailQuizType type;
  final VoidCallback? onCompleted;

  @override
  ConsumerState<MailQuizScreen> createState() => _MailQuizScreenState();
}

class _MailQuizScreenState extends ConsumerState<MailQuizScreen> {
  bool _showCutIn = true;

  /// Quiz4 (search) 専用のテキストコントローラー
  final _searchController = TextEditingController();

  MailQuizType get _type => widget.type;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mailQuizProvider(_type).notifier).startQuiz();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mailQuizProvider(_type));
    final missionText = _missionText();

    final notifier = ref.read(mailQuizProvider(_type).notifier);
    final selectedCount = state.mailApp.selectedMailIds.length;
    final isSelectionMode = state.mailApp.isSelectionMode;

    return QuizExitScope(
      quizStatus: state.status,
      child: Scaffold(
        appBar: _buildAppBar(
          state: state,
          selectedCount: selectedCount,
          notifier: notifier,
        ),
        drawer: _buildDrawer(state: state, notifier: notifier),
        body: Stack(
          children: [
            _buildBody(
              state: state,
              isSelectionMode: isSelectionMode,
              notifier: notifier,
            ),
            FloatingMissionBubble(
              missionText: missionText,
              remainingSeconds: state.remainingSeconds,
              timeLimitSeconds: MailQuizConfig.timeLimitSeconds,
              hintUsed: false,
            ),
            if (_showCutIn)
              MissionCutIn(
                missionText: missionText,
                timeLimitSeconds: MailQuizConfig.timeLimitSeconds,
                onFinished: () => setState(() => _showCutIn = false),
              ),
            if (state.status == QuizStatus.correct ||
                state.status == QuizStatus.giveUp ||
                state.status == QuizStatus.timeUp)
              Positioned.fill(
                child: QuizResultOverlay(
                  status: state.status,
                  score: state.score,
                  elapsedMs: state.elapsedMs,
                  onRetry: () {
                    setState(() => _showCutIn = true);
                    _searchController.clear();
                    notifier.retry();
                  },
                  onNext: state.status == QuizStatus.correct
                      ? widget.onCompleted
                      : null,
                  onBack: () => Navigator.of(context).pop(),
                  insight: _buildInsight(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // AppBar
  // ─────────────────────────────────────────────

  PreferredSizeWidget _buildAppBar({
    required MailQuizState state,
    required int selectedCount,
    required MailQuizNotifier notifier,
  }) {
    final sq = context.sq;

    if (_type == MailQuizType.search) {
      return _SearchAppBar(
        isSearching: state.isSearching,
        searchController: _searchController,
        searchHint: sq.common.searchHint,
        hint: context.s.quiz4.hint,
        onOpenSearch: notifier.openSearch,
        onCancelSearch: () {
          _searchController.clear();
          notifier.cancelSearch();
        },
        onQueryChanged: notifier.updateQuery,
        onSubmitSearch: notifier.submitSearch,
        onShowHint: () => _showHintSnackBar(context.s.quiz4.hint),
      );
    }

    return MailAppBar(
      selectedCount: _type == MailQuizType.selectDelete ? selectedCount : 0,
      searchHint: sq.common.searchHint,
      selectedCountText:
          sq.common.selectedCount.replaceAll('{count}', '$selectedCount'),
      onClearSelection:
          _type == MailQuizType.selectDelete ? notifier.clearSelection : null,
      onDeleteSelected:
          _type == MailQuizType.selectDelete ? notifier.moveToTrash : null,
    );
  }

  // ─────────────────────────────────────────────
  // Drawer
  // ─────────────────────────────────────────────

  Widget? _buildDrawer({
    required MailQuizState state,
    required MailQuizNotifier notifier,
  }) {
    final sq = context.sq;
    return MailDrawer(
      currentFolder: state.mailApp.currentFolder,
      inboxLabel: sq.common.inbox,
      sentLabel: sq.common.sent,
      trashLabel: sq.common.trash,
      emptyTrashLabel: sq.common.emptyTrash,
      appTitle: sq.common.appTitle,
      onFolderChanged:
          _type == MailQuizType.emptyTrash ? notifier.changeFolder : null,
      onEmptyTrash:
          _type == MailQuizType.emptyTrash ? notifier.emptyTrash : null,
    );
  }

  // ─────────────────────────────────────────────
  // Body
  // ─────────────────────────────────────────────

  Widget _buildBody({
    required MailQuizState state,
    required bool isSelectionMode,
    required MailQuizNotifier notifier,
  }) {
    final sq = context.sq;
    final mailTheme = Theme.of(context).extension<MailAppTheme>()!;

    if (_type == MailQuizType.search && state.isSearching) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            sq.common.searchPrompt,
            style: TextStyle(color: mailTheme.textSecondary),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final mails = state.mailApp.currentFolderMails;

    if (mails.isEmpty) {
      return Center(
        child: Text(
          sq.common.noMails,
          style: TextStyle(color: mailTheme.textSecondary),
        ),
      );
    }

    return ListView.separated(
      itemCount: mails.length,
      separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
      itemBuilder: (context, index) {
        final mail = mails[index];
        final isSelected = state.mailApp.selectedMailIds.contains(mail.id);

        return MailListItem(
          mail: mail,
          isSelected: isSelected,
          archiveLabel: sq.common.archiveAction,
          isSelectionMode: isSelectionMode,
          onTap: switch (_type) {
            // Quiz3: 選択モード中はタップで選択切替
            MailQuizType.selectDelete when isSelectionMode =>
              () => notifier.toggleSelection(mail.id),
            _ => null,
          },
          onLongPress: switch (_type) {
            // Quiz3: 長押しで選択モード開始
            MailQuizType.selectDelete =>
              () => notifier.toggleSelection(mail.id),
            _ => null,
          },
          onDismissed: switch (_type) {
            // Quiz1: スワイプでアーカイブ
            MailQuizType.archive => notifier.archiveMail,
            _ => null,
          },
        );
      },
    );
  }

  // ─────────────────────────────────────────────
  // Insight（クリア後の解説）
  // ─────────────────────────────────────────────

  Widget _buildInsight() => switch (_type) {
        MailQuizType.archive => const _ArchiveInsight(),
        MailQuizType.emptyTrash => const _EmptyTrashInsight(),
        MailQuizType.selectDelete => const _SelectDeleteInsight(),
        MailQuizType.search => const _SearchInsight(),
      };

  // ─────────────────────────────────────────────
  // Helpers
  // ─────────────────────────────────────────────

  /// ミッションテキストを取得する（ja ロケール固定）
  String _missionText() {
    final s = context.s;
    return switch (_type) {
      MailQuizType.archive => s.quiz1.missionText,
      MailQuizType.emptyTrash => s.quiz2.missionText,
      MailQuizType.selectDelete => s.quiz3.missionText,
      MailQuizType.search => s.quiz4.missionText,
    };
  }

  void _showHintSnackBar(String hint) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(hint),
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Quiz4 専用 SearchAppBar
// ─────────────────────────────────────────────

class _SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _SearchAppBar({
    required this.isSearching,
    required this.searchController,
    required this.searchHint,
    required this.hint,
    required this.onOpenSearch,
    required this.onCancelSearch,
    required this.onQueryChanged,
    required this.onSubmitSearch,
    required this.onShowHint,
  });

  final bool isSearching;
  final TextEditingController searchController;
  final String searchHint;
  final String hint;
  final VoidCallback onOpenSearch;
  final VoidCallback onCancelSearch;
  final ValueChanged<String> onQueryChanged;
  final VoidCallback onSubmitSearch;
  final VoidCallback onShowHint;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final mailTheme = Theme.of(context).extension<MailAppTheme>()!;
    final hintTooltip = context.sq.common.hintTooltip;

    if (isSearching) {
      return AppBar(
        backgroundColor: mailTheme.scaffoldBackground,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: mailTheme.textSecondary),
          onPressed: onCancelSearch,
        ),
        title: TextField(
          controller: searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: searchHint,
            border: InputBorder.none,
            hintStyle: TextStyle(color: mailTheme.textSecondary),
          ),
          onChanged: onQueryChanged,
          onSubmitted: (_) => onSubmitSearch(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: mailTheme.textSecondary),
            onPressed: onSubmitSearch,
          ),
        ],
      );
    }

    return AppBar(
      backgroundColor: mailTheme.scaffoldBackground,
      elevation: 1,
      shadowColor: Theme.of(context).shadowColor.withAlpha(76),
      title: GestureDetector(
        onTap: onOpenSearch,
        child: Container(
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: mailTheme.searchBarBackground,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: mailTheme.textSecondary, size: 20),
              const SizedBox(width: 8),
              Text(
                searchHint,
                style: TextStyle(color: mailTheme.textSecondary, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.help_outline, color: mailTheme.textSecondary),
          onPressed: onShowHint,
          tooltip: hintTooltip,
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// Insight ウィジェット（クイズ別）
// ─────────────────────────────────────────────

class _ArchiveInsight extends StatelessWidget {
  const _ArchiveInsight();

  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz1.insight;
    return _InsightContent(
      title: insight.title,
      subtitle: insight.subtitle,
      items: [
        _InsightEntry(
          emoji: '👈',
          title: insight.swipeTitle,
          desc: insight.swipeDesc,
        ),
        _InsightEntry(
          emoji: '💚',
          title: insight.greenTitle,
          desc: insight.greenDesc,
        ),
        _InsightEntry(
          emoji: '📦',
          title: insight.archiveTitle,
          desc: insight.archiveDesc,
        ),
      ],
    );
  }
}

class _EmptyTrashInsight extends StatelessWidget {
  const _EmptyTrashInsight();

  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz2.insight;
    return _InsightContent(
      title: insight.title,
      subtitle: insight.subtitle,
      items: [
        _InsightEntry(
          emoji: '☰',
          title: insight.drawerTitle,
          desc: insight.drawerDesc,
        ),
        _InsightEntry(
          emoji: '🗑️',
          title: insight.trashTitle,
          desc: insight.trashDesc,
        ),
        _InsightEntry(
          emoji: '✨',
          title: insight.emptyTitle,
          desc: insight.emptyDesc,
        ),
      ],
    );
  }
}

class _SelectDeleteInsight extends StatelessWidget {
  const _SelectDeleteInsight();

  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz3.insight;
    return _InsightContent(
      title: insight.title,
      subtitle: insight.subtitle,
      items: [
        _InsightEntry(
          emoji: '👆',
          title: insight.longPressTitle,
          desc: insight.longPressDesc,
        ),
        _InsightEntry(
          emoji: '✅',
          title: insight.checkTitle,
          desc: insight.checkDesc,
        ),
        _InsightEntry(
          emoji: '🔵',
          title: insight.headerTitle,
          desc: insight.headerDesc,
        ),
      ],
    );
  }
}

class _SearchInsight extends StatelessWidget {
  const _SearchInsight();

  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz4.insight;
    return _InsightContent(
      title: insight.title,
      subtitle: insight.subtitle,
      items: [
        _InsightEntry(
          emoji: '🔍',
          title: insight.operatorTitle,
          desc: insight.operatorDesc,
        ),
        _InsightEntry(
          emoji: '📦',
          title: insight.sizeTitle,
          desc: insight.sizeDesc,
        ),
        _InsightEntry(
          emoji: '💡',
          title: insight.hintTitle,
          desc: insight.hintDesc,
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// 共通 Insight レイアウト
// ─────────────────────────────────────────────

class _InsightEntry {
  const _InsightEntry({
    required this.emoji,
    required this.title,
    required this.desc,
  });

  final String emoji;
  final String title;
  final String desc;
}

class _InsightContent extends StatelessWidget {
  const _InsightContent({
    required this.title,
    required this.subtitle,
    required this.items,
  });

  final String title;
  final String subtitle;
  final List<_InsightEntry> items;

  @override
  Widget build(BuildContext context) {
    final mailTheme = Theme.of(context).extension<MailAppTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.lightbulb, color: mailTheme.insightIconColor, size: 20),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: mailTheme.subTextColor),
        ),
        const SizedBox(height: 12),
        ...items.expand(
          (item) => [
            _InsightItem(emoji: item.emoji, title: item.title, desc: item.desc),
            const SizedBox(height: 10),
          ],
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
    final mailTheme = Theme.of(context).extension<MailAppTheme>()!;
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
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 2),
              Text(
                desc,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: mailTheme.subTextColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
