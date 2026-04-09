import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../i18n/strings.g.dart' as $alarm;
import '../domain/entities/alarm_item.dart';
import '../i18n/alarm_translations_extension.dart';

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
    this.onAlarmSwipeDeleteConfirm,
    this.onAlarmTap,
    this.highlightAddButton = false,
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
  final void Function(String alarmId)? onAlarmSwipeDeleteConfirm;
  final void Function(String alarmId)? onAlarmTap;

  final bool highlightAddButton;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;

    return PopScope(
      canPop: quizStatus != QuizStatus.playing,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        // プレイ中に戻るジェスチャー → 確認ダイアログ
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('ゲームを中断しますか？'),
            content: const Text('プレイ中のゲームを終了します。'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('続ける'),
              ),
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                child: const Text('終了する'),
              ),
            ],
          ),
        );
        if (confirmed == true && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
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
        ),
        // FABを右下に配置してアラーム追加ボタンとして使用
        floatingActionButton: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: highlightAddButton
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 3,
                  ),
                )
              : null,
          child: FloatingActionButton(
            onPressed: onAddTap,
            backgroundColor: highlightAddButton
                ? Theme.of(context).colorScheme.primaryContainer
                : null,
            foregroundColor: highlightAddButton
                ? Theme.of(context).colorScheme.primary
                : null,
            tooltip: sq.common.add,
            child: const Icon(Icons.add),
          ),
        ),
        body: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: alarms.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final alarm = alarms[index];
                return _AlarmListItem(
                  alarm: alarm,
                  sq: sq,
                  onDeleteConfirm: onAlarmSwipeDeleteConfirm != null
                      ? (id) => onAlarmSwipeDeleteConfirm!(id)
                      : null,
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
      ),
    );
  }
}

/// アラームリストアイテム
class _AlarmListItem extends StatelessWidget {
  const _AlarmListItem({
    required this.alarm,
    required this.sq,
    required this.onToggle,
    required this.onTap,
    this.onDeleteConfirm,
  });

  final AlarmItem alarm;
  final $alarm.Translations sq;
  final void Function(String alarmId)? onDeleteConfirm;
  final void Function(bool) onToggle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // トグル以外の全領域をタップ可能にするため、左エリアと右のトグルを分離
    final content = Row(
      children: [
        // 左エリア（時刻・曜日）- タップで詳細遷移
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // 時刻をUnreadableTextで表示（アルファベット・数字がエンコードされる）
                      UnreadableText(
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
                          alarm.isAm ? sq.common.am : sq.common.pm,
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
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    )
                  else
                    UnreadableText(
                      sq.common.tomorrow,
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        // 右エリア（トグルのみ）- タップは遷移しない
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Switch(
            value: alarm.isEnabled,
            onChanged: onToggle,
          ),
        ),
      ],
    );

    // onDeleteConfirm が null でない場合は Slidable でスワイプ削除を有効化
    if (onDeleteConfirm == null) {
      return content;
    }

    final errorColor = Theme.of(context).colorScheme.error;
    final onErrorColor = Theme.of(context).colorScheme.onError;

    return Slidable(
      key: ValueKey(alarm.id),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        extentRatio: 0.25,
        dismissible: DismissiblePane(
          onDismissed: () => onDeleteConfirm!(alarm.id),
        ),
        children: [
          SlidableAction(
            onPressed: (_) => onDeleteConfirm!(alarm.id),
            backgroundColor: errorColor,
            foregroundColor: onErrorColor,
            icon: Icons.delete,
            label: CustomLanguageEncoder.encode(sq.common.delete),
          ),
        ],
      ),
      child: content,
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
    this.onHourChanged,
    this.onMinuteChanged,
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
  final void Function(int hour)? onHourChanged;
  final void Function(int minute)? onMinuteChanged;

  final bool highlightSaveButton;
  final bool highlightSnoozeToggle;
  final bool highlightDayButtons;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;

    return PopScope(
      canPop: quizStatus != QuizStatus.playing,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        // 戻るジェスチャーを検知したらキャンセル扱いにする（ゲームは終わらせない）
        onCancel?.call();
      },
      child: Scaffold(
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
                  // 時間ピッカー（スクロール可能なドラムロール）
                  _TimePicker(
                    hour: alarm.hour,
                    minute: alarm.minute,
                    onHourChanged: onHourChanged,
                    onMinuteChanged: onMinuteChanged,
                  ),
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
      ),
    );
  }
}

/// 時間ピッカー（スクロール可能なドラムロール風）
///
/// ユーザーが実際にスクロールして時・分を変更できる StatefulWidget。
/// ListWheelScrollView でループするリストを実現し、各数字を UnreadableText で表示する。
class _TimePicker extends StatefulWidget {
  const _TimePicker({
    required this.hour,
    required this.minute,
    this.onHourChanged,
    this.onMinuteChanged,
  });

  final int hour;
  final int minute;
  final void Function(int hour)? onHourChanged;
  final void Function(int minute)? onMinuteChanged;

  @override
  State<_TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<_TimePicker> {
  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;

  static const _itemExtent = 50.0;
  static const _height = 180.0;
  // スクロールのループ開始位置（中央値付近に設定して見た目を自然にする）
  static const _loopOffset = 1000;

  @override
  void initState() {
    super.initState();
    _hourController = FixedExtentScrollController(
      initialItem: _loopOffset * 24 + widget.hour,
    );
    _minuteController = FixedExtentScrollController(
      initialItem: _loopOffset * 60 + widget.minute,
    );
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildWheelColumn(
            controller: _hourController,
            count: 24,
            onChanged: (index) {
              final hour = index % 24;
              widget.onHourChanged?.call(hour);
            },
          ),
          const Text(
            ':',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          _buildWheelColumn(
            controller: _minuteController,
            count: 60,
            onChanged: (index) {
              final minute = index % 60;
              widget.onMinuteChanged?.call(minute);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWheelColumn({
    required FixedExtentScrollController controller,
    required int count,
    required void Function(int) onChanged,
  }) {
    return SizedBox(
      width: 80,
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: _itemExtent,
        perspective: 0.003,
        diameterRatio: 1.5,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: onChanged,
        childDelegate: ListWheelChildLoopingListDelegate(
          children: [
            for (int i = 0; i < count; i++)
              Center(
                child: UnreadableText(
                  i.toString().padLeft(2, '0'),
                  // アニメーションなし：スクロール中に逐次エンコードされると
                  // 数字が読めなくなるため即時切り替えを使用
                  animateOnObfuscate: false,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// 曜日選択ウィジェット
///
/// 表示順は日曜始まり（Sun, Mon, Tue, Wed, Thu, Fri, Sat）。
/// 内部インデックスは 0=月, 1=火, ..., 6=日 のままなので、
/// 表示インデックス → 内部インデックスのマッピングが必要。
/// マッピング: [6, 0, 1, 2, 3, 4, 5]（表示0番目=日曜=内部6）
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

  // 表示順（日曜始まり）から内部インデックス（月=0..日=6）へのマッピング
  static const _displayToInternalIndex = [6, 0, 1, 2, 3, 4, 5];

  static List<String> _dayLabels($alarm.Translations sq) => [
        sq.common.sun,
        sq.common.mon,
        sq.common.tue,
        sq.common.wed,
        sq.common.thu,
        sq.common.fri,
        sq.common.sat,
      ];

  @override
  Widget build(BuildContext context) {
    final labels = _dayLabels(sq);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int displayIndex = 0; displayIndex < 7; displayIndex++)
            Builder(
              builder: (context) {
                // 表示位置から内部インデックスに変換してタップ・選択状態を管理
                final internalIndex = _displayToInternalIndex[displayIndex];
                final isSelected = activeDays.contains(internalIndex);
                return GestureDetector(
                  onTap: () => onDayToggle?.call(internalIndex),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : highlighted
                              ? Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withValues(alpha: 0.15)
                              : Theme.of(context).colorScheme.surfaceContainerHighest,
                      border: highlighted && !isSelected
                          ? Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1.5,
                            )
                          : null,
                    ),
                    alignment: Alignment.center,
                    child: UnreadableText(
                      labels[displayIndex],
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: isSelected
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                );
              },
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
