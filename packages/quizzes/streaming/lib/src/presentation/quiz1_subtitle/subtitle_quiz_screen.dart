import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/domain/streaming_quiz_config.dart';
import 'package:system/system.dart';
import 'package:streaming/src/i18n/streaming_translations_extension.dart';
import 'package:streaming/src/presentation/quiz1_subtitle/subtitle_quiz_notifier.dart';
import 'package:streaming/src/presentation/streaming_overlay_menu.dart';
import 'package:streaming/src/presentation/streaming_player_screen.dart';

class SubtitleQuizScreen extends ConsumerStatefulWidget {
  const SubtitleQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<SubtitleQuizScreen> createState() => _SubtitleQuizScreenState();
}

class _SubtitleQuizScreenState extends ConsumerState<SubtitleQuizScreen> {
  bool _showCutIn = true;
  bool _hintUsed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(subtitleQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(subtitleQuizProvider);
    final missionText = context.s.quiz1.missionText;

    return StreamingPlayerScreen(
      video: state.video,
      isPlaying: true,
      progressSeconds: 120,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: StreamingQuizConfig.quiz1SubtitleTimeLimitSeconds,
      missionText: missionText,
      onGiveUp: () => ref.read(subtitleQuizProvider.notifier).giveUp(),
      onSubtitleToggle: () =>
          ref.read(subtitleQuizProvider.notifier).tapCC(),
      onLikeTap: () => ref.read(subtitleQuizProvider.notifier).tapLike(),
      onDislikeTap: () =>
          ref.read(subtitleQuizProvider.notifier).tapDislike(),
      onShareTap: () => ref.read(subtitleQuizProvider.notifier).tapShare(),
      onSaveTap: () => ref.read(subtitleQuizProvider.notifier).tapSave(),
      onDownloadTap: () =>
          ref.read(subtitleQuizProvider.notifier).tapDownload(),
      onMoreTap: () =>
          ref.read(subtitleQuizProvider.notifier).tapSettings(),
      showShareButton: true,
      showSaveButton: true,
      showDownloadButton: true,
      showMoreButton: true,
      hintUsed: _hintUsed,
      onHintTap: () => setState(() => _hintUsed = true),
      highlightCC: _hintUsed && state.status == QuizStatus.playing && !state.video.subtitlesEnabled,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: StreamingQuizConfig.quiz1SubtitleTimeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
          ),
        if (state.isSettingsOpen)
          StreamingOverlayMenu(
            onDismiss: () =>
                ref.read(subtitleQuizProvider.notifier).dismissSettings(),
            child: StreamingMoreMenu(
              video: state.video,
              onSubtitleTap: () {
                ref.read(subtitleQuizProvider.notifier).dismissSettings();
                ref.read(subtitleQuizProvider.notifier).tapCC();
              },
              onQualityTap: () {},
              onSpeedTap: () {},
              onDismiss: () =>
                  ref.read(subtitleQuizProvider.notifier).dismissSettings(),
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
                ref.read(subtitleQuizProvider.notifier).retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              isLimitReached: ref.watch(isPlayLimitReachedProvider).valueOrNull ?? false,
              insight: Builder(
                builder: (context) {
                  final insight = context.s.quiz1.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '📺',
                        title: insight.ccTitle,
                        desc: insight.ccDesc,
                      ),
                      QuizInsightItem(
                        emoji: '👀',
                        title: insight.visibilityTitle,
                        desc: insight.visibilityDesc,
                      ),
                      QuizInsightItem(
                        emoji: '🔴',
                        title: insight.feedbackTitle,
                        desc: insight.feedbackDesc,
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



