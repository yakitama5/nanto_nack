import 'package:quiz_core/quiz_core.dart';

import '../../domain/entities/map_place.dart';

/// Quiz 3「目的地と交通手段を選んでルートを案内する」の状態
class StartNavigationQuizState extends QuizStateBase {
  /// コンストラクタ
  const StartNavigationQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.selectedPlace,
    required this.showDirections,
    required this.selectedTransportIndex,
    required this.navigationStarted,
    required this.remainingSeconds,
  });

  /// 初期状態を生成する（目的地・交通手段ともに未選択）
  factory StartNavigationQuizState.initial({int timeLimitSeconds = 60}) =>
      StartNavigationQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        selectedPlace: null,
        showDirections: false,
        selectedTransportIndex: null,
        navigationStarted: false,
        remainingSeconds: timeLimitSeconds,
      );

  /// 選択された目的地
  final MapPlace? selectedPlace;

  /// ルート候補パネルを表示中か（正解の目的地を選択後）
  final bool showDirections;

  /// 選択された交通手段インデックス
  final int? selectedTransportIndex;

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
    int? selectedTransportIndex,
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
      selectedTransportIndex:
          selectedTransportIndex ?? this.selectedTransportIndex,
      navigationStarted: navigationStarted ?? this.navigationStarted,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }
}
