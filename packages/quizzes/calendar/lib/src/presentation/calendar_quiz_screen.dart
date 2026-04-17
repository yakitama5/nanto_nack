import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../domain/calendar_quiz_config.dart';
import '../domain/entities/calendar_event.dart';
import '../i18n/calendar_translations_extension.dart';
import 'calendar_quiz_notifier.dart';
import 'calendar_quiz_state.dart';
import 'calendar_quiz_type.dart';

/// カレンダークイズ画面（全4クイズ共通）
class CalendarQuizScreen extends ConsumerStatefulWidget {
  /// コンストラクタ
  const CalendarQuizScreen({
    super.key,
    required this.quizType,
    this.onCompleted,
  });

  /// 表示するクイズの種類
  final CalendarQuizType quizType;

  /// クイズ完了コールバック
  final VoidCallback? onCompleted;

  @override
  ConsumerState<CalendarQuizScreen> createState() => _CalendarQuizScreenState();
}

class _CalendarQuizScreenState extends ConsumerState<CalendarQuizScreen> {
  bool _showCutIn = true;
  // addPostFrameCallback 後に初期化される
  CrCalendarController? _calendarController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final notifier = ref.read(
        calendarQuizNotifierProvider(widget.quizType).notifier,
      );
      notifier.startQuiz();
      setState(() {
        _calendarController = notifier.controller;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(calendarQuizNotifierProvider(widget.quizType));
    final notifier = ref.read(
      calendarQuizNotifierProvider(widget.quizType).notifier,
    );
    final timeLimitSeconds = CalendarQuizConfig.timeLimitSecondsFor(
      widget.quizType,
    );
    final missionText = _missionText(widget.quizType);

    return QuizExitScope(
      quizStatus: state.status,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (_calendarController != null)
            _CalendarAppScaffold(
              state: state,
              notifier: notifier,
              calendarController: _calendarController!,
              missionText: missionText,
              timeLimitSeconds: timeLimitSeconds,
            )
          else
            // コントローラ初期化前のフォールバック表示
            const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          if (_showCutIn)
            MissionCutIn(
              missionText: missionText,
              timeLimitSeconds: timeLimitSeconds,
              onFinished: () => setState(() => _showCutIn = false),
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
                insight: _buildInsight(context, widget.quizType),
              ),
            ),
        ],
      ),
    );
  }

  String _missionText(CalendarQuizType quizType) {
    final t = context.s;
    return switch (quizType) {
      CalendarQuizType.quiz1 => t.quiz1.missionText,
      CalendarQuizType.quiz2 => t.quiz2.missionText,
      CalendarQuizType.quiz3 => t.quiz3.missionText,
      CalendarQuizType.quiz4 => t.quiz4.missionText,
    };
  }

  Widget _buildInsight(BuildContext context, CalendarQuizType quizType) {
    final t = context.s;
    return switch (quizType) {
      CalendarQuizType.quiz1 => Builder(
          builder: (_) {
            final insight = t.quiz1.insight;
            return QuizInsightContent(
              title: insight.title,
              subtitle: insight.subtitle,
              items: [
                QuizInsightItem(
                  emoji: '👆',
                  title: insight.swipeTitle,
                  desc: insight.swipeDesc,
                ),
                QuizInsightItem(
                  emoji: '📅',
                  title: insight.calendarTitle,
                  desc: insight.calendarDesc,
                ),
                QuizInsightItem(
                  emoji: '👁',
                  title: insight.gestureTitle,
                  desc: insight.gestureDesc,
                ),
              ],
            );
          },
        ),
      CalendarQuizType.quiz2 => Builder(
          builder: (_) {
            final insight = t.quiz2.insight;
            return QuizInsightContent(
              title: insight.title,
              subtitle: insight.subtitle,
              items: [
                QuizInsightItem(
                  emoji: '✋',
                  title: insight.longPressTitle,
                  desc: insight.longPressDesc,
                ),
                QuizInsightItem(
                  emoji: '➕',
                  title: insight.fabTitle,
                  desc: insight.fabDesc,
                ),
                QuizInsightItem(
                  emoji: '🔀',
                  title: insight.addTitle,
                  desc: insight.addDesc,
                ),
              ],
            );
          },
        ),
      CalendarQuizType.quiz3 => Builder(
          builder: (_) {
            final insight = t.quiz3.insight;
            return QuizInsightContent(
              title: insight.title,
              subtitle: insight.subtitle,
              items: [
                QuizInsightItem(
                  emoji: '✊',
                  title: insight.dragTitle,
                  desc: insight.dragDesc,
                ),
                QuizInsightItem(
                  emoji: '📦',
                  title: insight.dropTitle,
                  desc: insight.dropDesc,
                ),
                QuizInsightItem(
                  emoji: '💡',
                  title: insight.intuitionTitle,
                  desc: insight.intuitionDesc,
                ),
              ],
            );
          },
        ),
      CalendarQuizType.quiz4 => Builder(
          builder: (_) {
            final insight = t.quiz4.insight;
            return QuizInsightContent(
              title: insight.title,
              subtitle: insight.subtitle,
              items: [
                QuizInsightItem(
                  emoji: '📅',
                  title: insight.todayTitle,
                  desc: insight.todayDesc,
                ),
                QuizInsightItem(
                  emoji: '🏠',
                  title: insight.iconTitle,
                  desc: insight.iconDesc,
                ),
                QuizInsightItem(
                  emoji: '⚡',
                  title: insight.jumpTitle,
                  desc: insight.jumpDesc,
                ),
              ],
            );
          },
        ),
    };
  }
}

// ---------------------------------------------------------------------------
// _CalendarAppScaffold
// ---------------------------------------------------------------------------

/// カレンダーアプリ風のスキャフォールド（プライベートウィジェット）
class _CalendarAppScaffold extends StatelessWidget {
  const _CalendarAppScaffold({
    required this.state,
    required this.notifier,
    required this.calendarController,
    required this.missionText,
    required this.timeLimitSeconds,
  });

  final CalendarQuizState state;
  final CalendarQuizNotifier notifier;
  final CrCalendarController calendarController;
  final String missionText;
  final int timeLimitSeconds;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: UnreadableText(
          sq.common.appTitle,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          // 「今日」ボタン（Quiz4のクリア条件）
          IconButton(
            icon: const Icon(Icons.calendar_today),
            tooltip: sq.common.today,
            onPressed: state.status == QuizStatus.playing
                ? notifier.jumpToToday
                : null,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.status == QuizStatus.playing
            ? () => _showAddEventDialog(context, state.focusedMonth)
            : null,
        tooltip: sq.common.add,
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          CrCalendar(
            firstDayOfWeek: WeekDay.monday,
            controller: calendarController,
            initialDate: state.focusedMonth,
            touchMode: TouchMode.none,
            dayItemBuilder: (properties) => _DayItem(
              properties: properties,
              events: state.events,
              onLongPress: state.status == QuizStatus.playing
                  ? (date) => _showAddEventDialog(context, date)
                  : null,
              onEventDrop: state.status == QuizStatus.playing
                  ? (eventId, date) => notifier.moveEvent(eventId, date)
                  : null,
            ),
          ),
          // ミッションバブル
          FloatingMissionBubble(
            remainingSeconds: state.remainingSeconds,
            missionText: missionText,
            hintUsed: false,
            timeLimitSeconds: timeLimitSeconds,
            onGiveUp: notifier.giveUp,
          ),
        ],
      ),
    );
  }

  /// 予定追加ダイアログを表示する
  Future<void> _showAddEventDialog(
    BuildContext context,
    DateTime date,
  ) async {
    final t = context.s;
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(t.common.addEventTitle),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: t.common.eventTitle,
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(t.common.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(controller.text),
            child: Text(t.common.save),
          ),
        ],
      ),
    );
    if (result != null && result.isNotEmpty) {
      notifier.addEvent(date, result);
    }
    controller.dispose();
  }
}

// ---------------------------------------------------------------------------
// _DayItem
// ---------------------------------------------------------------------------

/// カレンダーの1日分のセル（dayItemBuilder で使用）
///
/// cr_calendar 1.3.0 の [DayItemProperties] フィールド:
/// - [DayItemProperties.date]: その日の DateTime
/// - [DayItemProperties.isInMonth]: 現在の月に属するか
/// - [DayItemProperties.isCurrentDay]: 今日かどうか
class _DayItem extends StatelessWidget {
  const _DayItem({
    required this.properties,
    required this.events,
    this.onLongPress,
    this.onEventDrop,
  });

  final DayItemProperties properties;
  final List<CalendarEvent> events;
  final void Function(DateTime date)? onLongPress;
  final void Function(String eventId, DateTime date)? onEventDrop;

  @override
  Widget build(BuildContext context) {
    final date = properties.date;
    final isCurrentMonth = properties.isInMonth;
    final isToday = properties.isCurrentDay;

    final dayLabel = Text(
      '${date.day}',
      style: TextStyle(
        fontSize: 14,
        fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
        color: isToday
            ? Theme.of(context).colorScheme.primary
            : isCurrentMonth
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.3),
      ),
    );

    // 当月外のセルは薄い日付表示のみ
    if (!isCurrentMonth) {
      return Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 4),
        child: dayLabel,
      );
    }

    return DragTarget<String>(
      onAcceptWithDetails: (details) {
        onEventDrop?.call(details.data, date);
      },
      builder: (context, candidateData, rejectedData) {
        final isHighlighted = candidateData.isNotEmpty;
        return GestureDetector(
          onLongPress: onLongPress != null ? () => onLongPress!(date) : null,
          child: Container(
            decoration: isHighlighted
                ? BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(4),
                  )
                : null,
            padding: const EdgeInsets.only(top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: isToday
                      ? Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${date.day}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        )
                      : dayLabel,
                ),
                // この日のイベントを表示
                ..._buildEventChips(context, date),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildEventChips(BuildContext context, DateTime date) {
    final dateEvents = events
        .where(
          (e) =>
              e.begin.year == date.year &&
              e.begin.month == date.month &&
              e.begin.day == date.day,
        )
        .toList();

    if (dateEvents.isEmpty) return [];

    // 最大2件まで表示
    return dateEvents.take(2).map((event) {
      return LongPressDraggable<String>(
        data: event.id,
        feedback: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(4),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: event.color,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              event.title,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ),
        ),
        childWhenDragging: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
          height: 14,
          decoration: BoxDecoration(
            color: event.color.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          height: 14,
          decoration: BoxDecoration(
            color: event.color,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Text(
            event.title,
            style: const TextStyle(
              fontSize: 9,
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
        ),
      );
    }).toList();
  }
}
