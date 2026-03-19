import 'package:flutter/material.dart';

/// クイズ開始直後に全画面を暗転させて「MISSION」と制限時間を
/// デカデカと表示し、数秒後に消えるカットイン演出ウィジェット
///
/// 使い方:
/// ```dart
/// Stack(
///   children: [
///     // ... 背景の EC アプリ UI ...
///     MissionCutIn(
///       missionText: '水を2つ購入してください',
///       timeLimitSeconds: 60,
///       onFinished: () { /* カットイン終了後の処理 */ },
///     ),
///   ],
/// )
/// ```
class MissionCutIn extends StatefulWidget {
  const MissionCutIn({
    super.key,
    required this.missionText,
    required this.timeLimitSeconds,
    required this.onFinished,
    this.displayDuration = const Duration(milliseconds: 2200),
  });

  /// ミッション説明テキスト
  final String missionText;

  /// 制限時間（秒）
  final int timeLimitSeconds;

  /// カットイン演出が終わったときのコールバック
  final VoidCallback onFinished;

  /// 表示時間（デフォルト 2.2 秒）
  final Duration displayDuration;

  @override
  State<MissionCutIn> createState() => _MissionCutInState();
}

class _MissionCutInState extends State<MissionCutIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  // フェードイン → 保持 → フェードアウト のシーケンス
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.displayDuration,
    );

    // 前 20% でフェードイン、後 20% でフェードアウト
    _opacity = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 20),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 60),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 20),
    ]).animate(_controller);

    _controller.forward().then((_) {
      if (mounted) widget.onFinished();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacity,
      builder: (context, _) {
        if (_opacity.value == 0) return const SizedBox.shrink();

        return Opacity(
          opacity: _opacity.value,
          child: Container(
            color: Colors.black.withValues(alpha: 0.85),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'MISSION',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 8,
                      shadows: [
                        Shadow(
                          color: Theme.of(context).colorScheme.primary,
                          blurRadius: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white30),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      widget.missionText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '制限時間: ${widget.timeLimitSeconds}秒',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
