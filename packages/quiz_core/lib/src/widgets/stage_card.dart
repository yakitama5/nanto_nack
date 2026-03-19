import 'package:flutter/material.dart';
import 'package:quiz_core/src/theme/app_colors.dart';

enum StageStatus { cleared, available, locked }

/// ステージカードウィジェット
class StageCard extends StatelessWidget {
  const StageCard({
    super.key,
    required this.stageNumber,
    required this.title,
    required this.status,
    this.onTap,
    this.clearTimeMs,
    this.score,
  });

  final int stageNumber;
  final String title;
  final StageStatus status;
  final VoidCallback? onTap;

  /// クリアタイム (ミリ秒)。クリア済みの場合に表示する
  final int? clearTimeMs;

  /// スコア。クリア済みの場合に表示する
  final int? score;

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      StageStatus.cleared => AppColors.cleared,
      StageStatus.available => AppColors.available,
      StageStatus.locked => AppColors.locked,
    };

    final icon = switch (status) {
      StageStatus.cleared => Icons.check_circle,
      StageStatus.available => Icons.play_circle_filled,
      StageStatus.locked => Icons.lock,
    };

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: status != StageStatus.locked ? onTap : null,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withValues(alpha: 0.2),
                child: Text(
                  '$stageNumber',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    if (status == StageStatus.cleared) ...[
                      const SizedBox(height: 4),
                      _ClearInfo(clearTimeMs: clearTimeMs, score: score),
                    ],
                  ],
                ),
              ),
              Icon(icon, color: color),
            ],
          ),
        ),
      ),
    );
  }
}

/// クリア済みステージのタイム・スコア表示
class _ClearInfo extends StatelessWidget {
  const _ClearInfo({this.clearTimeMs, this.score});

  final int? clearTimeMs;
  final int? score;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context)
              .colorScheme
              .onSurface
              .withValues(alpha: 0.6),
        );

    return Row(
      children: [
        if (clearTimeMs != null) ...[
          Icon(
            Icons.timer,
            size: 12,
            color: style?.color,
          ),
          const SizedBox(width: 2),
          Text(
            '${(clearTimeMs! / 1000).toStringAsFixed(1)}秒',
            style: style,
          ),
        ],
        if (clearTimeMs != null && score != null) const SizedBox(width: 8),
        if (score != null) ...[
          Icon(
            Icons.star,
            size: 12,
            color: style?.color,
          ),
          const SizedBox(width: 2),
          Text(
            '$score点',
            style: style,
          ),
        ],
      ],
    );
  }
}
