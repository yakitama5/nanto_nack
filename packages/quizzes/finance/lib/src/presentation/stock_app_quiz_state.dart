import 'package:flutter/painting.dart';
import 'package:quiz_core/quiz_core.dart';

import '../domain/chart_data_generator.dart';
import '../domain/chart_data_point.dart';
import '../domain/chart_period.dart';
import '../domain/finance_quiz_config.dart';
import '../domain/finance_quiz_type.dart';

// startedAt を null にリセットできるよう sentinel として使うオブジェクト
const _unsetStartedAt = Object();

class StockAppQuizState extends QuizStateBase {
  // const を外して通常コンストラクタにし、chartData を内部で不変リストに変換する。
  // これにより List.unmodifiable() をコンストラクタ内で呼び出せる。
  StockAppQuizState._({
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
  })  :
        // コンストラクタで一度だけ不変リストを生成し、外部からの変更を防ぐ
        _chartData = List<ChartDataPoint>.unmodifiable(chartData);

  final int remainingSeconds;
  final List<ChartDataPoint> _chartData;
  final ChartPeriod selectedPeriod;
  final double currentScale;
  final Offset panOffset;
  final bool isTouchingChart;

  // すでに不変リストを保持しているため、毎回新しいビューを作らずそのまま返す
  List<ChartDataPoint> get chartData => _chartData;

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
    // sentinel を使って「明示的な null」と「省略」を区別する。
    // copyWith(startedAt: null) でリセット可能にするため Object? を使用。
    Object? startedAt = _unsetStartedAt,
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
      // sentinel と一致しない場合のみ新しい値（null も含む）を使用する
      startedAt: identical(startedAt, _unsetStartedAt)
          ? this.startedAt
          : startedAt as DateTime?,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      // copyWith に渡された chartData もコンストラクタ内で不変化される
      chartData: chartData ?? _chartData,
      selectedPeriod: selectedPeriod ?? this.selectedPeriod,
      currentScale: currentScale ?? this.currentScale,
      panOffset: panOffset ?? this.panOffset,
      isTouchingChart: isTouchingChart ?? this.isTouchingChart,
    );
  }
}
