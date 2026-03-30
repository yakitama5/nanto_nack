import 'package:flutter/material.dart';
import 'package:quiz_core/src/theme/app_colors.dart';

enum StageStatus { cleared, available, locked }

/// グリッド表示用ステージカードウィジェット
class StageCard extends StatelessWidget {
  const StageCard({
    super.key,
    required this.stageNumber,
    required this.title,
    required this.status,
    required this.difficulty,
    this.onTap,
    this.clearTimeMs,
    this.score,
  });

  final int stageNumber;
  final String title;
  final StageStatus status;

  /// 難易度 (1〜5)。カレーアイコンの数で表現する。
  final int difficulty;

  final VoidCallback? onTap;

  /// クリアタイム (ミリ秒)。クリア済みの場合に表示する
  final int? clearTimeMs;

  /// スコア。クリア済みの場合に表示する
  final int? score;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isLocked = status == StageStatus.locked;
    final isCleared = status == StageStatus.cleared;

    final statusColor = switch (status) {
      StageStatus.cleared => AppColors.cleared,
      StageStatus.available => AppColors.available,
      StageStatus.locked => AppColors.locked,
    };

    final statusIcon = switch (status) {
      StageStatus.cleared => Icons.check_circle,
      StageStatus.available => Icons.play_circle_filled,
      StageStatus.locked => Icons.lock,
    };

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: isLocked ? 0 : 2,
      color: isLocked ? colorScheme.surfaceContainerHighest : colorScheme.surface,
      child: InkWell(
        onTap: isLocked ? null : onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ステージ番号とステータスアイコン
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '$stageNumber',
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  Icon(statusIcon, color: statusColor, size: 20),
                ],
              ),
              const SizedBox(height: 10),
              // 難易度（カレーアイコン）
              _DifficultyIndicator(difficulty: difficulty, isLocked: isLocked),
              const SizedBox(height: 8),
              // タイトル
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isLocked
                            ? colorScheme.onSurface.withValues(alpha: 0.4)
                            : colorScheme.onSurface,
                      ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // クリア情報
              if (isCleared && (clearTimeMs != null || score != null)) ...[
                const SizedBox(height: 6),
                _ClearInfo(clearTimeMs: clearTimeMs, score: score),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// 難易度をカレーアイコンの数で表現するウィジェット
class _DifficultyIndicator extends StatelessWidget {
  const _DifficultyIndicator({
    required this.difficulty,
    required this.isLocked,
  });

  final int difficulty;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (i) {
        final isActive = i < difficulty;
        return Opacity(
          opacity: isLocked ? 0.3 : (isActive ? 1.0 : 0.2),
          child: const Text(
            '🍛',
            style: TextStyle(fontSize: 13),
          ),
        );
      }),
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
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
        );

    return Row(
      children: [
        if (clearTimeMs != null) ...[
          Icon(Icons.timer, size: 12, color: style?.color),
          const SizedBox(width: 2),
          Text(
            '${(clearTimeMs! / 1000).toStringAsFixed(1)}秒',
            style: style,
          ),
        ],
        if (clearTimeMs != null && score != null) const SizedBox(width: 8),
        if (score != null) ...[
          Icon(Icons.star, size: 12, color: style?.color),
          const SizedBox(width: 2),
          Text('$score点', style: style),
        ],
      ],
    );
  }
}
