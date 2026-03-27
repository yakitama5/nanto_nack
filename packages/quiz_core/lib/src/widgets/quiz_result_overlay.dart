import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_core/src/entities/quiz_state.dart';
import 'package:quiz_core/src/theme/app_colors.dart';

/// クイズ結果表示オーバーレイ
///
/// 正解時:
///   1. [rippleOrigin] を起点に3色の波紋が画面全体へ広がる
///   2. 暗い背景が波紋に乗って出現
///   3. リザルトカードがスケール+フェードで登場
///   4. カード内の要素が順次 Fade+Slide で表示
///
/// 不正解・時間切れ時: シンプルなフェードイン
class QuizResultOverlay extends StatefulWidget {
  const QuizResultOverlay({
    super.key,
    required this.status,
    required this.score,
    required this.elapsedMs,
    required this.onRetry,
    required this.onNext,
    this.insight,
    this.rippleOrigin,
  });

  final QuizStatus status;
  final int score;
  final int elapsedMs;
  final VoidCallback onRetry;
  final VoidCallback? onNext;

  /// 正解時のみ表示する解説ウィジェット（クイズごとに差し込む）
  final Widget? insight;

  /// 波紋の発生起点。null の場合は画面中央を使用。
  final Offset? rippleOrigin;

  @override
  State<QuizResultOverlay> createState() => _QuizResultOverlayState();
}

class _QuizResultOverlayState extends State<QuizResultOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  // 波紋リング（正解時のみ使用）
  late final Animation<double> _ring1;
  late final Animation<double> _ring2;
  late final Animation<double> _ring3;

  // 暗い背景オーバーレイ
  late final Animation<double> _bg;

  // カード登場
  late final Animation<double> _cardScale;
  late final Animation<double> _cardOpacity;

  // コンテンツ要素（5スロット: icon / title / score / buttons / insight）
  late final List<Animation<double>> _contentAnims;

  bool get _isSuccess =>
      widget.status == QuizStatus.correct ||
      widget.status == QuizStatus.completed;

  @override
  void initState() {
    super.initState();

    if (_isSuccess) {
      // ── 正解アニメーション（総時間 1800ms）──────────────────────────
      _ctrl = AnimationController(
        duration: const Duration(milliseconds: 1800),
        vsync: this,
      );

      // 3本の波紋リング（時間差スタート）
      _ring1 = CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.00, 0.45, curve: Curves.easeOut),
      );
      _ring2 = CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.10, 0.55, curve: Curves.easeOut),
      );
      _ring3 = CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.20, 0.65, curve: Curves.easeOut),
      );

      // 暗い背景（波紋の中盤から登場）
      _bg = CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.30, 0.65, curve: Curves.easeIn),
      );

      // カード（波紋が広がりきったあとに登場）
      _cardScale = CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.58, 0.82, curve: Curves.easeOutCubic),
      );
      _cardOpacity = CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.58, 0.72, curve: Curves.easeIn),
      );

      // コンテンツ要素を順次表示（各要素 0.06 ずつ遅延）
      _contentAnims = List.generate(5, (i) {
        final start = 0.70 + i * 0.06;
        final end = (start + 0.14).clamp(0.0, 1.0);
        return CurvedAnimation(
          parent: _ctrl,
          curve: Interval(start, end, curve: Curves.easeOut),
        );
      });

      // 触覚フィードバック（小刻みな振動）
      _triggerSuccessHaptics();
    } else {
      // ── 不正解・時間切れ: シンプルなフェードイン（総時間 650ms）──
      _ctrl = AnimationController(
        duration: const Duration(milliseconds: 650),
        vsync: this,
      );

      // 波紋なし
      _ring1 = const AlwaysStoppedAnimation<double>(0);
      _ring2 = const AlwaysStoppedAnimation<double>(0);
      _ring3 = const AlwaysStoppedAnimation<double>(0);

      _bg = CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      );
      _cardScale = CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.30, 0.80, curve: Curves.easeOutCubic),
      );
      _cardOpacity = CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.30, 0.55, curve: Curves.easeIn),
      );

      _contentAnims = List.generate(5, (i) {
        final start = 0.55 + i * 0.09;
        final end = (start + 0.18).clamp(0.0, 1.0);
        return CurvedAnimation(
          parent: _ctrl,
          curve: Interval(start, end, curve: Curves.easeOut),
        );
      });
    }

    _ctrl.forward();
  }

  /// 短い小刻みな振動 → 最後にひと押し
  Future<void> _triggerSuccessHaptics() async {
    HapticFeedback.lightImpact();
    await Future<void>.delayed(const Duration(milliseconds: 100));
    if (!mounted) return;
    HapticFeedback.lightImpact();
    await Future<void>.delayed(const Duration(milliseconds: 100));
    if (!mounted) return;
    HapticFeedback.lightImpact();
    await Future<void>.delayed(const Duration(milliseconds: 200));
    if (!mounted) return;
    HapticFeedback.mediumImpact();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final origin = widget.rippleOrigin ??
        Offset(screenSize.width / 2, screenSize.height / 2);

    return AnimatedBuilder(
      animation: _ctrl,
      builder: (context, _) => Stack(
        children: [
          // ── 波紋 + 暗い背景（CustomPainter）───────────────────────
          Positioned.fill(
            child: CustomPaint(
              painter: _RipplePainter(
                ring1: _ring1.value,
                ring2: _ring2.value,
                ring3: _ring3.value,
                bgOpacity: _bg.value,
                origin: origin,
              ),
            ),
          ),
          // ── リザルトカード ──────────────────────────────────────────
          Positioned.fill(
            child: Center(
              child: Opacity(
                opacity: _cardOpacity.value,
                child: Transform.scale(
                  scale: 0.7 + 0.3 * _cardScale.value,
                  child: _buildCard(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(32),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // [0] アイコン
              _FadeSlide(
                progress: _contentAnims[0].value,
                child: Icon(
                  _isSuccess ? Icons.check_circle : Icons.cancel,
                  size: 64,
                  color: _isSuccess ? AppColors.cleared : AppColors.error,
                ),
              ),
              const SizedBox(height: 16),
              // [1] タイトル
              _FadeSlide(
                progress: _contentAnims[1].value,
                child: Text(
                  _isSuccess ? '正解！' : '不正解',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: _isSuccess ? AppColors.cleared : AppColors.error,
                      ),
                ),
              ),
              // [2] スコア・タイム（正解時のみ）
              if (_isSuccess) ...[
                const SizedBox(height: 8),
                _FadeSlide(
                  progress: _contentAnims[2].value,
                  child: Column(
                    children: [
                      Text(
                        'スコア: ${widget.score}点',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'タイム: ${(widget.elapsedMs / 1000).toStringAsFixed(1)}秒',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 24),
              // [3] ボタン
              _FadeSlide(
                progress: _contentAnims[3].value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: widget.onRetry,
                      child: const Text('もう一度'),
                    ),
                    if (widget.onNext != null) ...[
                      const SizedBox(width: 16),
                      FilledButton(
                        onPressed: widget.onNext,
                        child: const Text('次へ'),
                      ),
                    ],
                  ],
                ),
              ),
              // [4] インサイト（正解時のみ）
              if (_isSuccess && widget.insight != null) ...[
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 8),
                _FadeSlide(
                  progress: _contentAnims[4].value,
                  child: widget.insight!,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Fade + Slide アニメーション要素 ──────────────────────────────────────

class _FadeSlide extends StatelessWidget {
  const _FadeSlide({required this.progress, required this.child});

  final double progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: progress.clamp(0.0, 1.0),
      child: Transform.translate(
        offset: Offset(0, 20 * (1 - progress)),
        child: child,
      ),
    );
  }
}

// ─── 波紋 CustomPainter ────────────────────────────────────────────────────

/// 画面全体に広がる3色の波紋と暗い背景を描画する。
class _RipplePainter extends CustomPainter {
  _RipplePainter({
    required this.ring1,
    required this.ring2,
    required this.ring3,
    required this.bgOpacity,
    required this.origin,
  });

  final double ring1;
  final double ring2;
  final double ring3;
  final double bgOpacity;
  final Offset origin;

  /// テーマカラー3色（紫・オレンジ・緑）
  static const _ringColors = [
    AppColors.primary, // 紫
    Color(0xFFFF9900), // オレンジ（Shopping テーマ色）
    AppColors.cleared, // 緑
  ];

  @override
  void paint(Canvas canvas, Size size) {
    // 1. 暗い背景オーバーレイ
    if (bgOpacity > 0) {
      canvas.drawRect(
        Offset.zero & size,
        Paint()..color = Colors.black.withValues(alpha: bgOpacity * 0.72),
      );
    }

    // 2. 波紋リング（奥から順に描画: 緑 → オレンジ → 紫）
    final maxR = _maxRadius(size);
    _drawRing(canvas, maxR, ring3, _ringColors[2]); // 緑（最奥）
    _drawRing(canvas, maxR, ring2, _ringColors[1]); // オレンジ
    _drawRing(canvas, maxR, ring1, _ringColors[0]); // 紫（最前）
  }

  /// [origin] から画面の四隅への距離のうち最大値を返す。
  double _maxRadius(Size size) {
    var maxD = 0.0;
    for (final corner in [
      Offset.zero,
      Offset(size.width, 0),
      Offset(0, size.height),
      Offset(size.width, size.height),
    ]) {
      final d = (origin - corner).distance;
      if (d > maxD) maxD = d;
    }
    return maxD;
  }

  /// 進捗 [t] に応じて拡大・フェードアウトするリングを描画する。
  void _drawRing(Canvas canvas, double maxR, double t, Color color) {
    if (t <= 0) return;
    canvas.drawCircle(
      origin,
      maxR * t,
      Paint()
        ..color = color.withValues(alpha: ((1 - t) * 0.65).clamp(0, 1))
        ..style = PaintingStyle.stroke
        // リングは拡大するにつれ細くなる
        ..strokeWidth = (80 * (1 - t * 0.75)).clamp(0.0, 80.0),
    );
  }

  @override
  bool shouldRepaint(_RipplePainter old) =>
      old.ring1 != ring1 ||
      old.ring2 != ring2 ||
      old.ring3 != ring3 ||
      old.bgOpacity != bgOpacity;
}
