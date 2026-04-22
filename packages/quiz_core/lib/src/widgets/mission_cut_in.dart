import 'package:flutter/material.dart';
import 'package:quiz_core/i18n/strings.g.dart';
import 'unreadable_text.dart';

/// クイズ開始直後に全画面を暗転させてミッションを大きく表示し、
/// 円形バブルへ縮小するアニメーションで消えるカットイン演出ウィジェット。
///
/// アニメーションのフェーズ:
/// - Phase 1 (0〜18%): フェードイン（全画面お題表示）
/// - Phase 2 (18〜68%): 全画面表示を維持
/// - Phase 3 (68〜100%): 右上方向へ縮小しながらフェードアウト
///   → プレイヤーが「お題は右上の円形バブルで確認できる」と直感的に理解できる。
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
    this.displayDuration = const Duration(milliseconds: 3000),
    this.bubbleOffset,
    this.isObfuscated = false,
  });

  /// ミッション説明テキスト
  final String missionText;

  /// 制限時間（秒）
  final int timeLimitSeconds;

  /// カットイン演出が終わったときのコールバック
  final VoidCallback onFinished;

  /// 表示時間（デフォルト 3.0 秒）
  final Duration displayDuration;

  /// 縮小先バブルの左上座標（省略時はスクリーンサイズから自動計算）
  final Offset? bubbleOffset;

  /// true のときミッションテキストを [UnreadableText] で難読化して表示する
  final bool isObfuscated;

  @override
  State<MissionCutIn> createState() => _MissionCutInState();
}

class _MissionCutInState extends State<MissionCutIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  // フェードイン → 保持 → 縮小フェードアウト
  // translateX/Y はスクリーンサイズ依存のため build() で動的計算する
  late final Animation<double> _opacity;
  late final Animation<double> _scale;
  late final Animation<double> _borderRadius;

  /// バブルサイズ（FloatingMissionBubble と同じ値）
  static const double _bubbleSize = 72.0;

  /// Phase3 開始地点（0.0〜1.0）
  static const double _phase3Start = 0.68;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.displayDuration,
    );

    // Phase1 (0-18%): フェードイン
    // Phase2 (18-68%): 全画面保持
    // Phase3 (68-100%): 縮小・フェードアウト
    _opacity = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.0)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 18,
      ),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 50),
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 0.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 32,
      ),
    ]).animate(_controller);

    // Phase3 で中心から縮小
    _scale = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 68),
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 0.08)
            .chain(CurveTween(curve: Curves.easeInCubic)),
        weight: 32,
      ),
    ]).animate(_controller);

    // Phase3 で角丸を大きくして円形に近づける
    _borderRadius = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween(0.0), weight: 68),
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 200.0),
        weight: 32,
      ),
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
      animation: _controller,
      builder: (context, _) {
        if (_opacity.value == 0 && _controller.isCompleted) {
          return const SizedBox.shrink();
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final screenW = constraints.maxWidth;
            final screenH = constraints.maxHeight;
            final padding = MediaQuery.paddingOf(context);

            // バブルの左上座標（FloatingMissionBubble のデフォルト位置と一致）
            final bubbleLeft = widget.bubbleOffset?.dx ??
                (screenW - _bubbleSize - 16);
            final bubbleTop = widget.bubbleOffset?.dy ??
                (padding.top + kToolbarHeight + 8);

            // バブル中心 → 画面中心 の差分 = 縮小先への移動量
            final targetDx = (bubbleLeft + _bubbleSize / 2) - screenW / 2;
            final targetDy = (bubbleTop + _bubbleSize / 2) - screenH / 2;

            // Phase3 (68-100%) の進捗 [0, 1]
            final phase3Raw = ((_controller.value - _phase3Start) /
                    (1.0 - _phase3Start))
                .clamp(0.0, 1.0);
            final phase3 = Curves.easeInCubic.transform(phase3Raw);

            return Opacity(
              opacity: _opacity.value.clamp(0.0, 1.0),
              child: Transform.translate(
                offset: Offset(targetDx * phase3, targetDy * phase3),
                child: Transform.scale(
                  scale: _scale.value,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(_borderRadius.value),
                    // Material でラップし Text の黄色いデフォルト装飾を防ぐ
                    child: Material(
                      type: MaterialType.transparency,
                      child: Container(
                        color: Colors.black.withValues(alpha: 0.85),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                context.t.mission.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 48,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 8,
                                  decoration: TextDecoration.none,
                                  shadows: [
                                    Shadow(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary,
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                ),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white30),
                                  borderRadius:
                                      BorderRadius.circular(12),
                                ),
                                child: widget.isObfuscated
                                    ? UnreadableText(
                                        widget.missionText,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          height: 1.5,
                                          decoration: TextDecoration.none,
                                        ),
                                      )
                                    : Text(
                                        widget.missionText,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          height: 1.5,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                context.t.mission.timeLimit.replaceAll(
                                  '{seconds}',
                                  widget.timeLimitSeconds.toString(),
                                ),
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
