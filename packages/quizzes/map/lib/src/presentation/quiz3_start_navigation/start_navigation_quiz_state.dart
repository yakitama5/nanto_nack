import 'package:quiz_core/quiz_core.dart';

import '../../domain/entities/map_place.dart';

/// Quiz 3「ルート案内を開始する」の状態
class StartNavigationQuizState extends QuizStateBase {
  /// コンストラクタ
  const StartNavigationQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.selectedPlace,
    required this.showDirections,
    required this.navigationStarted,
    required this.remainingSeconds,
  });

  /// 初期状態を生成する
  factory StartNavigationQuizState.initial({
    required MapPlace destination,
    int timeLimitSeconds = 60,
  }) =>
      StartNavigationQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        selectedPlace: destination,
        showDirections: false,
        navigationStarted: false,
        remainingSeconds: timeLimitSeconds,
      );

  /// 選択された目的地（ルート表示対象）
  final MapPlace? selectedPlace;

  /// ルート候補パネルを表示中か
  final bool showDirections;

  /// ナビゲーション開始済みか
  final bool navigationStarted;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 指定フィールドを差し替えた新インスタンスを返す
  StartNavigationQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    MapPlace? selectedPlace,
    bool? showDirections,
    bool? navigationStarted,
    int? remainingSeconds,
  }) {
    return StartNavigationQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      selectedPlace: selectedPlace ?? this.selectedPlace,
      showDirections: showDirections ?? this.showDirections,
      navigationStarted: navigationStarted ?? this.navigationStarted,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }
}
