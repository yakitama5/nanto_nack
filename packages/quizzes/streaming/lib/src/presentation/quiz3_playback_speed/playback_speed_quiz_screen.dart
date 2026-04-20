import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/domain/streaming_quiz_config.dart';
import 'package:system/system.dart';
import 'package:streaming/src/i18n/streaming_translations_extension.dart';
import 'package:streaming/src/presentation/quiz3_playback_speed/playback_speed_quiz_notifier.dart';
import 'package:streaming/src/presentation/streaming_overlay_menu.dart';
import 'package:streaming/src/presentation/streaming_player_screen.dart';

class PlaybackSpeedQuizScreen extends ConsumerStatefulWidget {
  const PlaybackSpeedQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<PlaybackSpeedQuizScreen> createState() => _PlaybackSpeedQuizScreenState();
}

class _PlaybackSpeedQuizScreenState extends ConsumerState<PlaybackSpeedQuizScreen> {
  bool _showCutIn = true;
  bool _hintUsed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(playbackSpeedQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(playbackSpeedQuizProvider);
    final missionText = context.s.quiz3.missionText;

    return StreamingPlayerScreen(
      video: state.video,
      isPlaying: state.status == QuizStatus.playing,
      progressSeconds: 300,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: StreamingQuizConfig.quiz3PlaybackSpeedTimeLimitSeconds,
      missionText: missionText,
      onGiveUp: () => ref.read(playbackSpeedQuizProvider.notifier).giveUp(),
      onMoreTap: () => ref.read(playbackSpeedQuizProvider.notifier).tapSettings(),
      onLongPressStart: () => ref.read(playbackSpeedQuizProvider.notifier).longPressStart(),
      onLongPressEnd: () => ref.read(playbackSpeedQuizProvider.notifier).longPressEnd(),
      onLikeTap: () => ref.read(playbackSpeedQuizProvider.notifier).tapLike(),
      onSaveTap: () => ref.read(playbackSpeedQuizProvider.notifier).tapSave(),
      onDownloadTap: () =>
          ref.read(playbackSpeedQuizProvider.notifier).tapDownload(),
      showShareButton: true,
      showSaveButton: true,
      showDownloadButton: true,
      showMoreButton: true,
      hintUsed: _hintUsed,
      onHintTap: () => setState(() => _hintUsed = true),
      highlightMore: _hintUsed && state.status == QuizStatus.playing && !state.isSettingsOpen,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: StreamingQuizConfig.quiz3PlaybackSpeedTimeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
          ),
        // 設定メニュー
        if (state.isSettingsOpen && !state.isSpeedListOpen)
          StreamingOverlayMenu(
            onDismiss: () => ref.read(playbackSpeedQuizProvider.notifier).dismissSettings(),
            child: StreamingMoreMenu(
              video: state.video,
              onSubtitleTap: () {},
              onQualityTap: () {},
              onSpeedTap: () => ref.read(playbackSpeedQuizProvider.notifier).tapSpeedMenu(),
              onDismiss: () => ref.read(playbackSpeedQuizProvider.notifier).dismissSettings(),
            ),
          ),
        // 再生速度リスト
        if (state.isSpeedListOpen)
          StreamingOverlayMenu(
            onDismiss: () => ref.read(playbackSpeedQuizProvider.notifier).dismissSettings(),
            child: StreamingSelectionList(
              title: context.s.common.playbackSpeed,
              items: const ['0.25x', '0.5x', '0.75x', 'Normal', '1.25x', '1.5x', '1.75x', '2x'],
              selectedItem: state.video.playbackSpeed == 1.0 ? 'Normal' : '${state.video.playbackSpeed}x',
              onSelected: (val) {
                final speed = val == 'Normal' ? 1.0 : double.tryParse(val.replaceAll('x', '')) ?? 1.0;
                ref.read(playbackSpeedQuizProvider.notifier).selectSpeed(speed);
              },
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
                ref.read(playbackSpeedQuizProvider.notifier).retry();
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
                        emoji: '👆',
                        title: insight.gestureTitle,
                        desc: insight.gestureDesc,
                      ),
                      QuizInsightItem(
                        emoji: '⚙️',
                        title: insight.gearTitle,
                        desc: insight.gearDesc,
                      ),
                      QuizInsightItem(
                        emoji: '🔢',
                        title: insight.speedTitle,
                        desc: insight.speedDesc,
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

