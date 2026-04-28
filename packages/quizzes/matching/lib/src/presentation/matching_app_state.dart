import 'dart:collection';

import 'package:matching/src/domain/entities/match_profile.dart';

/// マッチングアプリの共通UI状態
///
/// 各クイズの状態クラスに埋め込んで使用する。
/// [profiles] は不変ビューとして公開し、外部からの直接変更を防ぐ。
class MatchingAppState {
  MatchingAppState({
    required List<MatchProfile> profiles,
    required this.currentImageIndex,
    required this.currentCardIndex,
  }) : profiles = UnmodifiableListView(List.from(profiles));

  // copyWith でリストを変更しない場合に既存の UnmodifiableListView を再利用する
  MatchingAppState._wrap({
    required this.profiles,
    required this.currentImageIndex,
    required this.currentCardIndex,
  });

  /// スワイプ待ちのプロフィールリスト（読み取り専用）
  final UnmodifiableListView<MatchProfile> profiles;

  /// 現在一番前に表示されているプロフィールの何枚目の写真を見ているか（初期値 0）
  final int currentImageIndex;

  /// 現在一番前に表示されているカードの絶対インデックス（初期値 0）
  final int currentCardIndex;

  factory MatchingAppState.initial({
    required List<MatchProfile> initialProfiles,
  }) =>
      MatchingAppState(
        profiles: initialProfiles,
        currentImageIndex: 0,
        currentCardIndex: 0,
      );

  MatchingAppState copyWith({
    List<MatchProfile>? profiles,
    int? currentImageIndex,
    int? currentCardIndex,
  }) {
    return MatchingAppState._wrap(
      profiles: profiles != null
          ? UnmodifiableListView(List.from(profiles))
          : this.profiles,
      currentImageIndex: currentImageIndex ?? this.currentImageIndex,
      currentCardIndex: currentCardIndex ?? this.currentCardIndex,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchingAppState &&
          identical(profiles, other.profiles) &&
          currentImageIndex == other.currentImageIndex &&
          currentCardIndex == other.currentCardIndex;

  @override
  int get hashCode => Object.hash(
        identityHashCode(profiles),
        currentImageIndex,
        currentCardIndex,
      );
}
