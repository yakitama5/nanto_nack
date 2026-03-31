import 'package:flutter/material.dart';
import 'package:quiz_core/i18n/strings.g.dart';

/// ドラッグ可能な円形ミッションバブル
///
/// 残り時間を [CircularProgressIndicator] で外周に可視化し、
/// タップでお題テキストのポップアップを表示する。
/// ドラッグで画面内の任意の位置に移動可能。
///
/// 必ず [Stack] の直接の子として配置すること（内部で [Positioned] を使用）。
///
/// ```dart
/// Stack(
///   children: [
///     // ... 背景UI ...
///     FloatingMissionBubble(
///       remainingSeconds: 45,
///       missionText: '水を2つ購入してください',
///       timeLimitSeconds: 60,
///       hintUsed: false,
///       onHintTap: () { /* ヒント使用処理 */ },
///     ),
///   ],
/// )
/// ```
class FloatingMissionBubble extends StatefulWidget {
  const FloatingMissionBubble({
    super.key,
    required this.remainingSeconds,
    required this.missionText,
    required this.hintUsed,
    this.onHintTap,
    this.onGiveUp,
    this.timeLimitSeconds = 60,
    this.initialOffset,
  });

  /// 残り時間（秒）
  final int remainingSeconds;

  /// ミッション説明テキスト
  final String missionText;

  /// ヒントを使用済みかどうか
  final bool hintUsed;

  /// ヒントボタンタップ時のコールバック
  final VoidCallback? onHintTap;

  /// 「諦める」タップ時のコールバック
  final VoidCallback? onGiveUp;

  /// 制限時間（プログレス・色変化の判定に使用）
  final int timeLimitSeconds;

  /// バブルの初期表示位置（省略時は [Stack] のサイズから右上付近を自動計算）
  final Offset? initialOffset;

  @override
  State<FloatingMissionBubble> createState() => _FloatingMissionBubbleState();
}

class _FloatingMissionBubbleState extends State<FloatingMissionBubble>
    with SingleTickerProviderStateMixin {
  Offset? _offset;
  bool _showMission = false;

  late final AnimationController _popupController;

  /// バブルの右上コーナーからスケール展開する
  late final Animation<double> _popupScale;
  late final Animation<double> _popupOpacity;

  static const double _bubbleSize = 72.0;

  @override
  void initState() {
    super.initState();
    _popupController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    _popupScale = CurvedAnimation(
      parent: _popupController,
      curve: Curves.easeOutBack,
      reverseCurve: Curves.easeIn,
    );
    _popupOpacity = CurvedAnimation(
      parent: _popupController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _popupController.dispose();
    super.dispose();
  }

  /// お題ポップアップの表示・非表示を切り替える。
  /// 非表示時はアニメーション完了後に Widget をツリーから除去する。
  void _toggleMission() {
    if (_showMission) {
      _popupController.reverse().then((_) {
        if (mounted) setState(() => _showMission = false);
      });
    } else {
      setState(() => _showMission = true);
      _popupController.forward(from: 0);
    }
  }

  Color get _timerColor {
    if (widget.timeLimitSeconds <= 0) return Colors.green;
    final ratio = widget.remainingSeconds / widget.timeLimitSeconds;
    if (ratio > 0.5) return Colors.green;
    if (ratio > 0.25) return Colors.orange;
    return Colors.red;
  }

  double get _progress {
    if (widget.timeLimitSeconds <= 0) return 1.0;
    return (widget.remainingSeconds / widget.timeLimitSeconds).clamp(0.0, 1.0);
  }

  String get _timerLabel {
    final m = widget.remainingSeconds ~/ 60;
    final s = widget.remainingSeconds % 60;
    if (m > 0) return '$m:${s.toString().padLeft(2, '0')}';
    return '${widget.remainingSeconds}s';
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final offset = _offset ??
        widget.initialOffset ??
        Offset(
          screenWidth - _bubbleSize - 16,
          MediaQuery.paddingOf(context).top + kToolbarHeight + 8,
        );

    // 右端を基準に固定することで、ポップアップ展開時に左方向へ伸び、
    // バブル自体の位置がずれないようにする。
    final rightFromEdge = screenWidth - offset.dx - _bubbleSize;

    return Positioned(
      right: rightFromEdge,
      top: offset.dy,
      // Material でラップし Text の黄色いデフォルト装飾を防ぐ
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            // 円形バブル（タップ＆ドラッグ）
            GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  final next = ((_offset ?? offset) + details.delta);
                  _offset = Offset(
                    next.dx.clamp(0.0, screenWidth - _bubbleSize),
                    next.dy.clamp(0.0, screenHeight - _bubbleSize),
                  );
                });
              },
              onTap: _toggleMission,
              child: _BubbleRing(
                size: _bubbleSize,
                progress: _progress,
                timerColor: _timerColor,
                timerLabel: _timerLabel,
              ),
            ),
            // お題ポップアップ（バブル右上コーナーからスケール展開）
            if (_showMission) ...[
              const SizedBox(height: 6),
              ScaleTransition(
                scale: _popupScale,
                alignment: Alignment.topRight,
                child: FadeTransition(
                  opacity: _popupOpacity,
                  child: _MissionPopup(
                    missionText: widget.missionText,
                    hintUsed: widget.hintUsed,
                    onHintTap: widget.hintUsed ? null : widget.onHintTap,
                    onGiveUp: widget.onGiveUp,
                    onClose: _toggleMission,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// 円形のタイマーリング（バブル本体）
class _BubbleRing extends StatelessWidget {
  const _BubbleRing({
    required this.size,
    required this.progress,
    required this.timerColor,
    required this.timerLabel,
  });

  final double size;
  final double progress;
  final Color timerColor;
  final String timerLabel;

  @override
  Widget build(BuildContext context) {
    final innerSize = size - 12.0;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // プログレスリング
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 4,
                color: timerColor,
                backgroundColor: timerColor.withValues(alpha: 0.25),
                strokeCap: StrokeCap.round,
              ),
            ),
          ),
          // 内円：残り時間 + お題アイコン
          Container(
            width: innerSize,
            height: innerSize,
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .surface
                  .withValues(alpha: 0.95),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  timerLabel,
                  style: TextStyle(
                    color: timerColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 2),
                Icon(
                  Icons.assignment_outlined,
                  size: 11,
                  color: timerColor.withValues(alpha: 0.7),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// お題ポップアップカード
class _MissionPopup extends StatelessWidget {
  const _MissionPopup({
    required this.missionText,
    required this.hintUsed,
    this.onHintTap,
    this.onGiveUp,
    this.onClose,
  });

  final String missionText;
  final bool hintUsed;
  final VoidCallback? onHintTap;
  final VoidCallback? onGiveUp;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      constraints: const BoxConstraints(maxWidth: 200),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.97),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ヘッダー行
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.flag, size: 13, color: colorScheme.primary),
              const SizedBox(width: 5),
              Text(
                context.t.mission.topic,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: onClose,
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  Icons.close,
                  size: 14,
                  color: colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // お題テキスト
          Text(
            missionText,
            style: const TextStyle(fontSize: 13, height: 1.4),
          ),
          // ヒントボタン（未使用時のみ）
          if (!hintUsed && onHintTap != null) ...[
            const Divider(height: 16),
            InkWell(
              onTap: onHintTap,
              borderRadius: BorderRadius.circular(4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.lightbulb, size: 13, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(
                    context.t.mission.useHint,
                    style: TextStyle(
                      fontSize: 12,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ],
          // 諦めるボタン
          if (onGiveUp != null) ...[
            const Divider(height: 16),
            InkWell(
              onTap: onGiveUp,
              borderRadius: BorderRadius.circular(4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.flag_outlined,
                    size: 13,
                    color: colorScheme.error,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    context.t.mission.giveUp,
                    style: TextStyle(
                      fontSize: 12,
                      color: colorScheme.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
