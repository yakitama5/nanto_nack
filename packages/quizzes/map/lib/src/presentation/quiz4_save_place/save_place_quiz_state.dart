import 'package:quiz_core/quiz_core.dart';

import '../../domain/entities/map_place.dart';

/// Quiz 4「場所をお気に入りに追加する」の状態
class SavePlaceQuizState extends QuizStateBase {
  /// コンストラクタ
  const SavePlaceQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.place,
    required this.remainingSeconds,
  });

  /// 初期状態を生成する
  factory SavePlaceQuizState.initial({
    required MapPlace place,
    int timeLimitSeconds = 60,
  }) =>
      SavePlaceQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        place: place,
        remainingSeconds: timeLimitSeconds,
      );

  /// 対象の場所
  final MapPlace place;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 指定フィールドを差し替えた新インスタンスを返す
  SavePlaceQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    MapPlace? place,
    int? remainingSeconds,
  }) {
    return SavePlaceQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      place: place ?? this.place,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }
}
