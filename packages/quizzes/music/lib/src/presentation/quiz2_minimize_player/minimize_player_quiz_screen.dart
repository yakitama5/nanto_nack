import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../domain/music_catalog.dart';
import '../../domain/music_quiz_config.dart';
import '../../i18n/music_translations_extension.dart';
import '../music_app_scaffold.dart';
import 'minimize_player_quiz_notifier.dart';

class MinimizePlayerQuizScreen extends ConsumerStatefulWidget {
  const MinimizePlayerQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<MinimizePlayerQuizScreen> createState() =>
      _MinimizePlayerQuizScreenState();
}

class _MinimizePlayerQuizScreenState
    extends ConsumerState<MinimizePlayerQuizScreen> {
  bool _showCutIn = true;
  bool _hintUsed = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(minimizePlayerQuizProvider);
    final missionText = context.s.quiz2.missionText;

    return MusicAppScaffold(
      musicState: state.musicState,
      songs: MusicCatalog.songs,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: MusicQuizConfig.quiz2TimeLimitSeconds,
      missionText: missionText,
      onGiveUp: () => ref.read(minimizePlayerQuizProvider.notifier).giveUp(),
      onTogglePlayPause: () =>
          ref.read(minimizePlayerQuizProvider.notifier).togglePlayPause(),
      onNextSong: () =>
          ref.read(minimizePlayerQuizProvider.notifier).nextSong(),
      onPreviousSong: () =>
          ref.read(minimizePlayerQuizProvider.notifier).previousSong(),
      onTogglePlayerExpansion: (expanded) => ref
          .read(minimizePlayerQuizProvider.notifier)
          .togglePlayerExpansion(expanded),
      onCycleRepeatMode: () =>
          ref.read(minimizePlayerQuizProvider.notifier).cycleRepeatMode(),
      onLyricsSizeChanged: (size) =>
          ref.read(minimizePlayerQuizProvider.notifier).updateLyricsSize(size),
      hintUsed: _hintUsed,
      onHintTap: () => setState(() => _hintUsed = true),
      highlightMinimize: _hintUsed && state.status == QuizStatus.playing,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: MusicQuizConfig.quiz2TimeLimitSeconds,
            onFinished: () {
              if (!mounted) return;
              setState(() => _showCutIn = false);
              ref.read(minimizePlayerQuizProvider.notifier).startQuiz();
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
                ref.read(minimizePlayerQuizProvider.notifier).retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              isLimitReached: ref.isPlayLimitReached,
              insight: Builder(
                builder: (context) {
                  final insight = context.s.quiz2.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '👇',
                        title: insight.dragTitle,
                        desc: insight.dragDesc,
                      ),
                      QuizInsightItem(
                        emoji: '🎵',
                        title: insight.miniTitle,
                        desc: insight.miniDesc,
                      ),
                      QuizInsightItem(
                        emoji: '〰️',
                        title: insight.notchTitle,
                        desc: insight.notchDesc,
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
