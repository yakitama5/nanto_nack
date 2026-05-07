import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../domain/music_catalog.dart';
import '../../domain/music_quiz_config.dart';
import '../../i18n/music_translations_extension.dart';
import '../music_app_scaffold.dart';
import 'one_repeat_quiz_notifier.dart';

class OneRepeatQuizScreen extends ConsumerStatefulWidget {
  const OneRepeatQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<OneRepeatQuizScreen> createState() =>
      _OneRepeatQuizScreenState();
}

class _OneRepeatQuizScreenState extends ConsumerState<OneRepeatQuizScreen> {
  bool _showCutIn = true;
  bool _hintUsed = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(oneRepeatQuizProvider);
    final missionText = context.s.quiz3.missionText;

    return MusicAppScaffold(
      musicState: state.musicState,
      songs: MusicCatalog.buildSongs(context.sq),
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: MusicQuizConfig.quiz3TimeLimitSeconds,
      missionText: missionText,
      onGiveUp: () => ref.read(oneRepeatQuizProvider.notifier).giveUp(),
      onTogglePlayPause: () =>
          ref.read(oneRepeatQuizProvider.notifier).togglePlayPause(),
      onNextSong: () => ref.read(oneRepeatQuizProvider.notifier).nextSong(),
      onPreviousSong: () =>
          ref.read(oneRepeatQuizProvider.notifier).previousSong(),
      onTogglePlayerExpansion: (expanded) => ref
          .read(oneRepeatQuizProvider.notifier)
          .togglePlayerExpansion(expanded),
      onCycleRepeatMode: () =>
          ref.read(oneRepeatQuizProvider.notifier).cycleRepeatMode(),
      onLyricsSizeChanged: (size) =>
          ref.read(oneRepeatQuizProvider.notifier).updateLyricsSize(size),
      hintUsed: _hintUsed,
      onHintTap: () => setState(() => _hintUsed = true),
      highlightRepeat: _hintUsed && state.status == QuizStatus.playing,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: MusicQuizConfig.quiz3TimeLimitSeconds,
            onFinished: () {
              if (!mounted) return;
              setState(() => _showCutIn = false);
              ref.read(oneRepeatQuizProvider.notifier).startQuiz();
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
                ref.read(oneRepeatQuizProvider.notifier).retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              isLimitReached: ref.isPlayLimitReached,
              insight: Builder(
                builder: (context) {
                  final insight = context.s.quiz3.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '🔁',
                        title: insight.repeatTitle,
                        desc: insight.repeatDesc,
                      ),
                      QuizInsightItem(
                        emoji: '🔂',
                        title: insight.iconTitle,
                        desc: insight.iconDesc,
                      ),
                      QuizInsightItem(
                        emoji: '👆',
                        title: insight.tapTitle,
                        desc: insight.tapDesc,
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
