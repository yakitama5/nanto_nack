import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../i18n/strings.g.dart' as cal;
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
  CrCalendarController? _calendarController;

  @override
  void initState() {
    super.initState();
    final notifier = ref.read(
      calendarQuizNotifierProvider(widget.quizType).notifier,
    );
    _calendarController = notifier.controller;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      notifier.startQuiz();
    });
  }

  /// 日付タップ → その日のボトムシートを表示（TimeTree風）
  Future<void> _onDayTapped(
    DateTime date,
    List<CalendarEvent> eventsForDay,
  ) async {
    final notifier = ref.read(
      calendarQuizNotifierProvider(widget.quizType).notifier,
    );
    final result = await _showDayBottomSheet(date, eventsForDay);
    if (!mounted) return;
    if (result != null && result.isNotEmpty) {
      notifier.addEvent(date, result);
    }
  }

  /// FABタップ → Quiz2 の場合のみ15日にボトムシートを表示
  Future<void> _onFabPressed() async {
    if (widget.quizType != CalendarQuizType.quiz2) return;
    final state = ref.read(calendarQuizNotifierProvider(widget.quizType));
    final notifier = ref.read(
      calendarQuizNotifierProvider(widget.quizType).notifier,
    );
    // Quiz2 では15日に設定
    final now = state.quizStartTime;
    final date = DateTime(now.year, now.month, 15);
    final eventsForDay = state.events
        .where(
          (e) =>
              e.begin.year == date.year &&
              e.begin.month == date.month &&
              e.begin.day == date.day,
        )
        .toList();
    final result = await _showDayBottomSheet(date, eventsForDay);
    if (!mounted) return;
    if (result != null && result.isNotEmpty) {
      notifier.addEvent(date, result);
    }
  }

  /// 日付ボトムシートを表示し、追加した予定タイトルを返す
  Future<String?> _showDayBottomSheet(
    DateTime date,
    List<CalendarEvent> eventsForDay,
  ) async {
    final sq = context.sq;
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => _DayBottomSheet(
        date: date,
        events: eventsForDay,
        addLabel: sq.common.add,
        saveLabel: sq.common.save,
        cancelLabel: sq.common.cancel,
        eventTitleHint: sq.common.eventTitle,
      ),
    );
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
              quizType: widget.quizType,
              state: state,
              notifier: notifier,
              calendarController: _calendarController!,
              missionText: missionText,
              timeLimitSeconds: timeLimitSeconds,
              onDayTapped: state.status == QuizStatus.playing
                  ? _onDayTapped
                  : null,
              onFabPressed:
                  widget.quizType == CalendarQuizType.quiz2 &&
                      state.status == QuizStatus.playing
                  ? _onFabPressed
                  : null,
            )
          else
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
      CalendarQuizType.quiz1 => _quiz1Insight(t),
      CalendarQuizType.quiz2 => _quiz2Insight(t),
      CalendarQuizType.quiz3 => _quiz3Insight(t),
      CalendarQuizType.quiz4 => _quiz4Insight(t),
    };
  }

  QuizInsightContent _quiz1Insight(cal.Translations t) {
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
  }

  QuizInsightContent _quiz2Insight(cal.Translations t) {
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
  }

  QuizInsightContent _quiz3Insight(cal.Translations t) {
    final insight = t.quiz3.insight;
    return QuizInsightContent(
      title: insight.title,
      subtitle: insight.subtitle,
      items: [
        QuizInsightItem(
          emoji: '👆',
          title: insight.tapTitle,
          desc: insight.tapDesc,
        ),
        QuizInsightItem(
          emoji: '📅',
          title: insight.futureTitle,
          desc: insight.futureDesc,
        ),
        QuizInsightItem(
          emoji: '💡',
          title: insight.planTitle,
          desc: insight.planDesc,
        ),
      ],
    );
  }

  QuizInsightContent _quiz4Insight(cal.Translations t) {
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
  }
}

// ---------------------------------------------------------------------------
// _CalendarAppScaffold
// ---------------------------------------------------------------------------

class _CalendarAppScaffold extends StatelessWidget {
  const _CalendarAppScaffold({
    required this.quizType,
    required this.state,
    required this.notifier,
    required this.calendarController,
    required this.missionText,
    required this.timeLimitSeconds,
    this.onDayTapped,
    this.onFabPressed,
  });

  final CalendarQuizType quizType;
  final CalendarQuizState state;
  final CalendarQuizNotifier notifier;
  final CrCalendarController calendarController;
  final String missionText;
  final int timeLimitSeconds;
  final Future<void> Function(DateTime date, List<CalendarEvent> events)?
  onDayTapped;
  final Future<void> Function()? onFabPressed;

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
          if (quizType == CalendarQuizType.quiz4 &&
              state.status == QuizStatus.playing)
            IconButton(
              icon: const Icon(Icons.calendar_today),
              tooltip: sq.common.today,
              onPressed: notifier.jumpToToday,
            ),
        ],
      ),
      floatingActionButton: onFabPressed == null
          ? null
          : FloatingActionButton(
              onPressed: onFabPressed,
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
            weekDaysBuilder: (day) => SizedBox(
              height: 40,
              child: Center(
                child: UnreadableText(
                  sq.common.weekdays[day.index],
                  animateOnObfuscate: false,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            dayItemBuilder: (properties) => _DayItem(
              properties: properties,
              events: state.events,
              onTap: onDayTapped != null
                  ? (date, events) => onDayTapped!(date, events)
                  : null,
              onEventDrop: state.status == QuizStatus.playing
                  ? (eventId, date) => notifier.moveEvent(eventId, date)
                  : null,
            ),
          ),
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
}

// ---------------------------------------------------------------------------
// _DayItem
// ---------------------------------------------------------------------------

class _DayItem extends StatelessWidget {
  const _DayItem({
    required this.properties,
    required this.events,
    this.onTap,
    this.onEventDrop,
  });

  final DayItemProperties properties;
  final List<CalendarEvent> events;

  /// 日付タップ時のコールバック（date, その日のイベント一覧）
  final void Function(DateTime date, List<CalendarEvent> events)? onTap;
  final void Function(String eventId, DateTime date)? onEventDrop;

  @override
  Widget build(BuildContext context) {
    final date = properties.date;
    final isCurrentMonth = properties.isInMonth;
    final isToday = properties.isCurrentDay;

    final dayStyle = TextStyle(
      fontSize: 14,
      fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
      color: isToday
          ? Theme.of(context).colorScheme.primary
          : isCurrentMonth
          ? Theme.of(context).colorScheme.onSurface
          : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
    );
    final dayLabel = UnreadableText(
      '${date.day}',
      style: dayStyle,
      animateOnObfuscate: false,
    );

    if (!isCurrentMonth) {
      return Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 4),
        child: dayLabel,
      );
    }

    final dateEvents = events
        .where(
          (e) =>
              e.begin.year == date.year &&
              e.begin.month == date.month &&
              e.begin.day == date.day,
        )
        .toList();

    return DragTarget<String>(
      onAcceptWithDetails: (details) {
        onEventDrop?.call(details.data, date);
      },
      builder: (context, candidateData, rejectedData) {
        final isHighlighted = candidateData.isNotEmpty;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap != null ? () => onTap!(date, dateEvents) : null,
          child: SizedBox.expand(
            child: Container(
              decoration: isHighlighted
                  ? BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primaryContainer.withValues(alpha: 0.5),
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
                            child: UnreadableText(
                              '${date.day}',
                              animateOnObfuscate: false,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          )
                        : dayLabel,
                  ),
                  ..._buildEventChips(context, dateEvents),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildEventChips(
    BuildContext context,
    List<CalendarEvent> dateEvents,
  ) {
    if (dateEvents.isEmpty) return [];
    final displayed = dateEvents.take(2);
    final List<Widget> widgets = displayed.map<Widget>((event) {
      final title = _resolveEventTitle(context, event);
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
            child: UnreadableText(
              title,
              animateOnObfuscate: false,
              style: const TextStyle(fontSize: 10, color: Colors.white),
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
          child: UnreadableText(
            title,
            animateOnObfuscate: false,
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
    if (dateEvents.length > 2) {
      widgets.add(
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          height: 14,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Text(
            '+${dateEvents.length - 2}',
            style: const TextStyle(
              fontSize: 9,
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      );
    }
    return widgets;
  }
}

// ---------------------------------------------------------------------------
// _DayBottomSheet（TimeTree風日付ボトムシート）
// ---------------------------------------------------------------------------

class _DayBottomSheet extends StatefulWidget {
  const _DayBottomSheet({
    required this.date,
    required this.events,
    required this.addLabel,
    required this.saveLabel,
    required this.cancelLabel,
    required this.eventTitleHint,
  });

  final DateTime date;
  final List<CalendarEvent> events;
  final String addLabel;
  final String saveLabel;
  final String cancelLabel;
  final String eventTitleHint;

  @override
  State<_DayBottomSheet> createState() => _DayBottomSheetState();
}

class _DayBottomSheetState extends State<_DayBottomSheet> {
  final _controller = TextEditingController();
  bool _showInput = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final bottomPadding = MediaQuery.viewInsetsOf(context).bottom;

    // context.sq は CalendarTranslationsExtension で定義された xx ロケール固定のアクセサ
    final sq = context.sq;
    final weekdayStr = sq.common.weekdays[widget.date.weekday - 1];
    final dateLabel = sq.common.dateLabel(
      month: widget.date.month,
      day: widget.date.day,
      weekday: weekdayStr,
    );

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ドラッグハンドル
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 8),
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            // 日付ヘッダー
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
              child: UnreadableText(
                dateLabel,
                animateOnObfuscate: false,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
            ),
            const Divider(height: 1),
            // 既存イベント一覧
            if (widget.events.isNotEmpty)
              ...widget.events.map(
                (e) => ListTile(
                  leading: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: e.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  title: UnreadableText(
                    _resolveEventTitle(context, e),
                    animateOnObfuscate: false,
                    style: textTheme.bodyMedium,
                  ),
                  dense: true,
                ),
              ),
            // 予定追加エリア
            if (_showInput)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: widget.eventTitleHint,
                          border: const OutlineInputBorder(),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          isDense: true,
                        ),
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            Navigator.of(context).pop(value);
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: () {
                        final value = _controller.text;
                        if (value.isNotEmpty) {
                          Navigator.of(context).pop(value);
                        }
                      },
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                      ),
                      child: UnreadableText(widget.saveLabel),
                    ),
                  ],
                ),
              )
            else
              ListTile(
                leading: Icon(Icons.add, color: colorScheme.primary),
                title: UnreadableText(
                  widget.addLabel,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
                onTap: () => setState(() => _showInput = true),
              ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// ヘルパー関数
// ---------------------------------------------------------------------------

/// イベント ID から xx ロケールの表示タイトルを解決する。
///
/// カタログの初期イベントは ID で特定し、カスタム言語の文字列を返す。
/// ユーザーが追加したイベント（ID が一致しない場合）はそのまま返す。
String _resolveEventTitle(BuildContext context, CalendarEvent event) {
  final sq = context.sq;
  return switch (event.id) {
    'calendar_quiz1_interview' => sq.common.eventInterview,
    'calendar_quiz1_party' => sq.common.eventParty,
    'calendar_quiz2_meeting' => sq.common.eventMeeting,
    'calendar_quiz2_health' => sq.common.eventHealth,
    'calendar_quiz3_today' => sq.common.eventDentist,
    'calendar_quiz3_tomorrow' => sq.common.eventLunch,
    'calendar_quiz4_important' => sq.common.eventImportant,
    _ => event.title,
  };
}
