import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/domain/streaming_quiz_config.dart';
import 'package:system/system.dart';
import 'package:streaming/src/i18n/streaming_translations_extension.dart';
import 'package:streaming/src/presentation/quiz2_skip_seek/skip_seek_quiz_notifier.dart';
import 'package:streaming/src/presentation/streaming_overlay_menu.dart';
import 'package:streaming/src/presentation/streaming_player_screen.dart';

class SkipSeekQuizScreen extends ConsumerStatefulWidget {
  const SkipSeekQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<SkipSeekQuizScreen> createState() => _SkipSeekQuizScreenState();
}

class _SkipSeekQuizScreenState extends ConsumerState<SkipSeekQuizScreen> {
  bool _showCutIn = true;
  bool _hintUsed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(skipSeekQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(skipSeekQuizProvider);
    final missionText = context.s.quiz2.missionText;

    return StreamingPlayerScreen(
      video: state.video,
      isPlaying: state.status == QuizStatus.playing,
      progressSeconds: state.progressSeconds,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: StreamingQuizConfig.quiz2SkipSeekTimeLimitSeconds,
      missionText: missionText,
      onGiveUp: () => ref.read(skipSeekQuizProvider.notifier).giveUp(),
      onNextTap: () => ref.read(skipSeekQuizProvider.notifier).tapNext(),
      onSeek: (val) => ref.read(skipSeekQuizProvider.notifier).onSeek(val),
      onLikeTap: () => ref.read(skipSeekQuizProvider.notifier).tapLike(),
      onDislikeTap: () =>
          ref.read(skipSeekQuizProvider.notifier).tapDislike(),
      onShareTap: () => ref.read(skipSeekQuizProvider.notifier).tapShare(),
      onSaveTap: () => ref.read(skipSeekQuizProvider.notifier).tapSave(),
      onDownloadTap: () =>
          ref.read(skipSeekQuizProvider.notifier).tapDownload(),
      onMoreTap: () =>
          ref.read(skipSeekQuizProvider.notifier).tapSettings(),
      showShareButton: true,
      showSaveButton: true,
      showDownloadButton: true,
      showMoreButton: true,
      hintUsed: _hintUsed,
      onHintTap: () => setState(() => _hintUsed = true),
      highlightNext: _hintUsed && state.status == QuizStatus.playing && !state.isSkipped,
      highlightSeek: _hintUsed && state.status == QuizStatus.playing && state.isSkipped,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: StreamingQuizConfig.quiz2SkipSeekTimeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
          ),
        if (state.isSettingsOpen)
          StreamingOverlayMenu(
            onDismiss: () =>
                ref.read(skipSeekQuizProvider.notifier).dismissSettings(),
            child: StreamingMoreMenu(
              video: state.video,
              onSubtitleTap: () {},
              onQualityTap: () {},
              onSpeedTap: () {},
              onDismiss: () =>
                  ref.read(skipSeekQuizProvider.notifier).dismissSettings(),
            ),
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
                ref.read(skipSeekQuizProvider.notifier).retry();
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
                        emoji: '⏭️',
                        title: insight.skipTitle,
                        desc: insight.skipDesc,
                      ),
                      QuizInsightItem(
                        emoji: '🔴',
                        title: insight.seekTitle,
                        desc: insight.seekDesc,
                      ),
                      QuizInsightItem(
                        emoji: '🎯',
                        title: insight.targetTitle,
                        desc: insight.targetDesc,
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



