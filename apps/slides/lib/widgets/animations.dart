import 'dart:math' as math;

import 'package:flutter/material.dart';

/// スライド全体で使うループアニメーションの部品。
///
/// **投影で見て楽しい**ことが目的なので、動きは常に緩やかにする。
/// 速い動きや大きな移動は、聞き手の視線を本文から奪って逆効果になる。
///
/// いずれも `repeat()` で回り続ける。プレビューテストで
/// `pumpAndSettle()` を使うと**永久に落ち着かず失敗する**ため、
/// テスト側は `pump(duration)` で任意のコマを切り出すこと。
abstract final class _Loop {
  /// 息づかいのような往復。0→1→0 を繰り返す。
  static Animation<double> breathe(AnimationController c) =>
      CurvedAnimation(parent: c, curve: Curves.easeInOut);
}

/// ゆっくり上下に漂う。マスコットなど「浮いているもの」に使う。
class FloatLoop extends StatefulWidget {
  const FloatLoop({
    super.key,
    required this.child,
    this.distance = 14,
    this.duration = const Duration(seconds: 3),
    this.delay = Duration.zero,
  });

  final Widget child;

  /// 上下の振れ幅（px）
  final double distance;
  final Duration duration;

  /// 複数並べたときに動きをずらすための位相差
  final Duration delay;

  @override
  State<FloatLoop> createState() => _FloatLoopState();
}

class _FloatLoopState extends State<FloatLoop>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: widget.duration,
  );

  @override
  void initState() {
    super.initState();
    // 位相をずらすため、開始位置を delay の分だけ進めておく。
    // Future.delayed だとテストで待ち時間が読めなくなるので使わない。
    final phase = widget.duration.inMilliseconds == 0
        ? 0.0
        : (widget.delay.inMilliseconds / widget.duration.inMilliseconds) % 1.0;
    _c.value = phase;
    _c.repeat(reverse: true);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = _Loop.breathe(_c);
    return AnimatedBuilder(
      animation: t,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, -widget.distance * t.value),
        child: child,
      ),
      child: widget.child,
    );
  }
}

/// ゆっくり拡大縮小する。強調したい一語や、注目させたい印に使う。
class PulseLoop extends StatefulWidget {
  const PulseLoop({
    super.key,
    required this.child,
    this.minScale = 1,
    this.maxScale = 1.06,
    this.duration = const Duration(milliseconds: 1800),
    this.delay = Duration.zero,
  });

  final Widget child;
  final double minScale;
  final double maxScale;
  final Duration duration;
  final Duration delay;

  @override
  State<PulseLoop> createState() => _PulseLoopState();
}

class _PulseLoopState extends State<PulseLoop>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: widget.duration,
  );

  @override
  void initState() {
    super.initState();
    final phase = widget.duration.inMilliseconds == 0
        ? 0.0
        : (widget.delay.inMilliseconds / widget.duration.inMilliseconds) % 1.0;
    _c.value = phase;
    _c.repeat(reverse: true);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = _Loop.breathe(_c);
    return AnimatedBuilder(
      animation: t,
      builder: (context, child) => Transform.scale(
        scale: widget.minScale +
            (widget.maxScale - widget.minScale) * t.value,
        child: child,
      ),
      child: widget.child,
    );
  }
}

/// 背後でゆっくり呼吸する光。コンセプトの一語など、山場の後ろに敷く。
///
/// 光は**子の大きさに合わせて**広がる。固定サイズの円にすると、
/// 文字が左寄せのときに位置がずれて「置き忘れた丸」に見えてしまう。
/// 縁をぼかすため単色ではなく [RadialGradient] を使う。
class GlowLoop extends StatefulWidget {
  const GlowLoop({
    super.key,
    required this.child,
    required this.color,
    this.duration = const Duration(seconds: 4),
  });

  final Widget child;
  final Color color;
  final Duration duration;

  @override
  State<GlowLoop> createState() => _GlowLoopState();
}

class _GlowLoopState extends State<GlowLoop>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: widget.duration,
  )..repeat(reverse: true);

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = _Loop.breathe(_c);
    return AnimatedBuilder(
      animation: t,
      builder: (context, child) => Stack(
        alignment: Alignment.center,
        children: [
          // Positioned.fill で子と同じ箱を取り、そこから外へ広げる
          Positioned.fill(
            child: Transform.scale(
              scaleX: 1.3 + 0.12 * t.value,
              scaleY: 2.4 + 0.3 * t.value,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      widget.color.withValues(alpha: 0.28 - 0.10 * t.value),
                      widget.color.withValues(alpha: 0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          child!,
        ],
      ),
      child: widget.child,
    );
  }
}

/// 手がかりを囲む輪が、外へ向かって静かに波打つ。
///
/// 楕円そのものは動かさず、**外側に同じ形の輪を広げて消す**。
/// 対象の位置がぶれないので、何を指しているかが分からなくならない。
class RippleLoop extends StatefulWidget {
  const RippleLoop({
    super.key,
    required this.color,
    required this.borderRadius,
    this.duration = const Duration(milliseconds: 2200),
  });

  final Color color;
  final BorderRadius borderRadius;
  final Duration duration;

  @override
  State<RippleLoop> createState() => _RippleLoopState();
}

class _RippleLoopState extends State<RippleLoop>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: widget.duration,
  )..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (context, _) {
        final t = Curves.easeOut.transform(_c.value);
        return Transform.scale(
          scale: 1 + 0.22 * t,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: widget.borderRadius,
              border: Border.all(
                color: widget.color.withValues(alpha: math.max(0, 1 - t) * 0.7),
                width: 3,
              ),
            ),
          ),
        );
      },
    );
  }
}
