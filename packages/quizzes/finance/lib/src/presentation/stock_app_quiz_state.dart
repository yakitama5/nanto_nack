import 'dart:collection';

import 'package:flutter/painting.dart';
import 'package:quiz_core/quiz_core.dart';

import '../domain/chart_data_generator.dart';
import '../domain/chart_data_point.dart';
import '../domain/chart_period.dart';
import '../domain/finance_quiz_config.dart';
import '../domain/finance_quiz_type.dart';

class StockAppQuizState extends QuizStateBase {
  const StockAppQuizState._({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.remainingSeconds,
    required List<ChartDataPoint> chartData,
    required this.selectedPeriod,
    required this.currentScale,
    required this.panOffset,
    required this.isTouchingChart,
  }) : _chartData = chartData;

  final int remainingSeconds;
  final List<ChartDataPoint> _chartData;
  final ChartPeriod selectedPeriod;
  final double currentScale;
  final Offset panOffset;
  final bool isTouchingChart;

  List<ChartDataPoint> get chartData => UnmodifiableListView(_chartData);

  factory StockAppQuizState.initial(FinanceQuizType quizType) {
    return StockAppQuizState._(
      status: QuizStatus.idle,
      failureCount: 0,
      elapsedMs: 0,
      startedAt: null,
      remainingSeconds: FinanceQuizConfig.timeLimitSeconds,
      chartData: ChartDataGenerator.generate(ChartPeriod.oneDay),
      selectedPeriod: ChartPeriod.oneDay,
      currentScale: 1.0,
      panOffset: Offset.zero,
      isTouchingChart: false,
    );
  }

  StockAppQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    int? remainingSeconds,
    List<ChartDataPoint>? chartData,
    ChartPeriod? selectedPeriod,
    double? currentScale,
    Offset? panOffset,
    bool? isTouchingChart,
  }) {
    return StockAppQuizState._(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      chartData: chartData ?? _chartData,
      selectedPeriod: selectedPeriod ?? this.selectedPeriod,
      currentScale: currentScale ?? this.currentScale,
      panOffset: panOffset ?? this.panOffset,
      isTouchingChart: isTouchingChart ?? this.isTouchingChart,
    );
  }
}
