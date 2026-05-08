import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../domain/entities/music_song.dart';
import '../../domain/music_catalog.dart';
import '../../domain/music_quiz_config.dart';
import '../../i18n/music_translations_extension.dart';
import '../music_app_scaffold.dart';
import 'next_song_quiz_notifier.dart';

class NextSongQuizScreen extends ConsumerStatefulWidget {
  const NextSongQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<NextSongQuizScreen> createState() => _NextSongQuizScreenState();
}

class _NextSongQuizScreenState extends ConsumerState<NextSongQuizScreen> {
  bool _showCutIn = true;
  bool _hintUsed = false;
  late List<MusicSong> _songs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _songs = MusicCatalog.buildSongs(context.sq);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(nextSongQuizProvider);
    final missionText = context.s.quiz1.missionText;

    return MusicAppScaffold(
      musicState: state.musicState,
      songs: _songs,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: MusicQuizConfig.quiz1TimeLimitSeconds,
      missionText: missionText,
      onGiveUp: () => ref.read(nextSongQuizProvider.notifier).giveUp(),
      onTogglePlayPause: () =>
          ref.read(nextSongQuizProvider.notifier).togglePlayPause(),
      onNextSong: () => ref.read(nextSongQuizProvider.notifier).nextSong(),
      onPreviousSong: () =>
          ref.read(nextSongQuizProvider.notifier).previousSong(),
      onTogglePlayerExpansion: (expanded) =>
          ref.read(nextSongQuizProvider.notifier).togglePlayerExpansion(expanded),
      onCycleRepeatMode: () =>
          ref.read(nextSongQuizProvider.notifier).cycleRepeatMode(),
      onLyricsSizeChanged: (size) =>
          ref.read(nextSongQuizProvider.notifier).updateLyricsSize(size),
      hintUsed: _hintUsed,
      onHintTap: () => setState(() => _hintUsed = true),
      highlightSwipe: _hintUsed && state.status == QuizStatus.playing,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: MusicQuizConfig.quiz1TimeLimitSeconds,
            onFinished: () {
              if (!mounted) return;
              setState(() => _showCutIn = false);
              ref.read(nextSongQuizProvider.notifier).startQuiz();
            },
          ),
        if (state.status == QuizStatus.correct ||
            state.status == QuizStatus.incorrect ||
            state.status == QuizStatus.timeUp ||
            state.status == QuizStatus.giveUp)
          Positioned.fill(
            child: QuizResultOverlay(
              status: state.status,
              score: state.score,
              elapsedMs: state.elapsedMs,
              onRetry: () {
                setState(() {
                  _showCutIn = true;
                  _hintUsed = false;
                });
                ref.read(nextSongQuizProvider.notifier).retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              isLimitReached: ref.isPlayLimitReached,
              insight: Builder(
                builder: (context) {
                  final insight = context.s.quiz1.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '👈',
                        title: insight.swipeTitle,
                        desc: insight.swipeDesc,
                      ),
                      QuizInsightItem(
                        emoji: '⏭',
                        title: insight.skipTitle,
                        desc: insight.skipDesc,
                      ),
                      QuizInsightItem(
                        emoji: '✌️',
                        title: insight.gestureTitle,
                        desc: insight.gestureDesc,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
