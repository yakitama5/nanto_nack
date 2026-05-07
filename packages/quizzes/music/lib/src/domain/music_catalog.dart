import 'package:flutter/material.dart';
import 'package:music/src/domain/entities/music_song.dart';

abstract final class MusicCatalog {
  static const List<MusicSong> songs = [
    MusicSong(
      id: 's1',
      title: 'Starlight Drive',
      artist: 'The Cosmic Band',
      albumArtUrl: '',
      audioAssetPath: 'packages/music/assets/audio/song1.mp3',
      lyrics:
          'Driving down the starlit road\n'
          'Feeling free, no heavy load\n'
          'Neon lights and city dreams\n'
          "Nothing's ever what it seems\n"
          '\n'
          'Ride with me through the night\n'
          'Everything will be alright\n'
          'Starlight drive, starlight drive\n'
          'Keep us feeling so alive',
      colorSeed: 0,
    ),
    MusicSong(
      id: 's2',
      title: 'Ocean Waves',
      artist: 'Blue Horizon',
      albumArtUrl: '',
      audioAssetPath: 'packages/music/assets/audio/song2.mp3',
      lyrics:
          'The ocean calls my name tonight\n'
          'Waves of blue in morning light\n'
          'Salt and sea and endless sky\n'
          'Watching seagulls as they fly\n'
          '\n'
          'Let the tide wash away\n'
          'All the worries of the day\n'
          'Ocean waves, ocean waves\n'
          'Find the peace that silence saves',
      colorSeed: 1,
    ),
  ];

  static const List<Color> albumColors = [
    Color(0xFF6A1B9A),
    Color(0xFF0277BD),
  ];

  static const List<IconData> albumIcons = [
    Icons.music_note,
    Icons.waves,
  ];
}
