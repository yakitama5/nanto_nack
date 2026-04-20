import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/src/domain/todo_item.dart';
import 'package:todo/src/domain/todo_quiz_config.dart';
import 'package:todo/src/i18n/todo_translations_extension.dart';
import 'package:todo/src/presentation/todo_quiz_notifier.dart';
import 'package:todo/src/presentation/todo_quiz_state.dart';
import 'package:todo/src/presentation/todo_quiz_type.dart';
import 'package:quiz_core/quiz_core.dart';

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
    this.onBack,
    this.onRestart,
  });

  final TodoQuizType type;
  final VoidCallback? onCompleted;

  /// リザルトの「戻る」タップ時に呼ばれるコールバック。
  final VoidCallback? onBack;

  /// リザルトの「もう一度」タップ時に呼ばれるコールバック。
  final VoidCallback? onRestart;

  @override
  ConsumerState<TodoQuizScreen> createState() => _TodoQuizScreenState();
}

class _TodoQuizScreenState extends ConsumerState<TodoQuizScreen> {
  bool _showCutIn = true;
  bool _resultOverlayShown = false;

  TodoQuizType get _type => widget.type;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(todoQuizProvider(_type).notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(todoQuizProvider(_type));
    final missionText = _missionText();
    final notifier = ref.read(todoQuizProvider(_type).notifier);
    final todoTheme = Theme.of(context).extension<TodoAppTheme>()!;

    // rootNavigator 経由でリザルトオーバーレイを最前面に表示する。
    ref.listen(todoQuizProvider(_type).select((s) => s.status), (prev, next) {
      final done =
          next == QuizStatus.correct ||
          next == QuizStatus.giveUp ||
          next == QuizStatus.timeUp;
      if (!done || _resultOverlayShown) return;
      _resultOverlayShown = true;
      final currentState = ref.read(todoQuizProvider(_type));
      Navigator.of(context, rootNavigator: true).push(
        PageRouteBuilder<void>(
          opaque: false,
          barrierColor: Colors.transparent,
          pageBuilder: (_, __, ___) => QuizResultOverlay(
            status: next,
            score: currentState.score,
            elapsedMs: currentState.elapsedMs,
            onRetry: () {
              Navigator.of(context, rootNavigator: true).pop();
              _showCutIn = true;
              _resultOverlayShown = false;
              widget.onRestart?.call();
            },
            onNext: next == QuizStatus.correct
                ? () {
                    Navigator.of(context, rootNavigator: true).pop();
                    widget.onCompleted?.call();
                  }
                : null,
            onBack: () {
              Navigator.of(context, rootNavigator: true).pop();
              widget.onBack?.call();
            },
            insight: _buildInsight(),
          ),
        ),
      );
    });

    return QuizExitScope(
      quizStatus: state.status,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: todoTheme.scaffoldBackground,
            appBar: AppBar(
              backgroundColor: todoTheme.appBarBackground,
              foregroundColor: todoTheme.textPrimary,
              elevation: 0,
              title: Text(
                context.sq.common.appTitle,
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
                  tooltip: context.sq.common.addTask,
                  onPressed: null, // モックのため操作不要
                ),
              ],
            ),
            body: _buildBody(state: state, notifier: notifier),
            floatingActionButton: FloatingActionButton(
              backgroundColor: todoTheme.brandBlue,
              foregroundColor: Colors.white,
              onPressed: null, // モック用：タスク追加は行わない
              tooltip: context.sq.common.addTask,
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
              onFinished: () => setState(() => _showCutIn = false),
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

    return Column(
      children: [
        // 未完了タスク（ドラッグ並び替え可能）
        Expanded(
          child: incompletes.isEmpty
              ? Center(
                  child: Text(
                    context.sq.common.noTasks,
                    style: TextStyle(color: todoTheme.textSecondary),
                  ),
                )
              : ReorderableListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: incompletes.length,
                  // 長押しでドラッグ開始
                  buildDefaultDragHandles: false,
                  onReorder: (oldIndex, newIndex) {
                    notifier.reorderTodo(oldIndex, newIndex);
                  },
                  itemBuilder: (context, index) {
                    final item = incompletes[index];
                    return ReorderableDragStartListener(
                      key: ValueKey(item.id),
                      index: index,
                      child: _TodoListItem(
                        item: item,
                        onToggleCompletion: () =>
                            notifier.toggleCompletion(item.id),
                        onToggleImportant: () =>
                            notifier.toggleImportant(item.id),
                      ),
                    );
                  },
                ),
        ),
        // 完了済みアコーディオン
        if (completed.isNotEmpty)
          _CompletedListAccordion(
            completedTodos: completed,
            isExpanded: state.todoApp.isCompletedListExpanded,
            onToggleExpansion: notifier.toggleCompletedListExpansion,
            onToggleCompletion: notifier.toggleCompletion,
          ),
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

class _TodoListItem extends StatefulWidget {
  const _TodoListItem({
    required this.item,
    required this.onToggleCompletion,
    required this.onToggleImportant,
  });

  final TodoItem item;
  final VoidCallback onToggleCompletion;
  final VoidCallback onToggleImportant;

  @override
  State<_TodoListItem> createState() => _TodoListItemState();
}

class _TodoListItemState extends State<_TodoListItem> {
  // 右から左スワイプ時のオフセット（重要ボタン露出用）
  double _dragOffset = 0;
  static const double _revealThreshold = 60.0;
  static const double _revealWidth = 80.0;
  bool _isRevealed = false;

  void _resetSwipe() {
    setState(() {
      _dragOffset = 0;
      _isRevealed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final todoTheme = Theme.of(context).extension<TodoAppTheme>()!;
    final item = widget.item;

    return GestureDetector(
      // 横スワイプを検出する
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx < 0) {
          // 右から左へスワイプ → 重要ボタンを露出
          setState(() {
            _dragOffset =
                (_dragOffset - details.delta.dx).clamp(0, _revealWidth);
          });
        } else if (details.delta.dx > 0 && _dragOffset > 0) {
          // 左から右へスワイプ → 戻す
          setState(() {
            _dragOffset =
                (_dragOffset - details.delta.dx).clamp(0, _revealWidth);
          });
        }
      },
      onHorizontalDragEnd: (_) {
        if (_dragOffset >= _revealThreshold) {
          setState(() {
            _dragOffset = _revealWidth;
            _isRevealed = true;
          });
        } else {
          _resetSwipe();
        }
      },
      child: Stack(
        children: [
          // 背景の重要ボタン（右端に表示）
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: AnimatedOpacity(
                opacity: (_dragOffset / _revealWidth).clamp(0, 1),
                duration: const Duration(milliseconds: 150),
                child: GestureDetector(
                  onTap: () {
                    widget.onToggleImportant();
                    _resetSwipe();
                  },
                  child: Container(
                    width: _revealWidth,
                    color: todoTheme.importantBackground,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item.isImportant ? Icons.star : Icons.star_border,
                          color: todoTheme.importantColor,
                          size: 24,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          context.sq.common.importantLabel,
                          style: TextStyle(
                            color: todoTheme.importantColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // 左から右スワイプで完了にする（Dismissible）
          Dismissible(
            key: ValueKey('dismissible_${item.id}'),
            direction: DismissDirection.startToEnd,
            background: Container(
              color: todoTheme.completionBackground,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 24),
              child: const Icon(Icons.check, color: Colors.white, size: 28),
            ),
            confirmDismiss: (_) async {
              widget.onToggleCompletion();
              // 完了した場合は Dismissible のアニメーションを使わず、
              // 状態更新によってリストから消えるため false を返す
              return false;
            },
            child: Transform.translate(
              offset: Offset(-_dragOffset, 0),
              child: Container(
                color: todoTheme.itemBackground,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  leading: GestureDetector(
                    onTap: () {
                      if (_isRevealed) {
                        _resetSwipe();
                      } else {
                        widget.onToggleCompletion();
                      }
                    },
                    child: _RoundCheckbox(
                      isChecked: item.isCompleted,
                      color: todoTheme.brandBlue,
                    ),
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                      color: todoTheme.textPrimary,
                      fontSize: 15,
                      decoration: item.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: item.isImportant
                      ? Icon(
                          Icons.star,
                          color: todoTheme.importantColor,
                          size: 18,
                        )
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
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
                Text(
                  '${context.sq.common.completedLabel}（${completedTodos.length}件）',
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
          title: Text(
            item.title,
            style: TextStyle(
              color: todoTheme.textSecondary,
              fontSize: 15,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ),
      ),
    );
  }
}
