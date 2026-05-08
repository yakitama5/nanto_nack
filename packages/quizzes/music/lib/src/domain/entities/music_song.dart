class MusicSong {
  const MusicSong({
    required this.id,
    required this.title,
    required this.artist,
    required this.albumArtUrl,
    required this.audioAssetPath,
    required this.lyrics,
    this.colorSeed = 0,
  });

  final String id;
  final String title;
  final String artist;
  final String albumArtUrl;
  final String audioAssetPath;
  final String lyrics;
  final int colorSeed;

  MusicSong copyWith({
    String? id,
    String? title,
    String? artist,
    String? albumArtUrl,
    String? audioAssetPath,
    String? lyrics,
    int? colorSeed,
  }) {
    return MusicSong(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      albumArtUrl: albumArtUrl ?? this.albumArtUrl,
      audioAssetPath: audioAssetPath ?? this.audioAssetPath,
      lyrics: lyrics ?? this.lyrics,
      colorSeed: colorSeed ?? this.colorSeed,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicSong &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          artist == other.artist &&
          albumArtUrl == other.albumArtUrl &&
          audioAssetPath == other.audioAssetPath &&
          lyrics == other.lyrics &&
          colorSeed == other.colorSeed;

  @override
  int get hashCode => Object.hash(
        id,
        title,
        artist,
        albumArtUrl,
        audioAssetPath,
        lyrics,
        colorSeed,
      );
}
