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
    return MatchingAppState(
      profiles: profiles != null
          ? List.from(profiles)
          : this.profiles.toList(),
      currentImageIndex: currentImageIndex ?? this.currentImageIndex,
      currentCardIndex: currentCardIndex ?? this.currentCardIndex,
    );
  }
}
