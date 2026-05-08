import 'package:flutter/material.dart';
import 'package:music/src/domain/entities/music_song.dart';
import '../../i18n/strings.g.dart' as $music;

abstract final class MusicCatalog {
  static const int songCount = 2;

  static const List<String> audioPaths = [
    'packages/music/assets/audio/song1.mp3',
    'packages/music/assets/audio/song2.mp3',
  ];

  static const List<Color> albumColors = [
    Color(0xFF6A1B9A),
    Color(0xFF0277BD),
  ];

  static const List<IconData> albumIcons = [
    Icons.music_note,
    Icons.waves,
  ];

  static List<MusicSong> buildSongs($music.Translations t) {
    assert(
      audioPaths.length == songCount &&
          albumColors.length == songCount &&
          albumIcons.length == songCount,
      'MusicCatalog: all lists must have length $songCount',
    );
    return [
      MusicSong(
        id: 's1',
        title: t.songs.song1Title,
        artist: t.songs.song1Artist,
        albumArtUrl: '',
        audioAssetPath: audioPaths[0],
        lyrics: t.songs.song1Lyrics,
        colorSeed: 0,
      ),
      MusicSong(
        id: 's2',
        title: t.songs.song2Title,
        artist: t.songs.song2Artist,
        albumArtUrl: '',
        audioAssetPath: audioPaths[1],
        lyrics: t.songs.song2Lyrics,
        colorSeed: 1,
      ),
    ];
  }
}
