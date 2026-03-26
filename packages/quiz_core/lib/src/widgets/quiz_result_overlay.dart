import 'package:flutter/material.dart';
import 'package:quiz_core/src/entities/quiz_state.dart';
import 'package:quiz_core/src/theme/app_colors.dart';

/// クイズ結果表示オーバーレイ
class QuizResultOverlay extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final isSuccess =
        status == QuizStatus.correct || status == QuizStatus.completed;

    return ColoredBox(
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
                    isSuccess ? Icons.check_circle : Icons.cancel,
                    size: 64,
                    color: isSuccess ? AppColors.cleared : AppColors.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isSuccess ? '正解！' : '不正解',
                    style:
                        Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: isSuccess
                                  ? AppColors.cleared
                                  : AppColors.error,
                            ),
                  ),
                  if (isSuccess) ...[
                    const SizedBox(height: 8),
                    Text(
                      'スコア: $score点',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'タイム: ${(elapsedMs / 1000).toStringAsFixed(1)}秒',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: onRetry,
                        child: const Text('もう一度'),
                      ),
                      if (onNext != null) ...[
                        const SizedBox(width: 16),
                        FilledButton(
                          onPressed: onNext,
                          child: const Text('次へ'),
                        ),
                      ],
                    ],
                  ),
                  if (isSuccess && insight != null) ...[
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 8),
                    insight!,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
