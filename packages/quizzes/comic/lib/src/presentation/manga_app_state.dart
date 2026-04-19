/// 漫画ビューアアプリのUI状態
class MangaAppState {
  const MangaAppState({
    required this.currentPageIndex,
    required this.isMenuVisible,
    required this.likeCount,
    required this.currentScale,
  });

  factory MangaAppState.initial({required int initialPageIndex}) =>
      MangaAppState(
        currentPageIndex: initialPageIndex,
        isMenuVisible: false,
        likeCount: 0,
        currentScale: 1.0,
      );

  /// 現在表示しているページのインデックス（0始まり）
  final int currentPageIndex;

  /// メニュー（ヘッダー・フッター）の表示状態
  final bool isMenuVisible;

  /// 応援（いいね）ボタンのタップ回数
  final int likeCount;

  /// 現在の拡大率
  final double currentScale;

  MangaAppState copyWith({
    int? currentPageIndex,
    bool? isMenuVisible,
    int? likeCount,
    double? currentScale,
  }) =>
      MangaAppState(
        currentPageIndex: currentPageIndex ?? this.currentPageIndex,
        isMenuVisible: isMenuVisible ?? this.isMenuVisible,
        likeCount: likeCount ?? this.likeCount,
        currentScale: currentScale ?? this.currentScale,
      );
}
