import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../domain/chart_data_point.dart';
import '../../domain/finance_quiz_config.dart';
import '../../domain/finance_quiz_type.dart';
import '../stock_app_quiz_notifier.dart';

class InteractiveChartArea extends ConsumerStatefulWidget {
  const InteractiveChartArea({
    super.key,
    required this.quizType,
    required this.transformationController,
  });

  final FinanceQuizType quizType;
  final TransformationController transformationController;

  @override
  ConsumerState<InteractiveChartArea> createState() =>
      _InteractiveChartAreaState();
}

class _InteractiveChartAreaState extends ConsumerState<InteractiveChartArea> {
  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<FinanceAppTheme>()!;
    final chartData = ref.watch(
      stockAppQuizProvider(widget.quizType).select((s) => s.chartData),
    );
    final notifier =
        ref.read(stockAppQuizProvider(widget.quizType).notifier);

    return LayoutBuilder(
      builder: (context, constraints) {
        final chartWidth =
            constraints.maxWidth * FinanceQuizConfig.chartWidthMultiplier;
        final chartHeight = constraints.maxHeight;

        return ClipRect(
          child: InteractiveViewer(
            transformationController: widget.transformationController,
            boundaryMargin: const EdgeInsets.all(double.infinity),
            constrained: false,
            minScale: 0.3,
            maxScale: 5.0,
            panEnabled: true,
            scaleEnabled: true,
            onInteractionUpdate: (_) {
              final m = widget.transformationController.value;
              final scale = m.getMaxScaleOnAxis();
              final translation = m.getTranslation();
              notifier.updateInteraction(
                scale,
                Offset(translation.x, translation.y),
              );
            },
            child: SizedBox(
              width: chartWidth,
              height: chartHeight,
              // quiz3のみfl_chartのタッチを有効化する
              // それ以外はfl_chartのGestureDetectorを無効化して
              // InteractiveViewerのパン/ズームを優先させる
              child: IgnorePointer(
                ignoring: widget.quizType != FinanceQuizType.quiz3,
                child: _FinanceLineChart(
                  chartData: chartData,
                  ext: ext,
                  notifier: notifier,
                  isQuiz3: widget.quizType == FinanceQuizType.quiz3,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _FinanceLineChart extends StatefulWidget {
  const _FinanceLineChart({
    required this.chartData,
    required this.ext,
    required this.notifier,
    required this.isQuiz3,
  });

  final List<ChartDataPoint> chartData;
  final FinanceAppTheme ext;
  final StockAppQuizNotifier notifier;
  final bool isQuiz3;

  @override
  State<_FinanceLineChart> createState() => _FinanceLineChartState();
}

class _FinanceLineChartState extends State<_FinanceLineChart> {
  int? _touchedSpotIndex;

  @override
  void didUpdateWidget(_FinanceLineChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.chartData != widget.chartData) {
      _touchedSpotIndex = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final spots = widget.chartData.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.price);
    }).toList();

    final prices = widget.chartData.map((d) => d.price);
    final maxPrice = prices.reduce((a, b) => a > b ? a : b);
    final minPrice = prices.reduce((a, b) => a < b ? a : b);
    final range = maxPrice - minPrice;
    final ext = widget.ext;
    final chartMinY = minPrice - range * 0.05;
    final chartMaxY = maxPrice + range * 0.15;

    final barData = LineChartBarData(
      spots: spots,
      isCurved: true,
      color: ext.chartLineColor,
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors: [
            ext.chartLineColor.withValues(alpha: 0.3),
            ext.chartLineColor.withValues(alpha: 0.0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final chartHeight = constraints.maxHeight;

        return LineChart(
          LineChartData(
            maxY: chartMaxY,
            minY: chartMinY,
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              drawHorizontalLine: true,
              getDrawingHorizontalLine: (_) => FlLine(
                color: ext.chartGridColor,
                strokeWidth: 0.5,
              ),
              getDrawingVerticalLine: (_) => FlLine(
                color: ext.chartGridColor,
                strokeWidth: 0.5,
              ),
            ),
            titlesData: const FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            showingTooltipIndicators:
                widget.isQuiz3 && _touchedSpotIndex != null
                    ? [
                        ShowingTooltipIndicators([
                          LineBarSpot(barData, 0, spots[_touchedSpotIndex!]),
                        ]),
                      ]
                    : [],
            lineBarsData: [barData],
            lineTouchData: LineTouchData(
              enabled: true,
              handleBuiltInTouches: !widget.isQuiz3,
              touchCallback: (event, response) {
                if (!widget.isQuiz3) return;
                final spot = response?.lineBarSpots?.firstOrNull;
                if (event is FlLongPressStart ||
                    event is FlLongPressMoveUpdate) {
                  // fl_chartはX軸の最近傍スポットを返すため、Y方向の距離も確認する
                  int? index;
                  if (spot != null) {
                    final localY = event.localPosition?.dy;
                    if (localY != null) {
                      final spotPixelY = chartHeight *
                          (1 -
                              (spot.y - chartMinY) /
                                  (chartMaxY - chartMinY));
                      if ((localY - spotPixelY).abs() <= 40) {
                        index = spot.spotIndex;
                      }
                    }
                  }
                  setState(() => _touchedSpotIndex = index);
                  widget.notifier.setTouchState(index != null);
                } else if (event is FlLongPressEnd ||
                    event is FlPointerExitEvent) {
                  setState(() => _touchedSpotIndex = null);
                  widget.notifier.setTouchState(false);
                }
              },
              getTouchedSpotIndicator:
                  (barData, spotIndexes) => spotIndexes.map((index) {
                    return TouchedSpotIndicatorData(
                      FlLine(
                        color: ext.crosshairColor,
                        strokeWidth: 1,
                        dashArray: [5, 5],
                      ),
                      FlDotData(
                        getDotPainter: (spot, percent, barData, index) {
                          return FlDotCirclePainter(
                            radius: 5,
                            color: ext.chartLineColor,
                            strokeWidth: 2,
                            strokeColor: ext.scaffoldBackground,
                          );
                        },
                      ),
                    );
                  }).toList(),
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (_) => ext.tooltipBackground,
                getTooltipItems: (touchedSpots) => touchedSpots.map((spot) {
                  return LineTooltipItem(
                    '¥${spot.y.toStringAsFixed(0)}',
                    TextStyle(
                      color: ext.tooltipTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
