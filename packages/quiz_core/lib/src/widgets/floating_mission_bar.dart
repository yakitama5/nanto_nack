import 'package:flutter/material.dart';

/// 画面上部に浮遊するピル型のミッション情報バー
///
/// 通常時は「⏳ タイマー | 💡 ヒント | 🛒 お題」をコンパクトに表示し、
/// お題セクションをタップすると詳細が展開する。
///
/// 使い方:
/// ```dart
/// Stack(
///   children: [
///     // ... 背景 UI ...
///     Positioned(
///       top: MediaQuery.of(context).padding.top + 8,
///       left: 16,
///       right: 16,
///       child: FloatingMissionBar(
///         remainingSeconds: 45,
///         missionText: '水を2つ購入してください',
///         hintUsed: false,
///         onHintTap: () { /* ヒント使用処理 */ },
///       ),
///     ),
///   ],
/// )
/// ```
class FloatingMissionBar extends StatefulWidget {
  const FloatingMissionBar({
    super.key,
    required this.remainingSeconds,
    required this.missionText,
    required this.hintUsed,
    this.onHintTap,
    this.timeLimitSeconds = 60,
  });

  /// 残り時間（秒）
  final int remainingSeconds;

  /// ミッション説明テキスト
  final String missionText;

  /// ヒントを使用済みかどうか
  final bool hintUsed;

  /// ヒントボタンタップ時のコールバック
  final VoidCallback? onHintTap;

  /// 制限時間（色変化の判定に使用）
  final int timeLimitSeconds;

  @override
  State<FloatingMissionBar> createState() => _FloatingMissionBarState();
}

class _FloatingMissionBarState extends State<FloatingMissionBar> {
  bool _expanded = false;

  Color get _timerColor {
    if (widget.timeLimitSeconds <= 0) return Colors.green;
    final ratio = widget.remainingSeconds / widget.timeLimitSeconds;
    if (ratio > 0.5) return Colors.green;
    if (ratio > 0.25) return Colors.orange;
    return Colors.red;
  }

  String get _timerLabel {
    final m = widget.remainingSeconds ~/ 60;
    final s = widget.remainingSeconds % 60;
    if (m > 0) return '$m:${s.toString().padLeft(2, '0')}';
    return '${s}s';
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.92),
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // コンパクト表示行
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  // タイマー
                  Icon(Icons.timer, size: 16, color: _timerColor),
                  const SizedBox(width: 4),
                  Text(
                    _timerLabel,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _timerColor,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // 区切り
                  Container(
                    width: 1,
                    height: 16,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.2),
                  ),
                  const SizedBox(width: 12),
                  // ヒントボタン
                  GestureDetector(
                    onTap: widget.hintUsed ? null : widget.onHintTap,
                    child: Row(
                      children: [
                        Icon(
                          Icons.lightbulb,
                          size: 16,
                          color: widget.hintUsed
                              ? Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withValues(alpha: 0.3)
                              : Colors.amber,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'ヒント',
                          style: TextStyle(
                            fontSize: 13,
                            color: widget.hintUsed
                                ? Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withValues(alpha: 0.3)
                                : Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // お題 (展開ボタン)
                  GestureDetector(
                    onTap: () => setState(() => _expanded = !_expanded),
                    child: Row(
                      children: [
                        const Icon(Icons.assignment, size: 16),
                        const SizedBox(width: 4),
                        const Text('お題', style: TextStyle(fontSize: 13)),
                        Icon(
                          _expanded
                              ? Icons.expand_less
                              : Icons.expand_more,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // 展開時のミッション詳細
            if (_expanded)
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.1),
                    ),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
                child: Row(
                  children: [
                    const Icon(Icons.flag, size: 14),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.missionText,
                        style: const TextStyle(fontSize: 13, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
