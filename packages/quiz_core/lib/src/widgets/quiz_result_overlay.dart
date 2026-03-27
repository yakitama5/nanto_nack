import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:quiz_core/src/entities/quiz_state.dart';
import 'package:quiz_core/src/theme/app_colors.dart';

/// クイズ結果表示オーバーレイ
class QuizResultOverlay extends StatefulWidget {
  const QuizResultOverlay({
    super.key,
    required this.status,
    required this.score,
    required this.elapsedMs,
    required this.onRetry,
    required this.onNext,
    this.insight,
  });

  final QuizStatus status;
  final int score;
  final int elapsedMs;
  final VoidCallback onRetry;
  final VoidCallback? onNext;

  /// 正解時のみ表示する解説ウィジェット（クイズごとに差し込む）
  final Widget? insight;

  @override
  State<QuizResultOverlay> createState() => _QuizResultOverlayState();
}

class _QuizResultOverlayState extends State<QuizResultOverlay> {
  late final ConfettiController _leftController;
  late final ConfettiController _rightController;

  bool get _isSuccess =>
      widget.status == QuizStatus.correct ||
      widget.status == QuizStatus.completed;

  static const _confettiColors = [
    Color(0xFF4CAF50),
    Color(0xFF2196F3),
    Color(0xFFFF9800),
    Color(0xFFE91E63),
    Color(0xFF9C27B0),
    Color(0xFFFFEB3B),
    Color(0xFF00BCD4),
  ];

  @override
  void initState() {
    super.initState();
    _leftController = ConfettiController(
      duration: const Duration(seconds: 4),
    );
    _rightController = ConfettiController(
      duration: const Duration(seconds: 4),
    );
    if (_isSuccess) {
      _leftController.play();
      _rightController.play();
    }
  }

  @override
  void dispose() {
    _leftController.dispose();
    _rightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ── 半透明背景 + 結果カード ─────────────────────────────────
        Positioned.fill(
          child: ColoredBox(
            color: Colors.black54,
            child: Center(
              child: Card(
                margin: const EdgeInsets.all(32),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _isSuccess ? Icons.check_circle : Icons.cancel,
                          size: 64,
                          color: _isSuccess
                              ? AppColors.cleared
                              : AppColors.error,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _isSuccess ? '正解！' : '不正解',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: _isSuccess
                                    ? AppColors.cleared
                                    : AppColors.error,
                              ),
                        ),
                        if (_isSuccess) ...[
                          const SizedBox(height: 8),
                          Text(
                            'スコア: ${widget.score}点',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            'タイム: ${(widget.elapsedMs / 1000).toStringAsFixed(1)}秒',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                        const SizedBox(height: 24),
                        Row(
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
                        if (_isSuccess && widget.insight != null) ...[
                          const SizedBox(height: 24),
                          const Divider(),
                          const SizedBox(height: 8),
                          widget.insight!,
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // ── 花吹雪（正解時のみ） ─────────────────────────────────────
        if (_isSuccess) ...[
          // 左側から右上へ発射
          Align(
            alignment: Alignment.centerLeft,
            child: ConfettiWidget(
              confettiController: _leftController,
              blastDirectionality: BlastDirectionality.directional,
              blastDirection: -pi / 5,
              particleDrag: 0.05,
              emissionFrequency: 0.06,
              numberOfParticles: 18,
              gravity: 0.15,
              maxBlastForce: 60,
              minBlastForce: 30,
              colors: _confettiColors,
            ),
          ),
          // 右側から左上へ発射
          Align(
            alignment: Alignment.centerRight,
            child: ConfettiWidget(
              confettiController: _rightController,
              blastDirectionality: BlastDirectionality.directional,
              blastDirection: -4 * pi / 5,
              particleDrag: 0.05,
              emissionFrequency: 0.06,
              numberOfParticles: 18,
              gravity: 0.15,
              maxBlastForce: 60,
              minBlastForce: 30,
              colors: _confettiColors,
            ),
          ),
        ],
      ],
    );
  }
}
