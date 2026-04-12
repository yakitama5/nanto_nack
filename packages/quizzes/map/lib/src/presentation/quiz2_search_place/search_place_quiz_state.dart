import 'package:quiz_core/quiz_core.dart';

import '../../domain/entities/map_place.dart';

/// Quiz 2「学校の情報を表示する」の状態
class ShowSchoolInfoQuizState extends QuizStateBase {
  /// コンストラクタ
  const ShowSchoolInfoQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.selectedPlace,
    required this.remainingSeconds,
  });

  /// 初期状態を生成する
  factory ShowSchoolInfoQuizState.initial({int timeLimitSeconds = 60}) =>
      ShowSchoolInfoQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        selectedPlace: null,
        remainingSeconds: timeLimitSeconds,
      );

  /// 選択された場所（クリア時のみセット）
  final MapPlace? selectedPlace;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 指定フィールドを差し替えた新インスタンスを返す
  ShowSchoolInfoQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    MapPlace? selectedPlace,
    int? remainingSeconds,
  }) {
    return ShowSchoolInfoQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      selectedPlace: selectedPlace ?? this.selectedPlace,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }
}
