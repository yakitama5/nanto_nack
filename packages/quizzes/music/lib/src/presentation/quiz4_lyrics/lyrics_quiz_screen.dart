import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../domain/music_catalog.dart';
import '../../domain/music_quiz_config.dart';
import '../../i18n/music_translations_extension.dart';
import '../music_app_scaffold.dart';
import 'lyrics_quiz_notifier.dart';

class LyricsQuizScreen extends ConsumerStatefulWidget {
  const LyricsQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<LyricsQuizScreen> createState() => _LyricsQuizScreenState();
}

class _LyricsQuizScreenState extends ConsumerState<LyricsQuizScreen> {
  bool _showCutIn = true;
  bool _hintUsed = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(lyricsQuizProvider);
    final missionText = context.s.quiz4.missionText;

    return MusicAppScaffold(
      musicState: state.musicState,
      songs: MusicCatalog.buildSongs(context.sq),
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: MusicQuizConfig.quiz4TimeLimitSeconds,
      missionText: missionText,
      onGiveUp: () => ref.read(lyricsQuizProvider.notifier).giveUp(),
      onTogglePlayPause: () =>
          ref.read(lyricsQuizProvider.notifier).togglePlayPause(),
      onNextSong: () => ref.read(lyricsQuizProvider.notifier).nextSong(),
      onPreviousSong: () =>
          ref.read(lyricsQuizProvider.notifier).previousSong(),
      onTogglePlayerExpansion: (expanded) =>
          ref.read(lyricsQuizProvider.notifier).togglePlayerExpansion(expanded),
      onCycleRepeatMode: () =>
          ref.read(lyricsQuizProvider.notifier).cycleRepeatMode(),
      onLyricsSizeChanged: (size) =>
          ref.read(lyricsQuizProvider.notifier).updateLyricsSize(size),
      hintUsed: _hintUsed,
      onHintTap: () => setState(() => _hintUsed = true),
      highlightLyrics: _hintUsed && state.status == QuizStatus.playing,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: MusicQuizConfig.quiz4TimeLimitSeconds,
            onFinished: () {
              if (!mounted) return;
              setState(() => _showCutIn = false);
              ref.read(lyricsQuizProvider.notifier).startQuiz();
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
                ref.read(lyricsQuizProvider.notifier).retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              isLimitReached: ref.isPlayLimitReached,
              insight: Builder(
                builder: (context) {
                  final insight = context.s.quiz4.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '☝️',
                        title: insight.dragTitle,
                        desc: insight.dragDesc,
                      ),
                      QuizInsightItem(
                        emoji: '〰️',
                        title: insight.handleTitle,
                        desc: insight.handleDesc,
                      ),
                      QuizInsightItem(
                        emoji: '📝',
                        title: insight.lyricsTitle,
                        desc: insight.lyricsDesc,
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
