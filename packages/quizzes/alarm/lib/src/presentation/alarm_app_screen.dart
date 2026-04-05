import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';

import '../domain/entities/alarm_item.dart';
import '../i18n/alarm_translations_extension.dart';
import '../../i18n/strings.g.dart' as $alarm;

/// 時計アプリ風のアラーム一覧UIベーススクリーン
class AlarmListScreen extends StatelessWidget {
  /// コンストラクタ
  const AlarmListScreen({
    super.key,
    required this.alarms,
    required this.quizStatus,
    required this.remainingSeconds,
    required this.timeLimitSeconds,
    required this.missionText,
    required this.onGiveUp,
    required this.overlays,
    this.onAddTap,
    this.onAlarmToggle,
    this.onAlarmSwipedLeft,
    this.onAlarmSwipeDeleteConfirm,
    this.onAlarmTap,
    this.highlightAddButton = false,
    this.swipedAlarmId,
  });

  final List<AlarmItem> alarms;
  final QuizStatus quizStatus;
  final int remainingSeconds;
  final int timeLimitSeconds;
  final String missionText;
  final VoidCallback onGiveUp;
  final List<Widget> overlays;

  final VoidCallback? onAddTap;
  final void Function(String alarmId, bool enabled)? onAlarmToggle;
  final void Function(String alarmId)? onAlarmSwipedLeft;
  final void Function(String alarmId)? onAlarmSwipeDeleteConfirm;
  final void Function(String alarmId)? onAlarmTap;

  final bool highlightAddButton;
  final String? swipedAlarmId;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: UnreadableText(
          sq.common.alarmsTab,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(right: 8),
            decoration: highlightAddButton
                ? BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  )
                : null,
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: highlightAddButton
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
              onPressed: onAddTap,
              tooltip: sq.common.add,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: alarms.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final alarm = alarms[index];
              final isSwiped = swipedAlarmId == alarm.id;
              return _AlarmListItem(
                alarm: alarm,
                sq: sq,
                isSwiped: isSwiped,
                onSwipe: () => onAlarmSwipedLeft?.call(alarm.id),
                onDeleteConfirm: () =>
                    onAlarmSwipeDeleteConfirm?.call(alarm.id),
                onToggle: (enabled) =>
                    onAlarmToggle?.call(alarm.id, enabled),
                onTap: () => onAlarmTap?.call(alarm.id),
              );
            },
          ),
          // ミッションバブル
          FloatingMissionBubble(
            remainingSeconds: remainingSeconds,
            missionText: missionText,
            hintUsed: false,
            timeLimitSeconds: timeLimitSeconds,
            onGiveUp: onGiveUp,
          ),
          ...overlays,
        ],
      ),
    );
  }
}

/// アラームリストアイテム
class _AlarmListItem extends StatelessWidget {
  const _AlarmListItem({
    required this.alarm,
    required this.sq,
    required this.isSwiped,
    required this.onSwipe,
    required this.onDeleteConfirm,
    required this.onToggle,
    required this.onTap,
  });

  final AlarmItem alarm;
  final $alarm.Translations sq;
  final bool isSwiped;
  final VoidCallback onSwipe;
  final VoidCallback onDeleteConfirm;
  final void Function(bool) onToggle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null && details.primaryVelocity! < -100) {
          onSwipe();
        }
      },
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        color: isSwiped
            ? Theme.of(context).colorScheme.errorContainer
            : Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              alarm.timeLabel,
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: UnreadableText(
                                alarm.isAm
                                    ? sq.common.am
                                    : sq.common.pm,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        if (alarm.activeDays.isNotEmpty)
                          UnreadableText(
                            sq.common.weekdays,
                            style: TextStyle(
                              fontSize: 13,
                              color:
                                  Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          )
                        else
                          UnreadableText(
                            sq.common.tomorrow,
                            style: TextStyle(
                              fontSize: 13,
                              color:
                                  Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ),
                    const Spacer(),
                    Switch(
                      value: alarm.isEnabled,
                      onChanged: onToggle,
                    ),
                  ],
                ),
              ),
            ),
            // スワイプ後の削除ボタン
            if (isSwiped)
              GestureDetector(
                onTap: onDeleteConfirm,
                child: Container(
                  width: 80,
                  color: Theme.of(context).colorScheme.error,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Theme.of(context).colorScheme.onError,
                      ),
                      UnreadableText(
                        sq.common.delete,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onError,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// アラーム追加/編集フォームスクリーン
class AlarmEditScreen extends StatelessWidget {
  /// コンストラクタ
  const AlarmEditScreen({
    super.key,
    required this.alarm,
    required this.quizStatus,
    required this.remainingSeconds,
    required this.timeLimitSeconds,
    required this.missionText,
    required this.onGiveUp,
    required this.overlays,
    this.onSave,
    this.onCancel,
    this.onSnoozeToggle,
    this.onDayToggle,
    this.highlightSaveButton = false,
    this.highlightSnoozeToggle = false,
    this.highlightDayButtons = false,
  });

  final AlarmItem alarm;
  final QuizStatus quizStatus;
  final int remainingSeconds;
  final int timeLimitSeconds;
  final String missionText;
  final VoidCallback onGiveUp;
  final List<Widget> overlays;

  final VoidCallback? onSave;
  final VoidCallback? onCancel;
  final void Function(bool)? onSnoozeToggle;
  final void Function(int dayIndex)? onDayToggle;

  final bool highlightSaveButton;
  final bool highlightSnoozeToggle;
  final bool highlightDayButtons;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: UnreadableText(sq.common.editAlarm),
        leading: TextButton(
          onPressed: onCancel,
          child: UnreadableText(
            sq.common.cancel,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        leadingWidth: 80,
        actions: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(right: 8),
            decoration: highlightSaveButton
                ? BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  )
                : null,
            child: TextButton(
              onPressed: onSave,
              child: UnreadableText(
                sq.common.save,
                style: TextStyle(
                  color: highlightSaveButton
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurface,
                  fontWeight: highlightSaveButton
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // 時間ピッカー
                _TimePicker(hour: alarm.hour, minute: alarm.minute),
                const Divider(),
                // 曜日選択
                _DaySelector(
                  activeDays: alarm.activeDays,
                  sq: sq,
                  highlighted: highlightDayButtons,
                  onDayToggle: onDayToggle,
                ),
                const Divider(),
                // スヌーズ設定
                _SnoozeRow(
                  enabled: alarm.snoozeEnabled,
                  sq: sq,
                  highlighted: highlightSnoozeToggle,
                  onToggle: onSnoozeToggle,
                ),
                const Divider(),
                // サウンド（ダミー）
                _SettingRow(
                  icon: Icons.music_note,
                  label: sq.common.sound,
                ),
                const Divider(),
                // ラベル（ダミー）
                _SettingRow(
                  icon: Icons.label,
                  label: sq.common.label,
                ),
              ],
            ),
          ),
          FloatingMissionBubble(
            remainingSeconds: remainingSeconds,
            missionText: missionText,
            hintUsed: false,
            timeLimitSeconds: timeLimitSeconds,
            onGiveUp: onGiveUp,
          ),
          ...overlays,
        ],
      ),
    );
  }
}

/// 時間ピッカー（ドラムロール風）
class _TimePicker extends StatelessWidget {
  const _TimePicker({required this.hour, required this.minute});

  final int hour;
  final int minute;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _NumberColumn(value: hour, max: 23),
          const Text(
            ':',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          _NumberColumn(value: minute, max: 59),
        ],
      ),
    );
  }
}

class _NumberColumn extends StatelessWidget {
  const _NumberColumn({required this.value, required this.max});

  final int value;
  final int max;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ((value - 1 + max + 1) % (max + 1)).toString().padLeft(2, '0'),
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value.toString().padLeft(2, '0'),
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            ((value + 1) % (max + 1)).toString().padLeft(2, '0'),
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
            ),
          ),
        ],
      ),
    );
  }
}

/// 曜日選択ウィジェット
class _DaySelector extends StatelessWidget {
  const _DaySelector({
    required this.activeDays,
    required this.sq,
    required this.highlighted,
    this.onDayToggle,
  });

  final Set<int> activeDays;
  final $alarm.Translations sq;
  final bool highlighted;
  final void Function(int)? onDayToggle;

  static List<String> _dayLabels($alarm.Translations sq) => [
        sq.common.mon,
        sq.common.tue,
        sq.common.wed,
        sq.common.thu,
        sq.common.fri,
        sq.common.sat,
        sq.common.sun,
      ];

  @override
  Widget build(BuildContext context) {
    final labels = _dayLabels(sq);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < 7; i++)
            GestureDetector(
              onTap: () => onDayToggle?.call(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: activeDays.contains(i)
                      ? Theme.of(context).colorScheme.primary
                      : highlighted
                          ? Theme.of(context)
                              .colorScheme
                              .primary
                              .withValues(alpha: 0.15)
                          : Theme.of(context).colorScheme.surfaceContainerHighest,
                  border: highlighted && !activeDays.contains(i)
                      ? Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1.5,
                        )
                      : null,
                ),
                alignment: Alignment.center,
                child: UnreadableText(
                  labels[i],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: activeDays.contains(i)
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// スヌーズ行
class _SnoozeRow extends StatelessWidget {
  const _SnoozeRow({
    required this.enabled,
    required this.sq,
    required this.highlighted,
    this.onToggle,
  });

  final bool enabled;
  final $alarm.Translations sq;
  final bool highlighted;
  final void Function(bool)? onToggle;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: highlighted
          ? BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withValues(alpha: 0.5),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(8),
            )
          : null,
      child: Row(
        children: [
          Icon(Icons.snooze, color: Theme.of(context).colorScheme.onSurface),
          const SizedBox(width: 16),
          Expanded(
            child: UnreadableText(
              sq.common.snooze,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Switch(value: enabled, onChanged: onToggle),
        ],
      ),
    );
  }
}

/// 汎用設定行（タップで次画面へ遷移する想定）
class _SettingRow extends StatelessWidget {
  const _SettingRow({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.onSurface),
          const SizedBox(width: 16),
          Expanded(
            child: UnreadableText(
              label,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ],
      ),
    );
  }
}
