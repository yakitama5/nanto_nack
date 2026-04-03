import 'package:quiz_core/quiz_core.dart';

import '../../domain/entities/map_place.dart';

/// Quiz 2「目的地を検索する」の状態
class SearchPlaceQuizState extends QuizStateBase {
  /// コンストラクタ
  const SearchPlaceQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.searchQuery,
    required this.selectedPlace,
    required this.remainingSeconds,
  });

  /// 初期状態を生成する
  factory SearchPlaceQuizState.initial({int timeLimitSeconds = 60}) =>
      SearchPlaceQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        searchQuery: '',
        selectedPlace: null,
        remainingSeconds: timeLimitSeconds,
      );

  /// 検索クエリ文字列
  final String searchQuery;

  /// 選択された場所
  final MapPlace? selectedPlace;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 指定フィールドを差し替えた新インスタンスを返す
  SearchPlaceQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    String? searchQuery,
    MapPlace? selectedPlace,
    int? remainingSeconds,
  }) {
    return SearchPlaceQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedPlace: selectedPlace ?? this.selectedPlace,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }
}
