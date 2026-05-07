import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quiz_core/quiz_core.dart';

import '../domain/entities/music_song.dart';
import '../domain/music_catalog.dart';
import '../i18n/music_translations_extension.dart';
import 'music_app_state.dart';

class MusicAppScaffold extends StatelessWidget {
  const MusicAppScaffold({
    super.key,
    required this.musicState,
    required this.songs,
    required this.quizStatus,
    required this.remainingSeconds,
    required this.timeLimitSeconds,
    required this.missionText,
    required this.onGiveUp,
    required this.overlays,
    required this.onTogglePlayPause,
    required this.onNextSong,
    required this.onPreviousSong,
    required this.onTogglePlayerExpansion,
    required this.onCycleRepeatMode,
    required this.onLyricsSizeChanged,
    this.hintUsed = false,
    this.onHintTap,
    this.highlightRepeat = false,
    this.highlightSwipe = false,
    this.highlightMinimize = false,
    this.highlightLyrics = false,
  });

  final MusicAppState musicState;
  final List<MusicSong> songs;
  final QuizStatus quizStatus;
  final int remainingSeconds;
  final int timeLimitSeconds;
  final String missionText;
  final VoidCallback onGiveUp;
  final List<Widget> overlays;
  final VoidCallback onTogglePlayPause;
  final VoidCallback onNextSong;
  final VoidCallback onPreviousSong;
  final ValueChanged<bool> onTogglePlayerExpansion;
  final VoidCallback onCycleRepeatMode;
  final ValueChanged<double> onLyricsSizeChanged;
  final bool hintUsed;
  final VoidCallback? onHintTap;
  final bool highlightRepeat;
  final bool highlightSwipe;
  final bool highlightMinimize;
  final bool highlightLyrics;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MusicAppTheme>()!;
    final currentSong = songs[musicState.currentSongIndex % songs.length];

    return QuizExitScope(
      quizStatus: quizStatus,
      child: Scaffold(
        backgroundColor: ext.playerBackground,
        body: Stack(
          children: [
            _HomeBackground(ext: ext, songs: songs),
            if (musicState.isPlayerExpanded)
              _FullPlayerView(
                ext: ext,
                currentSong: currentSong,
                musicState: musicState,
                onTogglePlayPause: onTogglePlayPause,
                onNextSong: onNextSong,
                onPreviousSong: onPreviousSong,
                onTogglePlayerExpansion: onTogglePlayerExpansion,
                onCycleRepeatMode: onCycleRepeatMode,
                onLyricsSizeChanged: onLyricsSizeChanged,
                highlightRepeat: highlightRepeat,
                highlightSwipe: highlightSwipe,
                highlightMinimize: highlightMinimize,
                highlightLyrics: highlightLyrics,
              )
            else
              _MiniPlayer(
                ext: ext,
                currentSong: currentSong,
                isPlaying: musicState.isPlaying,
                onTogglePlayPause: onTogglePlayPause,
                onExpand: () => onTogglePlayerExpansion(true),
              ),
            if (quizStatus == QuizStatus.playing)
              FloatingMissionBubble(
                remainingSeconds: remainingSeconds,
                missionText: missionText,
                hintUsed: hintUsed,
                onHintTap: onHintTap,
                timeLimitSeconds: timeLimitSeconds,
                onGiveUp: onGiveUp,
              ),
            ...overlays,
          ],
        ),
      ),
    );
  }
}

// ─── ホーム背景（プレイリスト一覧モック） ─────────────────────────────────────

class _HomeBackground extends StatelessWidget {
  const _HomeBackground({
    required this.ext,
    required this.songs,
  });

  final MusicAppTheme ext;
  final List<MusicSong> songs;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                Icon(Icons.music_note, color: ext.brandColor, size: 28),
                const SizedBox(width: 8),
                UnreadableText(
                  sq.common.appTitle,
                  style: TextStyle(
                    color: ext.primaryTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Icon(Icons.search, color: ext.primaryTextColor),
                const SizedBox(width: 12),
                Icon(Icons.more_vert, color: ext.primaryTextColor),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: UnreadableText(
              sq.common.playlistTitle,
              style: TextStyle(
                color: ext.primaryTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 80),
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                final color =
                    MusicCatalog.albumColors[index % MusicCatalog.albumColors.length];
                final icon =
                    MusicCatalog.albumIcons[index % MusicCatalog.albumIcons.length];
                return ListTile(
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(icon, color: ext.onAlbumColor, size: 24),
                  ),
                  title: UnreadableText(
                    song.title,
                    style: TextStyle(
                      color: ext.primaryTextColor,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: UnreadableText(
                    song.artist,
                    style: TextStyle(color: ext.subTextColor, fontSize: 12),
                  ),
                  trailing: Icon(Icons.more_vert, color: ext.subTextColor),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ─── 全画面プレイヤー ──────────────────────────────────────────────────────────

class _FullPlayerView extends StatelessWidget {
  const _FullPlayerView({
    required this.ext,
    required this.currentSong,
    required this.musicState,
    required this.onTogglePlayPause,
    required this.onNextSong,
    required this.onPreviousSong,
    required this.onTogglePlayerExpansion,
    required this.onCycleRepeatMode,
    required this.onLyricsSizeChanged,
    required this.highlightRepeat,
    required this.highlightSwipe,
    required this.highlightMinimize,
    required this.highlightLyrics,
  });

  final MusicAppTheme ext;
  final MusicSong currentSong;
  final MusicAppState musicState;
  final VoidCallback onTogglePlayPause;
  final VoidCallback onNextSong;
  final VoidCallback onPreviousSong;
  final ValueChanged<bool> onTogglePlayerExpansion;
  final VoidCallback onCycleRepeatMode;
  final ValueChanged<double> onLyricsSizeChanged;
  final bool highlightRepeat;
  final bool highlightSwipe;
  final bool highlightMinimize;
  final bool highlightLyrics;

  @override
  Widget build(BuildContext context) {
    final albumColor = MusicCatalog
        .albumColors[currentSong.colorSeed % MusicCatalog.albumColors.length];
    final albumIcon = MusicCatalog
        .albumIcons[currentSong.colorSeed % MusicCatalog.albumIcons.length];

    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity != null && details.primaryVelocity! > 200) {
          onTogglePlayerExpansion(false);
        }
      },
      child: Container(
        color: ext.playerBackground,
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  _PlayerAppBar(
                    ext: ext,
                    highlightMinimize: highlightMinimize,
                    onMinimize: () => onTogglePlayerExpansion(false),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        _ArtworkArea(
                          ext: ext,
                          albumColor: albumColor,
                          albumIcon: albumIcon,
                          onNextSong: onNextSong,
                          onPreviousSong: onPreviousSong,
                          highlightSwipe: highlightSwipe,
                        ),
                        const SizedBox(height: 24),
                        _SongInfo(
                          ext: ext,
                          currentSong: currentSong,
                        ),
                        const SizedBox(height: 24),
                        _PlaybackControls(
                          ext: ext,
                          isPlaying: musicState.isPlaying,
                          repeatMode: musicState.repeatMode,
                          onTogglePlayPause: onTogglePlayPause,
                          onNextSong: onNextSong,
                          onPreviousSong: onPreviousSong,
                          onCycleRepeatMode: onCycleRepeatMode,
                          highlightRepeat: highlightRepeat,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
              _LyricsPanel(
                ext: ext,
                lyrics: currentSong.lyrics,
                onLyricsSizeChanged: onLyricsSizeChanged,
                highlightLyrics: highlightLyrics,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── AppBar ────────────────────────────────────────────────────────────────────

class _PlayerAppBar extends StatelessWidget {
  const _PlayerAppBar({
    required this.ext,
    required this.highlightMinimize,
    required this.onMinimize,
  });

  final MusicAppTheme ext;
  final bool highlightMinimize;
  final VoidCallback onMinimize;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    return Container(
      height: 56,
      color: ext.appBarBackground,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: highlightMinimize
                ? BoxDecoration(
                    border: Border.all(
                      color: ext.highlightBorderColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: ext.highlightBorderColor.withValues(alpha: 0.1),
                  )
                : null,
            child: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: ext.primaryTextColor,
              ),
              onPressed: onMinimize,
            ),
          ),
          Expanded(
            child: Center(
              child: UnreadableText(
                sq.common.appTitle,
                style: TextStyle(
                  color: ext.primaryTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: ext.primaryTextColor),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

// ─── アートワークエリア ─────────────────────────────────────────────────────────

class _ArtworkArea extends StatelessWidget {
  const _ArtworkArea({
    required this.ext,
    required this.albumColor,
    required this.albumIcon,
    required this.onNextSong,
    required this.onPreviousSong,
    required this.highlightSwipe,
  });

  final MusicAppTheme ext;
  final Color albumColor;
  final IconData albumIcon;
  final VoidCallback onNextSong;
  final VoidCallback onPreviousSong;
  final bool highlightSwipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity != null && details.primaryVelocity! < 0) {
            onNextSong();
          } else if (details.primaryVelocity != null &&
              details.primaryVelocity! > 0) {
            onPreviousSong();
          }
        },
        child: Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
            color: albumColor,
            borderRadius: BorderRadius.circular(12),
            border: highlightSwipe
                ? Border.all(
                    color: ext.highlightBorderColor,
                    width: 3,
                  )
                : null,
          ),
          child: Center(
            child: Icon(albumIcon, size: 96, color: ext.onAlbumColor.withValues(alpha: 0.7)),
          ),
        ),
      ),
    );
  }
}

// ─── 曲情報 ────────────────────────────────────────────────────────────────────

class _SongInfo extends StatelessWidget {
  const _SongInfo({
    required this.ext,
    required this.currentSong,
  });

  final MusicAppTheme ext;
  final MusicSong currentSong;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UnreadableText(
                  currentSong.title,
                  style: TextStyle(
                    color: ext.primaryTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                UnreadableText(
                  currentSong.artist,
                  style: TextStyle(
                    color: ext.subTextColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.favorite_border, color: ext.subTextColor),
        ],
      ),
    );
  }
}

// ─── 再生コントロール ──────────────────────────────────────────────────────────

class _PlaybackControls extends StatelessWidget {
  const _PlaybackControls({
    required this.ext,
    required this.isPlaying,
    required this.repeatMode,
    required this.onTogglePlayPause,
    required this.onNextSong,
    required this.onPreviousSong,
    required this.onCycleRepeatMode,
    required this.highlightRepeat,
  });

  final MusicAppTheme ext;
  final bool isPlaying;
  final LoopMode repeatMode;
  final VoidCallback onTogglePlayPause;
  final VoidCallback onNextSong;
  final VoidCallback onPreviousSong;
  final VoidCallback onCycleRepeatMode;
  final bool highlightRepeat;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          // シークバー（モック）
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 3,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              activeTrackColor: ext.activeColor,
              inactiveTrackColor: ext.inactiveColor,
              thumbColor: ext.activeColor,
            ),
            child: Slider(
              value: 0.3,
              onChanged: null,
            ),
          ),
          // 時間表示
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sq.common.mockCurrentTime,
                  style: TextStyle(color: ext.subTextColor, fontSize: 12),
                ),
                Text(
                  sq.common.mockDuration,
                  style: TextStyle(color: ext.subTextColor, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // コントロールボタン
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.shuffle, color: ext.inactiveColor),
                onPressed: null,
              ),
              IconButton(
                icon: Icon(Icons.skip_previous, color: ext.primaryTextColor, size: 36),
                onPressed: onPreviousSong,
              ),
              GestureDetector(
                onTap: onTogglePlayPause,
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: ext.activeColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: ext.onAlbumColor,
                    size: 36,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.skip_next, color: ext.primaryTextColor, size: 36),
                onPressed: onNextSong,
              ),
              Container(
                decoration: highlightRepeat
                    ? BoxDecoration(
                        border: Border.all(
                          color: ext.highlightBorderColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: ext.highlightBorderColor.withValues(alpha: 0.1),
                      )
                    : null,
                child: IconButton(
                  icon: _buildRepeatIcon(repeatMode, ext),
                  onPressed: onCycleRepeatMode,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRepeatIcon(LoopMode mode, MusicAppTheme ext) {
    return switch (mode) {
      LoopMode.off => Icon(Icons.repeat, color: ext.inactiveColor),
      LoopMode.all => Icon(Icons.repeat, color: ext.activeColor),
      LoopMode.one => Icon(Icons.repeat_one, color: ext.activeColor),
    };
  }
}

// ─── 歌詞パネル ────────────────────────────────────────────────────────────────

class _LyricsPanel extends StatelessWidget {
  const _LyricsPanel({
    required this.ext,
    required this.lyrics,
    required this.onLyricsSizeChanged,
    required this.highlightLyrics,
  });

  final MusicAppTheme ext;
  final String lyrics;
  final ValueChanged<double> onLyricsSizeChanged;
  final bool highlightLyrics;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    return DraggableScrollableSheet(
      initialChildSize: 0.12,
      minChildSize: 0.08,
      maxChildSize: 1.0,
      builder: (context, scrollController) {
        return NotificationListener<DraggableScrollableNotification>(
          onNotification: (notification) {
            onLyricsSizeChanged(notification.extent);
            return false;
          },
          child: Container(
            decoration: BoxDecoration(
              color: ext.cardBackground,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              border: highlightLyrics
                  ? Border.all(color: ext.highlightBorderColor, width: 2)
                  : null,
            ),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: ext.inactiveColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lyrics_outlined, color: ext.subTextColor, size: 16),
                      const SizedBox(width: 4),
                      UnreadableText(
                        sq.common.lyrics,
                        style: TextStyle(
                          color: ext.subTextColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: lyrics.isEmpty
                        ? Text(
                            sq.common.lyricsNotAvailable,
                            style: TextStyle(
                              color: ext.subTextColor,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            lyrics,
                            style: TextStyle(
                              color: ext.primaryTextColor,
                              fontSize: 16,
                              height: 1.8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ─── ミニプレイヤー ────────────────────────────────────────────────────────────

class _MiniPlayer extends StatelessWidget {
  const _MiniPlayer({
    required this.ext,
    required this.currentSong,
    required this.isPlaying,
    required this.onTogglePlayPause,
    required this.onExpand,
  });

  final MusicAppTheme ext;
  final MusicSong currentSong;
  final bool isPlaying;
  final VoidCallback onTogglePlayPause;
  final VoidCallback onExpand;

  @override
  Widget build(BuildContext context) {
    final albumColor = MusicCatalog
        .albumColors[currentSong.colorSeed % MusicCatalog.albumColors.length];
    final albumIcon = MusicCatalog
        .albumIcons[currentSong.colorSeed % MusicCatalog.albumIcons.length];

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: GestureDetector(
        onTap: onExpand,
        child: Container(
          height: 72,
          color: ext.miniPlayerBackground,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: albumColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(albumIcon, color: ext.onAlbumColor, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UnreadableText(
                      currentSong.title,
                      style: TextStyle(
                        color: ext.primaryTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    UnreadableText(
                      currentSong.artist,
                      style: TextStyle(color: ext.subTextColor, fontSize: 12),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: ext.primaryTextColor,
                  size: 28,
                ),
                onPressed: onTogglePlayPause,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
