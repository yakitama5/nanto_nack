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
  });

  final int stageNumber;
  final String title;
  final StageStatus status;
  final VoidCallback? onTap;

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
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
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
