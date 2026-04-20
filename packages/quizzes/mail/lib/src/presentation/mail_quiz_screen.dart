import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mail/src/domain/entities/mail_folder.dart';
import 'package:mail/src/domain/mail_quiz_config.dart';
import 'package:mail/src/i18n/mail_translations_extension.dart';
import 'package:mail/src/presentation/mail_app_bar.dart';
import 'package:mail/src/presentation/mail_drawer.dart';
import 'package:mail/src/presentation/mail_list_item.dart';
import 'package:mail/src/presentation/mail_quiz_notifier.dart';
import 'package:mail/src/presentation/mail_quiz_state.dart';
import 'package:mail/src/presentation/mail_quiz_type.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

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
      child: Stack(
        children: [
          Scaffold(
            appBar: _buildAppBar(
              state: state,
              selectedCount: selectedCount,
              notifier: notifier,
            ),
            drawer: _buildDrawer(state: state, notifier: notifier),
            body: _buildBody(
              state: state,
              isSelectionMode: isSelectionMode,
              notifier: notifier,
            ),
          ),
          if (state.status == QuizStatus.playing)
            FloatingMissionBubble(
              missionText: missionText,
              remainingSeconds: state.remainingSeconds,
              timeLimitSeconds: MailQuizConfig.timeLimitSeconds,
              hintUsed: state.hintUsed,
              onHintTap: _type == MailQuizType.search
                  ? () => notifier.useHint()
                  : null,
              onGiveUp: () => notifier.giveUp(),
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
                isLimitReached: ref.watch(isPlayLimitReachedProvider).valueOrNull ?? false,
                insight: _buildInsight(),
              ),
            ),
        ],
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
      return MailSearchAppBar(
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
        // ヒントは FloatingMissionBubble 内から使用するため AppBar には表示しない
      );
    }

    return MailAppBar(
      selectedCount: _type == MailQuizType.selectDelete ? selectedCount : 0,
      searchHint: sq.common.searchHint,
      selectedCountText:
          sq.common.selectedCount.replaceAll('{count}', '$selectedCount'),
      deleteTooltip: sq.common.deleteAction,
      onClearSelection:
          _type == MailQuizType.selectDelete ? notifier.clearSelection : null,
      onDeleteSelected:
          _type == MailQuizType.selectDelete ? notifier.moveToTrash : null,
      emptyTrashLabel:
          _type == MailQuizType.emptyTrash ? sq.common.emptyTrash : null,
      onEmptyTrash: (_type == MailQuizType.emptyTrash &&
              state.mailApp.currentFolder == MailFolder.trash)
          ? notifier.emptyTrash
          : null,
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
      appTitle: sq.common.appTitle,
      onFolderChanged:
          _type == MailQuizType.emptyTrash ? notifier.changeFolder : null,
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

    // Quiz4でヒント使用済み かつ 検索中でない場合にヒントカードを上部に表示
    final showHintCard =
        _type == MailQuizType.search && state.hintUsed && !state.isSearching;

    if (mails.isEmpty) {
      if (showHintCard) {
        return Column(
          children: [
            _HintCard(hintText: context.s.quiz4.hint),
            Expanded(
              child: Center(
                child: Text(
                  sq.common.noMails,
                  style: TextStyle(color: mailTheme.textSecondary),
                ),
              ),
            ),
          ],
        );
      }
      return Center(
        child: Text(
          sq.common.noMails,
          style: TextStyle(color: mailTheme.textSecondary),
        ),
      );
    }

    final listView = ListView.separated(
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

    if (showHintCard) {
      return Column(
        children: [
          _HintCard(hintText: context.s.quiz4.hint),
          Expanded(child: listView),
        ],
      );
    }
    return listView;
  }

  // ─────────────────────────────────────────────
  // Insight（クリア後の解説）
  // ─────────────────────────────────────────────

  Widget _buildInsight() {
    final s = context.s;
    return switch (_type) {
      MailQuizType.archive => QuizInsightContent(
          title: s.quiz1.insight.title,
          subtitle: s.quiz1.insight.subtitle,
          items: [
            QuizInsightItem(
              emoji: '👈',
              title: s.quiz1.insight.swipeTitle,
              desc: s.quiz1.insight.swipeDesc,
            ),
            QuizInsightItem(
              emoji: '💚',
              title: s.quiz1.insight.greenTitle,
              desc: s.quiz1.insight.greenDesc,
            ),
            QuizInsightItem(
              emoji: '📦',
              title: s.quiz1.insight.archiveTitle,
              desc: s.quiz1.insight.archiveDesc,
            ),
          ],
        ),
      MailQuizType.emptyTrash => QuizInsightContent(
          title: s.quiz2.insight.title,
          subtitle: s.quiz2.insight.subtitle,
          items: [
            QuizInsightItem(
              emoji: '☰',
              title: s.quiz2.insight.drawerTitle,
              desc: s.quiz2.insight.drawerDesc,
            ),
            QuizInsightItem(
              emoji: '🗑️',
              title: s.quiz2.insight.trashTitle,
              desc: s.quiz2.insight.trashDesc,
            ),
            QuizInsightItem(
              emoji: '⋮',
              title: s.quiz2.insight.emptyTitle,
              desc: s.quiz2.insight.emptyDesc,
            ),
          ],
        ),
      MailQuizType.selectDelete => QuizInsightContent(
          title: s.quiz3.insight.title,
          subtitle: s.quiz3.insight.subtitle,
          items: [
            QuizInsightItem(
              emoji: '👆',
              title: s.quiz3.insight.longPressTitle,
              desc: s.quiz3.insight.longPressDesc,
            ),
            QuizInsightItem(
              emoji: '✅',
              title: s.quiz3.insight.checkTitle,
              desc: s.quiz3.insight.checkDesc,
            ),
            QuizInsightItem(
              emoji: '🔵',
              title: s.quiz3.insight.headerTitle,
              desc: s.quiz3.insight.headerDesc,
            ),
          ],
        ),
      MailQuizType.search => QuizInsightContent(
          title: s.quiz4.insight.title,
          subtitle: s.quiz4.insight.subtitle,
          items: [
            QuizInsightItem(
              emoji: '🔍',
              title: s.quiz4.insight.operatorTitle,
              desc: s.quiz4.insight.operatorDesc,
            ),
            QuizInsightItem(
              emoji: '📦',
              title: s.quiz4.insight.sizeTitle,
              desc: s.quiz4.insight.sizeDesc,
            ),
            QuizInsightItem(
              emoji: '💡',
              title: s.quiz4.insight.hintTitle,
              desc: s.quiz4.insight.hintDesc,
            ),
          ],
        ),
    };
  }

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
}

// ─────────────────────────────────────────────
// ヒントカード（Quiz4: ヒント使用時に Body 上部に表示）
// ─────────────────────────────────────────────

class _HintCard extends StatelessWidget {
  const _HintCard({required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    final mailTheme = Theme.of(context).extension<MailAppTheme>()!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: mailTheme.insightIconColor.withValues(alpha: 0.12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb, color: mailTheme.insightIconColor, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              hintText,
              style: TextStyle(
                color: mailTheme.textPrimary,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

