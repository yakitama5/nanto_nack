import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/src/domain/todo_item.dart';
import 'package:todo/src/domain/todo_quiz_config.dart';
import 'package:todo/src/i18n/todo_translations_extension.dart';
import 'package:todo/src/presentation/todo_quiz_notifier.dart';
import 'package:todo/src/presentation/todo_quiz_state.dart';
import 'package:todo/src/presentation/todo_quiz_type.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

/// TODOアプリ謎解きの共通画面。
///
/// [type] によって Quiz1〜4 のいずれかとして動作する。
/// UI の骨格・ライフサイクル（cutIn / resultOverlay / giveUp）は共通。
/// クイズ固有のクリア条件は [type] で分岐する。
class TodoQuizScreen extends ConsumerStatefulWidget {
  const TodoQuizScreen({
    super.key,
    required this.type,
    this.onCompleted,
  });

  final TodoQuizType type;
  final VoidCallback? onCompleted;

  @override
  ConsumerState<TodoQuizScreen> createState() => _TodoQuizScreenState();
}

class _TodoQuizScreenState extends ConsumerState<TodoQuizScreen> {
  bool _showCutIn = true;

  TodoQuizType get _type => widget.type;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(todoQuizProvider(_type));
    final missionText = _missionText();
    final notifier = ref.read(todoQuizProvider(_type).notifier);
    final todoTheme = Theme.of(context).extension<TodoAppTheme>()!;

    return QuizExitScope(
      quizStatus: state.status,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: todoTheme.scaffoldBackground,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: todoTheme.appBarBackground,
              foregroundColor: todoTheme.textPrimary,
              elevation: 0,
              title: UnreadableText(
                context.se.common.appTitle,
                style: TextStyle(
                  color: todoTheme.brandBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: todoTheme.textSecondary,
                  ),
                  tooltip: context.se.common.moreOptions,
                  onPressed: () {}, // モック：リップルのみ
                ),
              ],
            ),
            body: _buildBody(state: state, notifier: notifier),
            floatingActionButton: FloatingActionButton(
              backgroundColor: todoTheme.brandBlue,
              foregroundColor: Colors.white,
              onPressed: () {}, // モック：リップルのみ
              tooltip: context.se.common.addTask,
              child: const Icon(Icons.add),
            ),
          ),
          if (state.status == QuizStatus.playing)
            FloatingMissionBubble(
              missionText: missionText,
              remainingSeconds: state.remainingSeconds,
              timeLimitSeconds: TodoQuizConfig.timeLimitSeconds,
              hintUsed: state.hintUsed,
              onHintTap: null,
              onGiveUp: () => notifier.giveUp(),
            ),
          if (_showCutIn)
            MissionCutIn(
              missionText: missionText,
              timeLimitSeconds: TodoQuizConfig.timeLimitSeconds,
              onFinished: () {
                if (!mounted) return;
                setState(() => _showCutIn = false);
                ref.read(todoQuizProvider(_type).notifier).startQuiz();
              },
            ),
          if (state.status == QuizStatus.correct ||
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
                insight: _buildInsight(),
              ),
            ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // Body
  // ─────────────────────────────────────────────

  Widget _buildBody({
    required TodoQuizState state,
    required TodoQuizNotifier notifier,
  }) {
    final todoTheme = Theme.of(context).extension<TodoAppTheme>()!;
    final incompletes = state.todoApp.incompleteTodos;
    final completed = state.todoApp.completedTodos;

    Widget buildItem(BuildContext context, int index) {
      final item = incompletes[index];
      return _TodoListItem(
        key: ValueKey(item.id),
        index: index,
        item: item,
        onToggleCompletion: () => notifier.toggleCompletion(item.id),
        onToggleImportant: () => notifier.toggleImportant(item.id),
      );
    }

    return Column(
      children: [
        Expanded(
          child: incompletes.isEmpty
              ? Center(
                  child: UnreadableText(
                    context.se.common.noTasks,
                    style: TextStyle(color: todoTheme.textSecondary),
                  ),
                )
              : ReorderableListView.builder(
                  padding: const EdgeInsets.only(bottom: 80),
                  itemCount: incompletes.length,
                  buildDefaultDragHandles: false,
                  onReorder: notifier.reorderTodo,
                  proxyDecorator: (child, index, animation) {
                    final curved = CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOut,
                    );
                    return AnimatedBuilder(
                      animation: curved,
                      builder: (context, child) {
                        final t =
                            Theme.of(context).extension<TodoAppTheme>()!;
                        final elevation =
                            Tween<double>(begin: 0, end: 8).evaluate(curved);
                        final scale =
                            Tween<double>(begin: 1.0, end: 1.03).evaluate(curved);
                        return Transform.scale(
                          scale: scale,
                          child: Material(
                            elevation: elevation,
                            color: t.itemBackground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: BorderSide(
                                color: t.brandBlue
                                    .withValues(alpha: curved.value * 0.7),
                                width: 2,
                              ),
                            ),
                            child: child,
                          ),
                        );
                      },
                      child: child,
                    );
                  },
                  itemBuilder: buildItem,
                ),
        ),
        if (completed.isNotEmpty) ...[
          _CompletedListAccordion(
            completedTodos: completed,
            isExpanded: state.todoApp.isCompletedListExpanded,
            onToggleExpansion: notifier.toggleCompletedListExpansion,
            onToggleCompletion: notifier.toggleCompletion,
          ),
          const SizedBox(height: 80),
        ],
      ],
    );
  }

  // ─────────────────────────────────────────────
  // Mission text
  // ─────────────────────────────────────────────

  String _missionText() {
    return switch (_type) {
      TodoQuizType.complete => context.s.quiz1.missionText,
      TodoQuizType.reorder => context.s.quiz2.missionText,
      TodoQuizType.markImportant => context.s.quiz3.missionText,
      TodoQuizType.uncomplete => context.s.quiz4.missionText,
    };
  }

  // ─────────────────────────────────────────────
  // Insight
  // ─────────────────────────────────────────────

  Widget _buildInsight() {
    return Builder(
      builder: (context) {
        return switch (_type) {
          TodoQuizType.complete => _buildInsightQuiz1(context),
          TodoQuizType.reorder => _buildInsightQuiz2(context),
          TodoQuizType.markImportant => _buildInsightQuiz3(context),
          TodoQuizType.uncomplete => _buildInsightQuiz4(context),
        };
      },
    );
  }

  Widget _buildInsightQuiz1(BuildContext context) {
    final insight = context.s.quiz1.insight;
    return QuizInsightContent(
      title: insight.title,
      subtitle: insight.subtitle,
      items: [
        QuizInsightItem(
          emoji: '☑️',
          title: insight.checkTitle,
          desc: insight.checkDesc,
        ),
        QuizInsightItem(
          emoji: '👉',
          title: insight.swipeTitle,
          desc: insight.swipeDesc,
        ),
        QuizInsightItem(
          emoji: '✅',
          title: insight.feedbackTitle,
          desc: insight.feedbackDesc,
        ),
      ],
    );
  }

  Widget _buildInsightQuiz2(BuildContext context) {
    final insight = context.s.quiz2.insight;
    return QuizInsightContent(
      title: insight.title,
      subtitle: insight.subtitle,
      items: [
        QuizInsightItem(
          emoji: '👆',
          title: insight.longPressTitle,
          desc: insight.longPressDesc,
        ),
        QuizInsightItem(
          emoji: '↕️',
          title: insight.dragTitle,
          desc: insight.dragDesc,
        ),
        QuizInsightItem(
          emoji: '☰',
          title: insight.handleTitle,
          desc: insight.handleDesc,
        ),
      ],
    );
  }

  Widget _buildInsightQuiz3(BuildContext context) {
    final insight = context.s.quiz3.insight;
    return QuizInsightContent(
      title: insight.title,
      subtitle: insight.subtitle,
      items: [
        QuizInsightItem(
          emoji: '👈',
          title: insight.swipeTitle,
          desc: insight.swipeDesc,
        ),
        QuizInsightItem(
          emoji: '⭐',
          title: insight.starTitle,
          desc: insight.starDesc,
        ),
        QuizInsightItem(
          emoji: '🎯',
          title: insight.priorityTitle,
          desc: insight.priorityDesc,
        ),
      ],
    );
  }

  Widget _buildInsightQuiz4(BuildContext context) {
    final insight = context.s.quiz4.insight;
    return QuizInsightContent(
      title: insight.title,
      subtitle: insight.subtitle,
      items: [
        QuizInsightItem(
          emoji: '📂',
          title: insight.accordionTitle,
          desc: insight.accordionDesc,
        ),
        QuizInsightItem(
          emoji: '↩️',
          title: insight.undoTitle,
          desc: insight.undoDesc,
        ),
        QuizInsightItem(
          emoji: '☑️',
          title: insight.checkTitle,
          desc: insight.checkDesc,
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// TodoListItem（1行分のUI）
// ─────────────────────────────────────────────

class _TodoListItem extends StatelessWidget {
  const _TodoListItem({
    super.key,
    required this.index,
    required this.item,
    required this.onToggleCompletion,
    required this.onToggleImportant,
  });

  final int index;
  final TodoItem item;
  final VoidCallback onToggleCompletion;
  final VoidCallback onToggleImportant;

  @override
  Widget build(BuildContext context) {
    final todoTheme = Theme.of(context).extension<TodoAppTheme>()!;

    final trailing = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (item.isImportant)
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Icon(
              Icons.star,
              color: todoTheme.importantColor,
              size: 18,
            ),
          ),
        // ハンドル領域のみ DelayedMultiDragGestureRecognizer を登録する。
        // タイル本体の Dismissible（HorizontalDragGestureRecognizer）とは
        // 領域が分離されているため、スワイプとドラッグ並び替えが共存できる。
        ReorderableDelayedDragStartListener(
          index: index,
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              Icons.drag_handle,
              color: todoTheme.textSecondary,
              size: 20,
            ),
          ),
        ),
      ],
    );

    final tile = Container(
      color: todoTheme.itemBackground,
      child: ListTile(
        contentPadding: const EdgeInsets.only(
          left: 16,
          right: 8,
          top: 4,
          bottom: 4,
        ),
        leading: GestureDetector(
          onTap: onToggleCompletion,
          child: _RoundCheckbox(
            isChecked: item.isCompleted,
            color: todoTheme.brandBlue,
          ),
        ),
        title: Row(
          children: [
            Text(item.emoji, style: const TextStyle(fontSize: 15)),
            const SizedBox(width: 8),
            Expanded(
              child: UnreadableText(
                item.localizedTitle(context),
                style: TextStyle(
                  color: todoTheme.textPrimary,
                  fontSize: 15,
                  decoration: item.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        trailing: trailing,
      ),
    );

    return Dismissible(
      key: ValueKey('dismissible_${item.id}'),
      direction: DismissDirection.horizontal,
      background: Container(
        color: todoTheme.completionBackground,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 24),
        child: const Icon(Icons.check, color: Colors.white, size: 28),
      ),
      secondaryBackground: Container(
        color: todoTheme.importantBackground,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              item.isImportant ? Icons.star : Icons.star_border,
              color: todoTheme.importantColor,
              size: 24,
            ),
            const SizedBox(height: 2),
            UnreadableText(
              context.se.common.importantLabel,
              style: TextStyle(
                color: todoTheme.importantColor,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          onToggleCompletion();
        } else {
          onToggleImportant();
        }
        return false;
      },
      child: tile,
    );
  }
}

// ─────────────────────────────────────────────
// 丸いチェックボックスウィジェット
// ─────────────────────────────────────────────

class _RoundCheckbox extends StatelessWidget {
  const _RoundCheckbox({
    required this.isChecked,
    required this.color,
  });

  final bool isChecked;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isChecked ? color : Colors.transparent,
        border: Border.all(
          color: isChecked ? color : color.withValues(alpha: 0.5),
          width: 2,
        ),
      ),
      child: isChecked
          ? const Icon(Icons.check, color: Colors.white, size: 16)
          : null,
    );
  }
}

// ─────────────────────────────────────────────
// 完了済みアコーディオン
// ─────────────────────────────────────────────

class _CompletedListAccordion extends StatelessWidget {
  const _CompletedListAccordion({
    required this.completedTodos,
    required this.isExpanded,
    required this.onToggleExpansion,
    required this.onToggleCompletion,
  });

  final List<TodoItem> completedTodos;
  final bool isExpanded;
  final VoidCallback onToggleExpansion;
  final void Function(String id) onToggleCompletion;

  @override
  Widget build(BuildContext context) {
    final todoTheme = Theme.of(context).extension<TodoAppTheme>()!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // アコーディオンヘッダー
        InkWell(
          onTap: onToggleExpansion,
          child: Container(
            color: todoTheme.completedHeaderBackground,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                AnimatedRotation(
                  turns: isExpanded ? 0.25 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.chevron_right,
                    color: todoTheme.textSecondary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 8),
                UnreadableText(
                  context.se.common.completedCount.replaceAll(
                    '{count}',
                    completedTodos.length.toString(),
                  ),
                  style: TextStyle(
                    color: todoTheme.textSecondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        // 完了済みタスクのリスト（展開時のみ表示）
        if (isExpanded)
          for (final item in completedTodos)
            _CompletedTodoItem(
              key: ValueKey('accordion_${item.id}'),
              item: item,
              onToggleCompletion: () => onToggleCompletion(item.id),
            ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// 完了済みタスクのアイテム
// ─────────────────────────────────────────────

class _CompletedTodoItem extends StatelessWidget {
  const _CompletedTodoItem({
    super.key,
    required this.item,
    required this.onToggleCompletion,
  });

  final TodoItem item;
  final VoidCallback onToggleCompletion;

  @override
  Widget build(BuildContext context) {
    final todoTheme = Theme.of(context).extension<TodoAppTheme>()!;

    return Dismissible(
      key: ValueKey('completed_${item.id}'),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: todoTheme.uncompletionBackground,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 24),
        child: Icon(Icons.undo, color: todoTheme.brandBlue, size: 28),
      ),
      confirmDismiss: (_) async {
        onToggleCompletion();
        return false;
      },
      child: Container(
        color: todoTheme.itemBackground,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          leading: GestureDetector(
            onTap: onToggleCompletion,
            child: _RoundCheckbox(
              isChecked: item.isCompleted,
              color: todoTheme.brandBlue,
            ),
          ),
          title: Row(
            children: [
              Text(item.emoji, style: const TextStyle(fontSize: 15)),
              const SizedBox(width: 8),
              Expanded(
                child: UnreadableText(
                  item.localizedTitle(context),
                  style: TextStyle(
                    color: todoTheme.textSecondary,
                    fontSize: 15,
                    decoration: TextDecoration.lineThrough,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// TodoItem のローカライズ補助 extension
// ─────────────────────────────────────────────

/// [TodoItem.titleKey] から英語テキストを返す。
///
/// クイズ画面は英語テキストを [UnreadableText] に渡して難読化する仕様のため、
/// [context.se.common.tasks] を参照する。
/// 未知のキーは titleKey をそのまま返すフォールバック。
extension _TodoItemLocalized on TodoItem {
  String localizedTitle(BuildContext context) {
    return switch (titleKey) {
      'buyMilk' => context.se.common.tasks.buyMilk,
      'rentPayment' => context.se.common.tasks.rentPayment,
      'planningDoc' => context.se.common.tasks.planningDoc,
      'meetingPrep' => context.se.common.tasks.meetingPrep,
      'replyEmail' => context.se.common.tasks.replyEmail,
      'bookDentist' => context.se.common.tasks.bookDentist,
      _ => titleKey,
    };
  }
}
