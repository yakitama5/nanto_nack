import 'package:just_audio/just_audio.dart';

class MusicAppState {
  const MusicAppState({
    required this.isPlayerExpanded,
    required this.currentSongIndex,
    required this.repeatMode,
    required this.isPlaying,
    required this.lyricsSheetSize,
  });

  final bool isPlayerExpanded;
  final int currentSongIndex;
  final LoopMode repeatMode;
  final bool isPlaying;
  final double lyricsSheetSize;

  static const initial = MusicAppState(
    isPlayerExpanded: true,
    currentSongIndex: 0,
    repeatMode: LoopMode.off,
    isPlaying: true,
    lyricsSheetSize: 0.0,
  );

  MusicAppState copyWith({
    bool? isPlayerExpanded,
    int? currentSongIndex,
    LoopMode? repeatMode,
    bool? isPlaying,
    double? lyricsSheetSize,
  }) {
    return MusicAppState(
      isPlayerExpanded: isPlayerExpanded ?? this.isPlayerExpanded,
      currentSongIndex: currentSongIndex ?? this.currentSongIndex,
      repeatMode: repeatMode ?? this.repeatMode,
      isPlaying: isPlaying ?? this.isPlaying,
      lyricsSheetSize: lyricsSheetSize ?? this.lyricsSheetSize,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicAppState &&
          runtimeType == other.runtimeType &&
          isPlayerExpanded == other.isPlayerExpanded &&
          currentSongIndex == other.currentSongIndex &&
          repeatMode == other.repeatMode &&
          isPlaying == other.isPlaying &&
          lyricsSheetSize == other.lyricsSheetSize;

  @override
  int get hashCode => Object.hash(
        isPlayerExpanded,
        currentSongIndex,
        repeatMode,
        isPlaying,
        lyricsSheetSize,
      );
}
