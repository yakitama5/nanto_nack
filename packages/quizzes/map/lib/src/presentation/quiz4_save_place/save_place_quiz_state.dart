import 'package:quiz_core/quiz_core.dart';

import '../../domain/entities/map_place.dart';

/// Quiz 4「指定した場所をお気に入りに追加する」の状態
class SavePlaceQuizState extends QuizStateBase {
  /// コンストラクタ
  const SavePlaceQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.selectedPlace,
    required this.remainingSeconds,
    required this.isCorrectPlaceSelected,
  });

  /// 初期状態を生成する（場所は未選択）
  factory SavePlaceQuizState.initial({int timeLimitSeconds = 60}) =>
      SavePlaceQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        selectedPlace: null,
        remainingSeconds: timeLimitSeconds,
        isCorrectPlaceSelected: false,
      );

  /// 選択された場所（未選択の場合は null）
  final MapPlace? selectedPlace;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 選択中の場所が正解の場所かどうか
  final bool isCorrectPlaceSelected;

  /// 指定フィールドを差し替えた新インスタンスを返す
  SavePlaceQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    MapPlace? selectedPlace,
    int? remainingSeconds,
    bool? isCorrectPlaceSelected,
  }) {
    return SavePlaceQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      selectedPlace: selectedPlace ?? this.selectedPlace,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isCorrectPlaceSelected:
          isCorrectPlaceSelected ?? this.isCorrectPlaceSelected,
    );
  }
}
