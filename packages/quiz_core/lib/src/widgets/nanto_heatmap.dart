import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// プレイ履歴をヒートマップ（草）で可視化するウィジェット
///
/// [activities] は日付と clearCount のマップ。
/// clearCount が多いほど色が濃くなる。
class NantoHeatmap extends StatelessWidget {
  const NantoHeatmap({
    super.key,
    required this.activities,
    this.columns = 10,
  });

  /// 日付 → クリア数 のマップ（過去60日分）
  final List<({DateTime date, int clearCount})> activities;

  /// 横に並べるセルの列数
  final int columns;

  @override
  Widget build(BuildContext context) {
    if (activities.isEmpty) {
      return const SizedBox.shrink();
    }

    final rows = (activities.length / columns).ceil();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(rows, (rowIndex) {
        final start = rowIndex * columns;
        final end = (start + columns).clamp(0, activities.length);
        final rowItems = activities.sublist(start, end);

        return Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            children: rowItems
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: _HeatmapCell(
                      date: item.date,
                      clearCount: item.clearCount,
                    ),
                  ),
                )
                .toList(),
          ),
        );
      }),
    );
  }
}

class _HeatmapCell extends StatelessWidget {
  const _HeatmapCell({
    required this.date,
    required this.clearCount,
  });

  final DateTime date;
  final int clearCount;

  @override
  Widget build(BuildContext context) {
    final color = _colorForCount(clearCount);

    return Tooltip(
      message: '${date.month}/${date.day}: $clearCount クリア',
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  Color _colorForCount(int count) {
    if (count <= 0) return AppColors.locked.withValues(alpha: 0.2);
    if (count == 1) return AppColors.cleared.withValues(alpha: 0.4);
    if (count == 2) return AppColors.cleared.withValues(alpha: 0.65);
    return AppColors.cleared;
  }
}
