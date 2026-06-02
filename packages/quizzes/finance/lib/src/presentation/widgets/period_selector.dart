import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../domain/chart_period.dart';
import '../../domain/finance_quiz_type.dart';
import '../../i18n/finance_translations_extension.dart';
import '../stock_app_quiz_notifier.dart';

class PeriodSelector extends ConsumerWidget {
  const PeriodSelector({super.key, required this.quizType});

  final FinanceQuizType quizType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ext = Theme.of(context).extension<FinanceAppTheme>()!;
    final selectedPeriod = ref.watch(
      stockAppQuizProvider(quizType).select((s) => s.selectedPeriod),
    );
    final notifier = ref.read(stockAppQuizProvider(quizType).notifier);
    final sq = context.sq;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ChartPeriod.values.map((period) {
        final label = switch (period) {
          ChartPeriod.oneDay => sq.common.periodOneDay,
          ChartPeriod.oneWeek => sq.common.periodOneWeek,
          ChartPeriod.oneMonth => sq.common.periodOneMonth,
          ChartPeriod.oneYear => sq.common.periodOneYear,
        };
        final isSelected = selectedPeriod == period;
        return _PeriodChip(
          label: label,
          isSelected: isSelected,
          onTap: () => notifier.changePeriod(period),
          ext: ext,
        );
      }).toList(),
    );
  }
}

class _PeriodChip extends StatelessWidget {
  const _PeriodChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.ext,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final FinanceAppTheme ext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? ext.chipSelectedBackground
              : ext.chipUnselectedBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? ext.chipSelectedTextColor
                : ext.chipUnselectedTextColor,
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
